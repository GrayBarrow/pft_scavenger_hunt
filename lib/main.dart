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
  late Map<String, Map<String, dynamic>> _locationData;
  late Map<String, bool> _foundLocations;

  @override
  void initState() {
    super.initState();
    _initializeLocationData();
  }

  void _initializeLocationData() {
    // Create location data based on the current floor
    switch (widget.floorNumber) {
      case 1:
        _locationData = {
          '1108': {
            'position': const Offset(0.73, 0.87), 
            'question': 'What is the name of the logo on the availability device below the room number?', 
            'keyword': 'creston', 
            'image': 'assets/floor1/1108-availabilityDevice.jpg'
          },
          '1269': {
            'position': const Offset(0.73, 0.42), 
            'question': 'What oil company is this center named after?',
            'keyword': 'chevron', 
            'image': 'assets/floor1/1269-chevron.jpg'
          },
          '1344': {
            'position': const Offset(0.58, 0.24), 
            'question': 'What animal is on the sticker on the window of this door?',
            'keyword': 'tiger', 
            'image': 'assets/floor1/1344-sticker.jpg'
          },
          'Cambre Atrium': {
            'position': const Offset(0.35, 0.72), 
            'question': 'What is the color of the middle banner in the cambre atrium?',
            'keyword': 'purple', 
            'image': 'assets/floor1/atrium-banner.jpg'
          },
          '1355': {
            'position': const Offset(0.3, 0.17), 
            'question': 'What is the first word of the caution sign on this door?',
            'keyword': 'eye', 
            'image': 'assets/floor1/1355-cautionSign.jpg'
          },
          'Capstone Stairs': {
            'position': const Offset(0.6, 0.36), 
            'question': 'How many large wooden steps are there?',
            'keyword': '11', 
            'image': 'assets/floor1/stairs.jpg'
          },
        };
        break;
      case 2:
        _locationData = {
          '2348': {
            'position': const Offset(0.39, 0.25), 
            'question': 'What is the nickname of the person on the plaque near this door?', 
            'keyword': 'pepper', 
            'image': 'assets/floor2/2348-plaque.jpg'
          },
          '2367': {
            'position': const Offset(0.15, 0.22), 
            'question': 'What does the bright orange sticker on this door say?', 
            'keyword': 'biohazard', 
            'image': 'assets/floor2/2367-sticker.jpg'
          },
          '2254': {
            'position': const Offset(0.15, 0.5), 
            'question': 'On the right wall near this door, what does the sticker on the outlet say?', 
            'keyword': '15-p2d3', 
            'image': 'assets/floor2/2254-outlet.jpg'
          },
          '2228': {
            'position': const Offset(0.72, 0.42), 
            'question': 'What is on the highest shelf in the left wall of the lobby in this room?', 
            'keyword': 'helmets', 
            'image': 'assets/floor2/2228-shelf.jpg'
          },
          '2132': {
            'position': const Offset(0.54, 0.88), 
            'question': 'What is the nickname of the man whose plaque is next to this room?', 
            'keyword': 'dub', 
            'image': 'assets/floor2/2132-plaque.jpg'
          },
          'Across from 2136': {
            'position': const Offset(0.45, 0.85), 
            'question': 'What is the name of the leftmost robot in the display case?', 
            'keyword': 'mike wazowski', 
            'image': 'assets/floor2/2136-robot.jpg'
          },
        };
        break;
      case 3:
        _locationData = {
          'Across 3122': {
            'position': const Offset(0.45, 0.85), 
            'question': 'What is the name of the company whose logo is on the top shelf of the left display case?', 
            'keyword': 'alliance', 
            'image': 'assets/floor3/across3122-alliance.jpg'
          },
          '3107': {
            'position': const Offset(0.82, 0.82), 
            'question': 'What is the name of the deans seminar suite?', 
            'keyword': 'greg elliot', 
            'image': 'assets/floor3/3107-deanSuite.jpg'
          },
          '3261': {
            'position': const Offset(0.33, 0.48), 
            'question': 'What is displayed in this room?', 
            'keyword': 'car', 
            'image': 'assets/floor3/3261-car.jpg'
          },
          '3270': {
            'position': const Offset(0.13, 0.58), 
            'question': 'What department does this room belong to?', 
            'keyword': 'computer science', 
            'image': 'assets/floor3/3270-CSC.jpg'
          },
          '3316H': {
            'position': const Offset(0.38, 0.1), 
            'question': 'Who is in this room?', 
            'keyword': 'brian briggs', 
            'image': 'assets/floor3/3316H-BrianBriggs.jpg'
          },
          'Exit stairs': {
            'position': const Offset(0.84, 0.17), 
            'question': 'What is the color of the fittings in the pipe in this stairwell?', 
            'keyword': 'red', 
            'image': 'assets/floor3/exitStairs-pipes.jpg'
          },
        };
        break;
      default:
        _locationData = {};
    }

    // Initialize all locations as not found
    _foundLocations = Map.fromIterables(
      _locationData.keys,
      List.filled(_locationData.length, false),
    );
  }

  void _checkKeyword(String keyword, String location) {
    if (keyword.trim().toLowerCase() == _locationData[location]!['keyword'].toLowerCase()) {
      setState(() {
        _foundLocations[location] = true;
      });

      if (_foundLocations.values.every((found) => found)) {
        _showPopup('You found all the locations on Floor ${widget.floorNumber}!');
      } else {
        _showPopupWithImage('You found $location!', _locationData[location]!['image']);
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

  void _showPopupWithImage(String message, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
            const SizedBox(height: 10),
            // Container with fixed size to constrain the image
            Container(
              constraints: const BoxConstraints(
                maxWidth: 250, // Maximum width for the image
                maxHeight: 200, // Maximum height for the image
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain, // Keep aspect ratio and fit within the constraints
              ),
            ),
          ],
        ),
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
              onTap: () {
                Navigator.pop(context);
                if (widget.floorNumber != 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FloorPage(1)),
                  );
                }
              },
            ),
            ListTile(
              title: const Text('Floor 2'),
              onTap: () {
                Navigator.pop(context);
                if (widget.floorNumber != 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FloorPage(2)),
                  );
                }
              },
            ),
            ListTile(
              title: const Text('Floor 3'),
              onTap: () {
                Navigator.pop(context);
                if (widget.floorNumber != 3) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const FloorPage(3)),
                  );
                }
              },
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
                    'assets/floor${widget.floorNumber}/floor${widget.floorNumber}.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              for (var entry in _locationData.entries)
                Positioned(
                  left: xOffset + entry.value['position'].dx * imageWidth,
                  top: yOffset + entry.value['position'].dy * imageHeight,
                  child: GestureDetector(
                    onTap: () => _showKeywordDialog(entry.key),
                    child: CircleAvatar(
                      backgroundColor: _foundLocations[entry.key]! ? Colors.green : Colors.red,
                      radius: 6 * scaleFactor,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showProgressDialog();
        },
        child: const Icon(Icons.check_circle_outline),
        tooltip: 'Check Progress',
      ),
    );
  }

  void _showKeywordDialog(String location) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(location),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(_locationData[location]!['question']),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter your answer'),
            ),
          ],
        ),
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

  void _showProgressDialog() {
    int found = _foundLocations.values.where((found) => found).length;
    int total = _foundLocations.length;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Floor ${widget.floorNumber} Progress'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Found: $found out of $total locations'),
            const SizedBox(height: 10),
            ...(_foundLocations.entries.map((entry) => 
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Row(
                  children: [
                    Icon(
                      entry.value ? Icons.check_circle : Icons.circle_outlined,
                      color: entry.value ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(child: Text(entry.key, style: TextStyle(
                      color: entry.value ? Colors.black : Colors.grey,
                    ))),
                  ],
                ),
              )
            )),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}