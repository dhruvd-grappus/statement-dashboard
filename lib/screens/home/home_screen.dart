import 'package:smart_admin_dashboard/responsive.dart';
import 'package:smart_admin_dashboard/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import 'components/side_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: DashboardScreen(),
      ),
    );
  }
}
