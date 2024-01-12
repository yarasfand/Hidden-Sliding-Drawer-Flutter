import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiddendrawer/DrawerContent/drawerPages/homepage.dart';
import 'package:hiddendrawer/DrawerContent/drawerPages/profilePage.dart';
import 'package:hiddendrawer/DrawerContent/drawerPages/settings.dart';
import 'package:hiddendrawer/globalVariable/globalVars.dart';
import '../drawer_bloc/drawerk_bloc.dart';
import 'drawer.dart';
import 'draweritems.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DrawerkBloc dashBloc = DrawerkBloc();
  late double xContractExpand = 0;
  late double yContractExpand = 0;
  late double scaleFactor;
  bool isDragging = false;
  bool isDrawerOpen = false;
  DrawerItem item = DrawerItems.home;

  @override
  void initState() {
    super.initState();
    closeDrawer();
  }

  void openDrawer() {
    setState(() {
      xContractExpand = 230;
      yContractExpand = 170;
      scaleFactor = 0.6;
      isDrawerOpen = true;
      GlobalVars.isTransparent = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xContractExpand = 0;
      yContractExpand = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
      GlobalVars.isTransparent = false;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Stack(
          children: [
            buildDrawer(),
            buildPage(),
          ],
        ),
      );

  Widget buildDrawer() => SafeArea(
        child: AnimatedOpacity(
          opacity: isDrawerOpen ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 300),
          child: Container(
            width: xContractExpand,
            child: MyDrawer(
              onSelectedItems: (selectedItem) {
                setState(() {
                  item = selectedItem;
                  closeDrawer();
                });

                switch (item) {
                  case DrawerItems.home:
                    dashBloc.add(NavigateToHomeEvent());
                    break;

                  case DrawerItems.settings:
                    dashBloc.add(NavigateToSettingsEvent());
                    break;

                  case DrawerItems.profile:
                    dashBloc.add(NavigateToProfileEvent());
                    break;

                  case DrawerItems.logout:
                    dashBloc.add(NavigateToLogoutEvent());
                    break;

                  default:
                    dashBloc.add(NavigateToLogoutEvent());
                    break;
                }
              },
            ),
          ),
        ),
      );

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          const delta = 1;

          if (!isDragging) return;

          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(xContractExpand, yContractExpand, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen
                    ? Colors.white12.withOpacity(0.23)
                    : Colors.deepPurple,
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    return BlocBuilder<DrawerkBloc, DrawerkState>(
      bloc: dashBloc,
      builder: (context, state) {
        if (state is NavigateToProfileState) {
          return ProfilePage(openDrawer: openDrawer);
        } else if (state is NavigateToSettingsState) {
          return Settings(openDrawer: openDrawer);
        } else if (state is NavigateToHomeState) {
          return HomePage(openDrawer: openDrawer);
        } else if (state is NavigateToLogoutState) {
          return HomePage(openDrawer: openDrawer);
        } else {
          return HomePage(openDrawer: openDrawer);
        }
      },
    );
  }
}
