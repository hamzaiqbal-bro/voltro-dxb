import 'package:flutter/material.dart';
import 'package:flutter_test_project/modules/homeScreen/tabs/homeTab.dart';
import 'package:flutter_test_project/modules/homeScreen/tabs/searchTab.dart';
import 'package:flutter_test_project/shared/constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int pageIndex = 0;

  final pages = [
    const HomeTab(),
    const SearchTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                changeTab(0);
              },
              icon: Icon(
                Icons.home,
                color: pageIndex  == 0 ? AppColors.kwWhiteColor : AppColors.greyColor,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                changeTab(1);
              },
              icon: Icon(
                Icons.search,
                color: pageIndex  == 1 ? AppColors.kwWhiteColor : AppColors.greyColor,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeTab(int i) {
    setState(() {
      pageIndex = i;
    });
  }
}
