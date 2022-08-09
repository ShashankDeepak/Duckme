// ignore_for_file: prefer_const_constructors

import 'package:duckme/pages/form.dart';
import 'package:duckme/pages/home.dart';
import 'package:duckme/pages/profile_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
// import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PersistentNavBar extends StatefulWidget {
  const PersistentNavBar({Key? key}) : super(key: key);

  @override
  State<PersistentNavBar> createState() => _PersistentNavBarState();
}

class _PersistentNavBarState extends State<PersistentNavBar> {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(
      initialIndex: 0,
    );

    List<PersistentBottomNavBarItem> _navBarsItems() {
      return [
        PersistentBottomNavBarItem(
          icon: Icon(Icons.home),
          title: ("Home"),
          activeColorPrimary: Colors.grey[100]!,
          activeColorSecondary: Colors.black,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(MdiIcons.fileDocumentEditOutline),
          title: ("Form"),
          activeColorPrimary: Colors.grey[100]!,
          activeColorSecondary: Colors.black,
          inactiveColorPrimary: Colors.black,
        ),
        PersistentBottomNavBarItem(
          icon: Icon(Icons.person),
          title: ("Profile"),
          activeColorPrimary: Colors.grey[100]!,
          activeColorSecondary: Colors.black,
          inactiveColorPrimary: Colors.black,
        ),
      ];
    }

    return PersistentTabView(
      context,
      padding: NavBarPadding.only(left: 10, right: 10),
      backgroundColor: Colors.grey[100]!,
      controller: _controller,
      screens: [Home(), FormPage(), ProfilePage()],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
