import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test_project/modles/countriesModle.dart';
import 'package:flutter_test_project/modules/countryDetials/countryDetails.dart';
import 'package:flutter_test_project/modules/homeScreen/homeControllers/homeTabController.dart';
import 'package:flutter_test_project/shared/constants/app_colors.dart';
import 'package:flutter_test_project/shared/constants/dimensions.dart';
import 'package:get/get.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HomeTabController homeTabController = Get.put(HomeTabController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(()=>
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.dim10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("WORLD",style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold)),
                    Text(homeTabController.totalWorldNumber.value.toString(),style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold)),
                  ],
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
                  }else if(!homeTabController.loading.value & homeTabController.contriesList.isEmpty){
                    return const Center(child: Text("No data available"));
                  }else{
                    return Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: homeTabController.contriesList.length,
                            itemBuilder: (buildContext, position) {
                              Country contries = homeTabController.contriesList[position];
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
        ),
      )
    );
  }
}
