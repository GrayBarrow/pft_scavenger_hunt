import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(ScavengerHuntApp());
}

class ScavengerHuntApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PFT Scavenger Hunt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF3498DB),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3498DB),
          secondary: const Color(0xFFE74C3C),
          brightness: Brightness.light,
        ),
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xFF2980B9),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2980B9),
          secondary: const Color(0xFFE74C3C),
          brightness: Brightness.dark,
        ),
        fontFamily: 'Poppins',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 3,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey.shade800,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
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

class _FloorPageState extends State<FloorPage> with SingleTickerProviderStateMixin {
  late Map<String, Map<String, dynamic>> _locationData;
  late Map<String, bool> _foundLocations;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _initializeLocationData();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _initializeLocationData() {
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
            'image': 'assets/floor2/2348-namePlaque.jpg'
          },
          '2367': {
            'position': const Offset(0.15, 0.22), 
            'question': 'What does the bright orange sticker on this door say?', 
            'keyword': 'biohazard', 
            'image': 'assets/floor2/2367-biohazard.jpg'
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
            'image': 'assets/floor2/2228-helmets.jpg'
          },
          '2132': {
            'position': const Offset(0.54, 0.88), 
            'question': 'What is the nickname of the man whose plaque is next to this room?', 
            'keyword': 'dub', 
            'image': 'assets/floor2/2132-dubNamePlaque.jpg'
          },
          'Across from 2136': {
            'position': const Offset(0.45, 0.85), 
            'question': 'What is the name of the leftmost robot in the display case?', 
            'keyword': 'mike wazowski', 
            'image': 'assets/floor2/across2136-bot.jpg'
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

  //CHANGE: modify this so it shows image success before all success
  void _checkKeyword(String keyword, String location) {
    if (keyword.trim().toLowerCase() == _locationData[location]!['keyword'].toLowerCase()) {
      setState(() {
        _foundLocations[location] = true;
      });
      _showSuccessPopupWithImage('You found $location!', _locationData[location]!['image']);

      if (_foundLocations.values.every((found) => found)) {
        _showSuccessPopup('You found all the locations on Floor ${widget.floorNumber}!');
      } 
      // else {
      //   _showSuccessPopupWithImage('You found $location!', _locationData[location]!['image']);
      // }
    } else {
      _showErrorPopup('Incorrect answer. Try again.');
    }
  }

  //shows for when you get all locations on floor
  void _showSuccessPopup(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.emoji_events, color: Colors.amber, size: 30),
            SizedBox(width: 10),
            Text('Success!', style: TextStyle(color: Colors.green)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Text(message, style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 20),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
        elevation: 5,
        backgroundColor: Theme.of(context).brightness == Brightness.dark ? Colors.grey.shade800 : Colors.white,
      ),
    );
  }

  //shows when you get a location question right
  void _showSuccessPopupWithImage(String message, String imagePath) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 10),
            Text('Great job!'),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            // Container with fixed size to constrain the image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                constraints: const BoxConstraints(
                  maxWidth: 250, // Maximum width for the image
                  maxHeight: 200, // Maximum height for the image
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain, // Keep aspect ratio and fit within the constraints
                ),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text('Continue Hunt'),
            ),
          ),
        ],
        elevation: 5,
      ),
    );
  }

  void _showErrorPopup(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red, size: 28),
            SizedBox(width: 10),
            Text('Oops!'),
          ],
        ),
        content: Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Try Again'),
          ),
        ],
        elevation: 3,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'Floor ${widget.floorNumber}',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
          ),
        ),
      ),
      drawer: _buildStylishDrawer(),
      //understand FadeTransition
      body: FadeTransition(
        opacity: _animation,
        child: LayoutBuilder(
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

            return Container(
              //the background
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                    Theme.of(context).colorScheme.surface,
                  ],
                ),
              ),
              //map and everything else
              child: Stack(
                children: [
                  //map
                  Center(
                    child: Container(
                      width: imageWidth,
                      height: imageHeight,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.2),
                            blurRadius: 15,
                            offset: const Offset(0, 5),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/floor${widget.floorNumber}/floor${widget.floorNumber}.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  //location markers
                  for (var entry in _locationData.entries)
                    Positioned(
                      //these say where they should be on screen
                      left: xOffset + entry.value['position'].dx * imageWidth,
                      top: yOffset + entry.value['position'].dy * imageHeight,
                      //understand tweenAnimationBuilder
                      //I think this is what scales with the screen
                      child: TweenAnimationBuilder<double>(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: const Duration(milliseconds: 400),
                        builder: (context, value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        },
                        //creates widget that does something when tapped
                        child: GestureDetector(
                          onTap: () => _showKeywordDialog(entry.key),
                          child: Container(
                            width: 12 * scaleFactor,
                            height: 12 * scaleFactor,
                            //circe icon with white border and shadow
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _foundLocations[entry.key]! ? Colors.green.withValues(alpha: 0.9) : Colors.red.withValues(alpha: 0.9),
                              border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _foundLocations[entry.key]! ? Colors.green.withValues(alpha: 0.5) : Colors.red.withValues(alpha: 0.5),
                                  blurRadius: 6 * scaleFactor,
                                  spreadRadius: 2 * scaleFactor,
                                ),
                              ],
                            ),
                            //white icon inside circle
                            child: Center(
                              child: Icon(
                                _foundLocations[entry.key]! ? Icons.check : Icons.question_mark,
                                color: Colors.white,
                                size: 8 * scaleFactor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
      //check progress button
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton.extended(
          onPressed: () {
            _showProgressDialog();
          },
          icon: const Icon(Icons.check_circle_outline),
          label: const Text('Progress'),
          tooltip: 'Check Progress',
          elevation: 4,
        ),
      ),
      
    );
  }

  //sidebar for navigating floors
  Widget _buildStylishDrawer() {
    Color selectedColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.blue.shade700
        : Colors.blue.shade100;
    
    return Drawer(
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Icon(
                      Icons.map_outlined,
                      color: Colors.white,
                      size: 32,
                    ),
                    SizedBox(width: 16),
                    Text(
                      'Scavenger Hunt',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.white30, thickness: 1, height: 1),
              Expanded(
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      _buildFloorTile(1, selectedColor),
                      _buildFloorTile(2, selectedColor),
                      _buildFloorTile(3, selectedColor),
                      const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //each button floor
  Widget _buildFloorTile(int floor, Color selectedColor) {
    bool isSelected = (widget.floorNumber == floor);
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: isSelected ? Border.all(color: Theme.of(context).primaryColor, width: 2) : null,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: Icon(
          Icons.location_on,
          color: isSelected ? Theme.of(context).primaryColor : null,
        ),
        title: Text(
          'Floor $floor',
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Theme.of(context).primaryColor : null,
          ),
        ),
        trailing: isSelected ? Icon(Icons.check_circle) : null,
        onTap: () {
          Navigator.pop(context);
          if (widget.floorNumber != floor) {
            Navigator.pushReplacement(
              context,
              //try and understand this
              //it seems PageRouteBuilder has two parameters:
              //first is what page to build, required, is a function with animation
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => FloorPage(floor),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  var begin = const Offset(1.0, 0.0);
                  var end = Offset.zero;
                  var curve = Curves.easeOutCubic;
                  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }

  //
  void _showKeywordDialog(String location) {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Text(
              location,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Container(
              height: 4,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                ),
              ),
              child: Text(
                _locationData[location]!['question'],
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Enter your answer',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => controller.clear(),
                ),
              ),
              autofocus: true,
              onSubmitted: (value) {
                Navigator.pop(context);
                _checkKeyword(value, location);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _checkKeyword(controller.text, location);
            },
            child: const Text('Submit'),
          ),
        ],
        elevation: 8,
      ),
    );
  }

  void _showProgressDialog() {
    int found = _foundLocations.values.where((found) => found).length;
    int total = _foundLocations.length;
    double progress = total > 0 ? found / total : 0;
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Column(
          children: [
            Text(
              'Floor ${widget.floorNumber} Progress',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Found: $found out of $total locations (${(progress * 100).toInt()}%)',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
        content: Container(
          width: double.maxFinite,
          constraints: const BoxConstraints(maxHeight: 300),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _foundLocations.entries.map((entry) => 
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: entry.value 
                        ? Colors.green.withOpacity(0.1) 
                        : Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: entry.value ? Colors.green.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        entry.value ? Icons.check_circle : Icons.circle_outlined,
                        color: entry.value ? Colors.green : Colors.grey,
                        size: 24,
                      ),
                      const SizedBox(width: 12),
                      Expanded(child: Text(
                        entry.key, 
                        style: TextStyle(
                          color: entry.value ? Colors.black : Colors.grey,
                          fontWeight: entry.value ? FontWeight.bold : FontWeight.normal,
                        ),
                      )),
                    ],
                  ),
                )
              ).toList(),
            ),
          )
        )
      )
    );
  }
}