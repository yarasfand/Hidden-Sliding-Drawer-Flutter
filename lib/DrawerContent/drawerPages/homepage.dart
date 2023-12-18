import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class HomePage extends StatelessWidget {
  final VoidCallback openDrawer;

  const HomePage({super.key, required this.openDrawer,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.bars),
          color: Colors.white,
          onPressed: openDrawer,
        ),
        backgroundColor: const Color(0xFFE26142),
        elevation: 0,
        title: const Center(
          child: Padding(
            padding:  EdgeInsets.only(right: 55.0), // Add right padding
            child: Text(
              "HOME",
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.teal],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.home,
                size: 80,
                color: Colors.white,
              ),
              SizedBox(height: 20),
              Text(
                'Welcome to My Home Page',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text('Feature 1', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text('Feature 2', style: TextStyle(color: Colors.white)),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.white),
                title: Text('Feature 3', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
          print('Floating Action Button Pressed!');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
