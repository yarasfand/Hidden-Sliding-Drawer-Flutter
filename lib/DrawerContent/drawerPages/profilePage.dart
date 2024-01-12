import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../globalVariable/globalVars.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback openDrawer;

  const ProfilePage({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {

    Color scaffoldBackgroundColor = GlobalVars.isTransparent == true
        ? Colors.transparent
        : Colors.white;

    Color appBarBackgroundColor = GlobalVars.isTransparent == true
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
        backgroundColor: appBarBackgroundColor,
        elevation: 0,
        title: const Center(
          child: Padding(
            padding:  EdgeInsets.only(right: 55.0), // Add right padding
            child: Text(
              "PROFILE",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}