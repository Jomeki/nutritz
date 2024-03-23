import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Screens/Main/notifications.dart';
import 'package:nutriapp/Services/greetings.dart';
import 'package:nutriapp/Themes/colors.dart';
import 'package:provider/provider.dart';
import '../Providers/appState.dart';
import '../Services/ScreenSizes.dart';
import '../Widgets/drawerHeader.dart';
import '../Widgets/drawerbody.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onItemTapped(int index) {
    Provider.of<AppState>(context, listen: false).setBottomNavIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      // backgroundColor: Colors.white.withOpacity(0.95),
      // drawerEnableOpenDragGesture: false,
      // drawer: SideBarDrawer(),
      // appBar: AppBar(
      //   leading: Builder(
      //     builder: (BuildContext context) {
      //       return IconButton(
      //         icon: const Icon(Icons.menu_open_rounded),
      //         onPressed: () {
      //           Scaffold.of(context).openDrawer();
      //         },
      //         tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      //       );
      //     },
      //   ),
      //   actions: [
      //     // Padding(
      //     //   padding: const EdgeInsets.all(4.0),
      //     //   child: IconButton(onPressed: (){
      //     //     Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
      //     //   },
      //     //       icon: Stack(
      //     //         children:  [
      //     //           Icon(CupertinoIcons.cart,size:34),
      //     //           Positioned(
      //     //             left: 11,
      //     //             bottom: 13,
      //     //             child:Container(
      //     //               width: 19,
      //     //               height: 19,
      //     //                 decoration: BoxDecoration(
      //     //                   color: Colors.indigo,
      //     //                   borderRadius: BorderRadius.circular(30)
      //     //                 ),
      //     //                 child: Center(child: Text(cartProvider.cartSize.toString(),style: TextStyle(color: Colors.white,fontSize: SizeConfig.fontSize12),))),
      //     //           ),
      //     //         ],
      //     //       )
      //     //   ),
      //     // ),
      //     // SizedBox(width: 5,),
      //   ],
      //   title: appState.isBottomNav
      //       ? appState.bottomNavTitles.elementAt(appState.bottomNavIndex)
      //       : appState.sideNavTitles.elementAt(appState.drawerNavIndex),
      // ),
      appBar: PreferredSize(
          preferredSize:
              Size(SizeConfig.screenWidth, SizeConfig.screenHeight * .13),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Image.asset(
                            AssetsLoader.profileImg,
                            width: 60,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${getGreeting()},',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.loginHintColor),
                              ),
                              Text(
                                'John Doe',
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                    color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const NotificationScreen()));}, icon: Icon(CupertinoIcons.bell,color: AppColors.primaryColor,)),
                        IconButton(onPressed: (){}, icon: SvgPicture.asset(AssetsLoader.drawer,width: 25,color: AppColors.primaryColor,)),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                  child: Divider(color: AppColors.dividerColor,),
                )
              ],
            ),
          )),
      body: appState.isBottomNav
          ? appState.bottomNavPages.elementAt(appState.bottomNavIndex)
          : appState.sideNavPages.elementAt(appState.drawerNavIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: appState.bottomNavIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 15,
        items: appState.bottomNav,
        onTap: _onItemTapped,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.black,
      ),
    );
  }

  Widget buildHeader(BuildContext context) => const SidebarHeader();

  Widget buildMenuItem(BuildContext context) {
    return SidebarBody();
  }

  _oldNav(appState) => SizedBox(
        width: SizeConfig.screenWidth,
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.13,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              showSelectedLabels: true,
              showUnselectedLabels: false,
              selectedLabelStyle: TextStyle(
                  fontSize: SizeConfig.fontSize14, fontWeight: FontWeight.w600),
              backgroundColor: CupertinoColors.white,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.indigo,
              type: BottomNavigationBarType.fixed,
              currentIndex: appState.bottomNavIndex,
              iconSize: 30,
              onTap: _onItemTapped,
              elevation: 6,
              items: appState.bottomNav,
            ),
          ),
        ),
      );

  _logout() async {}
}
