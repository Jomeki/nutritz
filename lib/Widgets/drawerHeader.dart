import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class SidebarHeader extends StatelessWidget {
  const SidebarHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final userData = Provider.of<AuthService>(context);
    return Container(
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
          color: Colors.indigo,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top * 0.6),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:  EdgeInsets.only(right: 8.0,top: 5),
              child: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 32,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
    //             SizedBox(
    //               height: 30,
    //             ),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 // if(userData.user!.name.toString()=='null')...[Image.asset('images/profile.png')] else...[Image.network(
    //                 //   'https://ui-avatars.com/api/?name=${userData.user!.name.toString()}&rounded=true&size=90&bold=true&background=0e1b40&color=ffffff',
    //                 //   width: 60,
    //                 //   height: 60,
    //                 // )],
    //                 SizedBox(
    //                   width: 15,
    //                 ),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       userData.user!.name.toString(),
    //                       style: GoogleFonts.lato(
    //                           fontSize: SizeConfig.fontSize20,
    //                           fontWeight: FontWeight.w500,
    //                           color: Colors.white),
    //                     ),
    //                     Text(
    // userData.user!.isAdmin==1? 'Owner':'Employee',
    //                       style: GoogleFonts.lato(
    //                           fontSize: SizeConfig.fontSize14,
    //                           fontWeight: FontWeight.w400,
    //                           color: Colors.white),
    //                     ),
    //                   ],
    //                 )
    //               ],
    //             ),
    //             SizedBox(
    //               height: 20,
    //             ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}