import 'dart:convert';
import 'package:flutter_test_project/data/network/api_call_request.dart';
import 'package:flutter_test_project/data/network/constants/endPoints.dart';
import 'package:flutter_test_project/modles/countriesModle.dart';
import 'package:get/get.dart';

class HomeTabController extends GetxController {
  var contriesList = <Country>[].obs;
  var searchList = <Country>[].obs;
  RxBool loading = true.obs;
  RxString totalWorldNumber = "".obs;
  @override
  void onInit() {
    fetchContries();
    fetchWordNumber();
    super.onInit();
  }

  Future fetchContries()  async {
    Request request = Request(url: UrlsApi.countriesUrl,body: null);
    request.get().then((value){
      if(value?.statusCode == 200){
        var result = value?.data;
        print(result.toString());
        contriesList.assignAll(result['Countries']
            .map<Country>((json) => Country.fromJson(json))
            .toList());
      }
      loading.value = false;
    });
  }

  Future fetchWordNumber()  async {
    Request request = Request(url: UrlsApi.worldTotal,body: null);
    request.get().then((value){
      if(value?.statusCode == 200){
        var result = value?.data;
        totalWorldNumber.value = result['TotalConfirmed'].toString();
      }
    });
  }

  Future searchResult(var value) async{
    searchList.clear();
    for (var element in contriesList) {
      if(element.country.toLowerCase().contains(value)){
        searchList.add(element);
      }
    }
  }
}

