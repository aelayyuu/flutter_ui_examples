import 'package:flutter_ui_examples/app_theme.dart';
import 'package:flutter_ui_examples/custom_drawer/drawer_user_controller.dart';
import 'package:flutter_ui_examples/custom_drawer/home_drawer.dart';
import 'package:flutter_ui_examples/feedback_screen.dart';
import 'package:flutter_ui_examples/help_screen.dart';
import 'package:flutter_ui_examples/home_screen.dart';
import 'package:flutter_ui_examples/invite_friend_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  State<NavigationHomeScreen> createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.home;
    screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.home:
          setState(() {
            screenView = const MyHomePage();
          });
          break;
        case DrawerIndex.help:
          setState(() {
            screenView = const HelpScreen();
          });
          break;
        case DrawerIndex.feedBack:
          setState(() {
            screenView = const FeedbackScreen();
          });
          break;
        case DrawerIndex.invite:
          setState(() {
            screenView = const InviteFriend();
          });
          break;
        default:
          break;
      }
    }
  }
}
