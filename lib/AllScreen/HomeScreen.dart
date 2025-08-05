import 'dart:async';
import 'package:delivery_order/AllScreen/AllScreen.dart';
import 'package:delivery_order/AllScreen/ConformScreen.dart';
import 'package:delivery_order/AllScreen/PendingScreen.dart';
import 'package:delivery_order/AllScreen/ProcessingScreen.dart';
import 'package:delivery_order/Controller/LoginController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../Controller/GoogleMapScreenController.dart';
import '../Drawer/DrawerScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int index = 0;
  TabController? tabController;
  LoginController loginController = Get.find();
  late Timer timer;

  GoogleMapScreenController googleMapScreenController = Get.find();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    googleMapScreenController.getLocation();

      timer = Timer.periodic(Duration(seconds: 10), (timer) {
        googleMapScreenController.getLocation();
      });

    tabController = TabController(length: 4, vsync: this);
    tabController?.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: loginController.setAppBarColor(tabController),
          leading: Container(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: DrawerScreen()));
                },
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffE9E9F7), shape: BoxShape.circle),
                    child: Icon(
                      Icons.person,
                      color: Color(0xffB1BBDA),
                      size: 30,
                    )),
              ),
            ),
          ],
        ),
        body: DefaultTabController(
            length: 4,
            child: Column(
              children: [
                Expanded(
                  child: TabBarView(controller: tabController, children: [
                    AllScreen(),
                    PendingScreen(),
                    ProcessingScreen(),
                    ConformScreen(),
                  ]),
                ),
                Container(
                  height: 70,
                  decoration: BoxDecoration(
                      color: loginController.setAppBarColor(tabController),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: Color(0xffFFF6F7),
                    onTap: (value) {
                      tabController?.index = value;
                    },
                    tabs: [
                      _buildTab('images/all.webp', 25, 25, 0),
                      _buildTab('images/pending.webp', 27, 27, 1),
                      _buildTab('images/processing.webp', 35, 35, 2),
                      _buildTab('images/conform.webp', 27, 27, 3),
                    ],
                  ),
                )
              ],
            )));
  }

  Widget _buildTab(String image, double width, double height, int index) {
    final bool isSelected = tabController?.index == index;
    final Color iconColor = isSelected ? const Color(0xffFFF6F7) : Colors.black;
    return Tab(
      child: Image.asset(
        image,
        width: width,
        height: height,
        color: iconColor,
      ),
    );
  }
}
