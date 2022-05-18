import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test_project/modles/countriesModle.dart';
import 'package:flutter_test_project/modules/countryDetials/countryDetails.dart';
import 'package:flutter_test_project/modules/homeScreen/homeControllers/homeTabController.dart';
import 'package:flutter_test_project/shared/constants/app_colors.dart';
import 'package:flutter_test_project/shared/constants/dimensions.dart';
import 'package:get/get.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({Key? key}) : super(key: key);

  @override
  _SearchTabState createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final HomeTabController homeTabController = Get.find();
  TextEditingController textEditingController = TextEditingController();

  _SearchTabState() {
    textEditingController.addListener(() {
      if (textEditingController.text.isNotEmpty) {
        if(mounted){
           homeTabController.searchResult(textEditingController.text.toLowerCase());
        }
      }else{
        homeTabController.searchList.clear();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children:[
          Padding(
            padding: const EdgeInsets.all(Dimensions.dim10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightGrey,
                boxShadow: const [
                  BoxShadow(color: AppColors.lightGrey, spreadRadius: 3),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(Dimensions.dim10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10.0,),
                    Expanded(
                      child: SizedBox(
                        height: 35.0,
                        child: TextField(
                          controller: textEditingController,
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(fontSize: 14),
                            hintText: 'Search',
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                )
              ),
            ),
          ),
            GetX<HomeTabController>(
              init: HomeTabController(),
              builder: (homeTabController){
                if(homeTabController.loading.value){
                  return SpinKitFadingCircle(
                    itemBuilder: (BuildContext context, int index) {
                      return DecoratedBox(
                        decoration: BoxDecoration(
                          color: index.isEven ? AppColors.kPrimaryColor : AppColors.kwWhiteColor,
                        ),
                      );
                    },
                  );
                }else if(!homeTabController.loading.value & homeTabController.searchList.isEmpty){
                  return Center(child: Text(textEditingController.text.isEmpty ? "Please search something" :"No data available")
                  );
                }else{
                  return Column(
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: homeTabController.searchList.length,
                          itemBuilder: (buildContext, position) {
                            Country contries = homeTabController.searchList[position];
                            return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => CountryDetails(countryName: contries.country)));
                                  },
                                child:Padding(
                                  padding: const EdgeInsets.all(Dimensions.dim5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(contries.country,style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
                                          Text(contries.totalCases.toString(),style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      const Divider(color: AppColors.kPrimaryColor,)
                                    ],
                                  ),
                                )
                            );
                          }),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      )
    );
  }
}
