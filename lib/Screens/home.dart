import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:nutriapp/Providers/storageProvider.dart';
import 'package:nutriapp/Resources/assets.dart';
import 'package:nutriapp/Screens/Auth/login.dart';
import 'package:nutriapp/Screens/Main/notifications.dart';
import 'package:nutriapp/Screens/profile.dart';
import 'package:nutriapp/Services/greetings.dart';
import 'package:nutriapp/Services/storage.dart';
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
  late LocalStorageProvider storageProvider;

  @override
  void didChangeDependencies() {
    storageProvider = Provider.of<LocalStorageProvider>(context);
    super.didChangeDependencies();
  }

  void _onItemTapped(int index) {
    Provider.of<AppState>(context, listen: false).setBottomNavIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.primaryColor,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Nutritz',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(IconlyLight.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                appState.setBottomNavIndex(0);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(CupertinoIcons.arrow_up),
              title: Text("Progress"),
              onTap: () {
                Navigator.pop(context);
                appState.setBottomNavIndex(1);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: SvgPicture.asset(
                AssetsLoader.food,
                color: Colors.white,
                width: 25,
              ),
              title: Text("Diet suggestions"),
              onTap: () {
                Navigator.pop(context);
                appState.setBottomNavIndex(2);
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: SvgPicture.asset(
                AssetsLoader.chat,
                width: 25,
                color: Colors.white,
              ),
              title: Text("NutriBot"),
              onTap: () {
                Navigator.pop(context);
                appState.setBottomNavIndex(3);
              },
            ),
          
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
            ),
            ListTile(
              iconColor: Colors.white,
              textColor: Colors.white,
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () async {
                appState.setBottomNavIndex(0);
                await LocalStorage.logout();
                await Provider.of<LocalStorageProvider>(context, listen: false)
                    .initialize();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                    (route) => false);
              },
            ),
          ],
        ),
      ),
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
      appBar: appState.bottomNavIndex != 3
          ? PreferredSize(
              preferredSize:
                  Size(SizeConfig.screenWidth, SizeConfig.screenHeight * .12),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).copyWith(left: 16),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://t4.ftcdn.net/jpg/05/49/98/39/360_F_549983970_bRCkYfk0P6PP5fKbMhZMIb07mCJ6esXL.jpg'),
                                radius: 24,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
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
                                    storageProvider.user!.full_name.toString(),
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
                            Builder(builder: (context) {
                              return IconButton(
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  icon: SvgPicture.asset(
                                    AssetsLoader.drawer,
                                    width: 25,
                                    color: AppColors.primaryColor,
                                  ));
                            }),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Divider(
                        color: AppColors.dividerColor,
                      ),
                    )
                  ],
                ),
              ))
          : null,
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
