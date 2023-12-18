import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../drawerMain/mainPage.dart';

class HomePage extends StatelessWidget {
  final VoidCallback openDrawer;
  final DrawerState drawerState = DrawerState();

  HomePage({
    Key? key,
    required this.openDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color scaffoldBackgroundColor = drawerState.isDrawerOpen == true
        ? Colors.transparent
        : Colors.deepPurple;

    Color appBarBackgroundColor = drawerState.isDrawerOpen == true
        ? Colors.transparent
        : Colors.deepPurple;

    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.bars),
          color: Colors.white,
          onPressed: openDrawer,
        ),
        backgroundColor: appBarBackgroundColor, // Set AppBar background color
        elevation: 0.0,
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 55.0),
            child: Text(
              "HOME",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Container(
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
        backgroundColor:
            Colors.deepPurple, // Set the background color to purple
      ),
    );
  }
}
