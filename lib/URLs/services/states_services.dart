import 'dart:convert';

import 'package:covidapp/URLs/Models/allcasesmodel.dart';
import 'package:covidapp/URLs/urls.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<Allcasesmodel> getcases() async {
    final respnse = await http.get(Uri.parse(AppUrl.worldstateapi));
    var data = jsonDecode(respnse.body);
    if (respnse.statusCode == 200) {
      return Allcasesmodel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
  Future<List<dynamic>> getCountries() async {
    final respnse = await http.get(Uri.parse(AppUrl.countriesList));
    var data = jsonDecode(respnse.body);
    if (respnse.statusCode == 200) {
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
