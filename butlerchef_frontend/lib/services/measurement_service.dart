import 'dart:convert';
import 'package:butler_chef/utils/app_url.dart';
import 'package:http/http.dart';
import '../models/measurement_quantity_model.dart';

class MeasurementService {

  static Future<List<MeasurementWithQuantities>> getMeasurements() async {

    Response response =
    await get(Uri.parse(AppUrl.getMeasurements));

    if (response.statusCode == 200) {

      List<MeasurementWithQuantities> measurements =
          MeasurementResponse.fromJson(json.decode(response.body)).measurement;

      return measurements;
    }

    return [];
  }




}