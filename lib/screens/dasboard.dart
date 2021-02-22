
import 'package:budget_tracker_ui_clone/screens/budget_screen.dart';
import 'package:budget_tracker_ui_clone/screens/create_budget_screen.dart';
import 'package:budget_tracker_ui_clone/screens/daily_screen.dart';
import 'package:budget_tracker_ui_clone/screens/login_screen.dart';
import 'package:budget_tracker_ui_clone/screens/profile_screen.dart';
import 'package:budget_tracker_ui_clone/screens/stats_screen.dart';
import 'package:budget_tracker_ui_clone/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int pageIndex = 0;
  List<Widget> pages = [
    DailyScreen(),
    StatsScreens(),
    BudgetScreen(),
    ProfileScreen(),
    CreateBudgetScreen()
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future <AlertDialog> _showSureToExitDialog(BuildContext context, String title, String content,) {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            FlatButton(
                child: Text(
                  "No",
                  style: TextStyle(fontSize: 18,color: Colors.redAccent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            FlatButton(
                child: Text(
                  "Yes",

                  style: TextStyle(fontSize: 18,color: Colors.redAccent),
                ),
                onPressed: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => LoginScreen()));
                }),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
          body: getBody(),
          bottomNavigationBar: getFooter(),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                selectedTab(4);
              },
              child: Icon(
                Icons.add,
                size: 25,
              ),
              backgroundColor: Colors.pink
              //params
              ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked),
      onWillPop: () async {
        _showSureToExitDialog(context,'Exit',
          'Are you sure want to exit?',);
        return false;
      },
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.md_calendar,
      Ionicons.md_stats,
      Ionicons.md_wallet,
      Ionicons.ios_person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
