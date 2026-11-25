import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CommonNavigationView extends StatelessWidget {
  const CommonNavigationView({
    super.key,
    required this._child,
    required this._path,
    this.pageTitle,
  });

  final Widget _child;
  final String _path;
  final String? pageTitle;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(pageTitle ?? ""),
      backgroundColor: Colors.transparent,
    ),
    body: Stack(
      children: [
        Padding(padding: const EdgeInsets.only(bottom: 70), child: _child),
        _buildBottomNavigation(context),
      ],
    ),
  );

  Align _buildBottomNavigation(BuildContext context) => Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      margin: _navigationMargin(context),
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
      decoration: _navigationBoxDecoration(context),
      child: _buildNavigationItems(context),
    ),
  );

  EdgeInsets _navigationMargin(BuildContext context) {
    var systemGestureInsets = MediaQuery.systemGestureInsetsOf(context);
    if (Platform.isAndroid &&
        (systemGestureInsets.left == 0 && systemGestureInsets.right == 0)) {
      return const EdgeInsets.all(50);
    }

    return const EdgeInsets.all(20);
  }

  BoxDecoration _navigationBoxDecoration(BuildContext context) => BoxDecoration(
    color: isLightMode(context) ? Colors.black38 : Colors.white38,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [BoxShadow(blurRadius: 0)],
  );

  bool isLightMode(BuildContext context) =>
      Theme.brightnessOf(context) == Brightness.light;

  Row _buildNavigationItems(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _buildNavigationItem(
        context: context,
        icon: FontAwesomeIcons.solidHouse,
        page: "Home",
      ),
      _buildNavigationItem(
        context: context,
        icon: FontAwesomeIcons.gear,
        page: "Settings",
      ),
    ],
  );

  Widget _buildNavigationItem({
    required BuildContext context,
    required FaIconData icon,
    required String page,
    String? displayName,
  }) => GestureDetector(
    onTap: () => context.goNamed(page),
    child: Container(
      height: 50,
      width: 70,
      decoration: _itemBoxDecoration(page),
      padding: EdgeInsets.only(top: 8),
      child: Column(
        children: [
          _iconNavigationItem(icon, page),
          _textNavigationItem(displayName, page),
        ],
      ),
    ),
  );

  Text _textNavigationItem(String? displayName, String page) => Text(
    displayName ?? page,
    style: TextStyle(
      fontSize: 9,
      color: Colors.white70,
      fontWeight: isCurrentPage(page) ? FontWeight.bold : FontWeight.w400,
    ),
  );

  Icon _iconNavigationItem(FaIconData icon, String page) => Icon(
    icon.data,
    color: isCurrentPage(page) ? Colors.white70 : Colors.white60,
  );

  bool isCurrentPage(String page) => (page == _path);

  BoxDecoration _itemBoxDecoration(String page) => BoxDecoration(
    borderRadius: BorderRadius.circular(22),
    color: isCurrentPage(page) ? Colors.grey.shade800 : Colors.transparent,
  );
}
