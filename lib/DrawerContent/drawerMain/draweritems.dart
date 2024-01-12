import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'drawer.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: FontAwesomeIcons.house);
  static const profile =
      DrawerItem(title: 'Profile', icon: FontAwesomeIcons.user);
  static const settings =
      DrawerItem(title: 'Settings', icon: FontAwesomeIcons.gear);
  static const logout =
      DrawerItem(title: 'Log Out', icon: FontAwesomeIcons.signOut);

  static final List<DrawerItem> all = [
    home,
    profile,
    settings,
    logout,
  ];
}
