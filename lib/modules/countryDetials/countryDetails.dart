import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test_project/modules/countryDetials/countryControllers/contryDetailsController.dart';
import 'package:flutter_test_project/shared/constants/app_colors.dart';
import 'package:get/get.dart';

class CountryDetails extends StatefulWidget {
   final String countryName;

   const CountryDetails({Key? key, required this.countryName}) : super(key: key);

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {
  CountryController countryController = Get.put(CountryController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryController.fetchCountryDetails(widget.countryName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Obx(()=>
             Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.kPrimaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.countryName,style: const TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold,color: AppColors.kwWhiteColor)),
                      const Text("Corona state overview",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.kwWhiteColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0,),
                countryController.loading.value ?
                SpinKitFadingCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        color: index.isEven ? AppColors.kPrimaryColor : AppColors.kwWhiteColor,
                      ),
                    );
                  },
                ):Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("TOTAL CASES",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                            const SizedBox(height: 5.0,),
                            Text(countryController.countryDetailList.last.totalCases.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            const Text("TOTAL Deaths",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                            const SizedBox(height: 5.0,),
                            Text(countryController.countryDetailList.last.totalDeaths.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("NEW CASES",style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                            const SizedBox(height: 5.0,),
                            Text(countryController.countryDetailList.last.newCases.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text("NEW Deaths",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                            const SizedBox(height: 5.0,),
                            Text(countryController.countryDetailList.last.newDeaths.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("New Recovered",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                            const SizedBox(height: 5.0,),
                            Text(countryController.countryDetailList.last.newDeaths.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Text("Total Recovered",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                            const SizedBox(height: 5.0,),
                            Text(countryController.countryDetailList.last.newDeathsPerMillion.toString(),style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: AppColors.blackColor)),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
