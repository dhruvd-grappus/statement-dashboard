import 'package:smart_admin_dashboard/core/constants/color_constants.dart';
import 'package:smart_admin_dashboard/responsive.dart';

import 'package:smart_admin_dashboard/screens/dashboard/components/recent_users.dart';
import 'package:smart_admin_dashboard/screens/dashboard/components/user_details_widget.dart';
import 'package:flutter/material.dart';

import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Header(),
             
              Flexible(child: Transactions())
            ],
          ),
        ),
      ),
    );
  }
}
