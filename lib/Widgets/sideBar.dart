import 'package:flutter/material.dart';

import 'drawerHeader.dart';
import 'drawerbody.dart';

class SideBarDrawer extends StatelessWidget {
  const SideBarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.6,
      elevation: 8,
      backgroundColor: Colors.indigo,
      child: const Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [SidebarHeader(), SidebarBody()],
      ),
    );
  }
}
