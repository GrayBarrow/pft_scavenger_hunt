import 'package:flutter/material.dart';

void main() {
  runApp(ScavengerHuntApp());
}

class ScavengerHuntApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FloorPage(1),
    );
  }
}

class FloorPage extends StatefulWidget {
  final int floorNumber;

  const FloorPage(this.floorNumber, {super.key});

  @override
  _FloorPageState createState() => _FloorPageState();
}

class _FloorPageState extends State<FloorPage> {
  final Map<String, Offset> _locationPositions = {
    'Location 1': const Offset(0.2, 0.3),
    'Location 2': const Offset(0.5, 0.6),
    'Location 3': const Offset(0.7, 0.2),
  };

  final Map<String, bool> _foundLocations = {
    'Location 1': false,
    'Location 2': false,
    'Location 3': false,
  };

  void _checkKeyword(String keyword, String location) {
    if (keyword.trim().toLowerCase() == location.toLowerCase()) {
      setState(() {
        _foundLocations[location] = true;
      });

      if (_foundLocations.values.every((found) => found)) {
        _showPopup('You found all the locations!');
      } else {
        _showPopup('You found $location!');
      }
    } else {
      _showPopup('Incorrect keyword. Try again.');
    }
  }

  void _showPopup(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Floor ${widget.floorNumber}')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Floors')),
            ListTile(
              title: const Text('Floor 1'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FloorPage(1)),
              ),
            ),
            ListTile(
              title: const Text('Floor 2'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FloorPage(2)),
              ),
            ),
            ListTile(
              title: const Text('Floor 3'),
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FloorPage(3)),
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double imageAspectRatio = 4 / 3;
          double imageWidth = constraints.maxWidth;
          double imageHeight = imageWidth / imageAspectRatio;

          if (imageHeight > constraints.maxHeight) {
            imageHeight = constraints.maxHeight;
            imageWidth = imageHeight * imageAspectRatio;
          }

          double scaleFactor = imageWidth / 400.0; // Base size scaling for markers

          double xOffset = (constraints.maxWidth - imageWidth) / 2;
          double yOffset = (constraints.maxHeight - imageHeight) / 2;

          return Stack(
            children: [
              Center(
                child: SizedBox(
                  width: imageWidth,
                  height: imageHeight,
                  child: Image.asset(
                    'assets/floor${widget.floorNumber}.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              for (var entry in _locationPositions.entries)
                Positioned(
                  left: xOffset + entry.value.dx * imageWidth,
                  top: yOffset + entry.value.dy * imageHeight,
                  child: GestureDetector(
                    onTap: () => _showKeywordDialog(entry.key),
                    child: CircleAvatar(
                      backgroundColor: _foundLocations[entry.key]! ? Colors.green : Colors.red,
                      radius: 10 * scaleFactor,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  void _showKeywordDialog(String location) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter keyword for $location'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _checkKeyword(controller.text, location);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
