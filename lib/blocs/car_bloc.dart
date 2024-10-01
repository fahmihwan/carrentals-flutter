import 'dart:convert';
import 'dart:developer' as developer;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tes_project_1/models/car_model.dart';
import 'package:http/http.dart' as http;

class CarBloc extends Cubit<List<CarModel>> {
  CarBloc() : super([]);

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.8:3000/api/cars'));
    developer.log(json.decode(response.body));
    if (response.statusCode == 200) {
      if (response.statusCode == 200) {
        emit(json.decode(response.body));
      } else {
        throw Exception('Failed to load posts');
      }
    } else {
      throw Exception("Failed to load");
    }
  }
}
