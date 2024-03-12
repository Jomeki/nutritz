import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../Providers/appState.dart';
import '../Services/ScreenSizes.dart';

class SidebarBody extends StatelessWidget {
  const SidebarBody({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appState = Provider.of<AppState>(context,listen: false);
    // final storage = Provider.of<LocalStorageProvider>(context,listen: false);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          // if(storage.owner!.isAdmin ==1)...[
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 0 ? Colors.indigo : Colors.white,
          //     leading: Icon(CupertinoIcons.printer,
          //         color: appState.drawerNavIndex != 0 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Cashier',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 0 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(0);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 1 ? Colors.indigo : Colors.white,
          //     leading: Icon(Icons.currency_bitcoin_rounded,
          //         color: appState.drawerNavIndex != 1 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'History Transaction',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 1 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(1);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 2 ? Colors.indigo : Colors.white,
          //     leading: Icon(Icons.note_alt_outlined,
          //         color: appState.drawerNavIndex != 2 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Report',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 2 ?Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(2);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 3 ? Colors.indigo : Colors.white,
          //     leading: Icon(Icons.storefront_outlined,
          //         color: appState.drawerNavIndex != 3 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Manage Store',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 3 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(3);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 4 ? Colors.indigo : Colors.white,
          //     leading: Icon(CupertinoIcons.profile_circled,
          //         color: appState.drawerNavIndex != 4 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Account',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 4 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(4);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 5 ? Colors.indigo : Colors.white,
          //     leading: Icon(Icons.help_rounded,
          //         color: appState.drawerNavIndex != 5 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Support',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 5 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(5);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   SizedBox(
          //     height: 28,
          //   ),
          // ]else...[
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 0 ? Colors.indigo : Colors.white,
          //     leading: Icon(CupertinoIcons.printer,
          //         color: appState.drawerNavIndex != 0 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Cashier',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 0 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(0);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 1 ? Colors.indigo : Colors.white,
          //     leading: Icon(Icons.currency_bitcoin_rounded,
          //         color: appState.drawerNavIndex != 1 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'History Transaction',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 1 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(1);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 4 ? Colors.indigo : Colors.white,
          //     leading: Icon(CupertinoIcons.profile_circled,
          //         color: appState.drawerNavIndex != 4 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Account',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 4 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(4);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   ListTile(
          //     tileColor: appState.drawerNavIndex != 5 ? Colors.indigo : Colors.white,
          //     leading: Icon(Icons.help_rounded,
          //         color: appState.drawerNavIndex != 5 ? Colors.white : Colors.indigo),
          //     title: Text(
          //       'Support',
          //       style: GoogleFonts.lato(
          //           fontWeight: FontWeight.w400,
          //           fontSize: SizeConfig.fontSize16,
          //           color: appState.drawerNavIndex != 5 ? Colors.white : Colors.indigo),
          //     ),
          //     onTap: () {
          //       appState.setDrawerNavIndex(5);
          //       Navigator.pop(context);
          //     },
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   Divider(
          //     height: 0,
          //     thickness: 1,
          //     color: Color.fromRGBO(255, 255, 255, 0.15),
          //   ),
          //   SizedBox(
          //     height: 28,
          //   ),
          // ]

        ],
      ),
    );
  }
}
