import 'dart:convert';
import 'package:flutter_test_project/data/network/api_call_request.dart';
import 'package:flutter_test_project/data/network/constants/endPoints.dart';
import 'package:flutter_test_project/modles/countryDetailModle.dart';
import 'package:get/get.dart';

class CountryController extends GetxController {
  RxBool loading = true.obs;
  var countryDetailList = <CountriesDetailModle>[].obs;


  @override
  void onInit() {
    super.onInit();
  }

  Future fetchCountryDetails(value)  async {
    if(countryDetailList.isNotEmpty){
      countryDetailList.clear();
      loading.value = true;
    }
    Request request = Request(url: UrlsApi.getDataByCountries+value,body: null);
    request.get().then((value){
      if(value?.statusCode == 200){
        var result = value?.data;
        countryDetailList.assignAll(result
            .map<CountriesDetailModle>((json) => CountriesDetailModle.fromJson(json))
            .toList());
      }
      loading.value = false;
    });
  }
}

