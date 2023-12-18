import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Settings extends StatelessWidget {
  final VoidCallback openDrawer;

  Settings({required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.bars),
          color: Colors.white,
          onPressed: openDrawer,
        ),
        backgroundColor:Colors.deepPurple,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding:  EdgeInsets.only(right: 55.0), // Add right padding
            child: Text(
              "SETTINGS",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text(
          "SETTINGS",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}