import 'package:flutter/services.dart';
import 'model.dart';

class service {
  Future<CarDetails> readJson() async {
    final jsondata = await rootBundle.loadString('assets/car.json');
    final data = carDetailsFromJson(jsondata);
    print(data.car.first.name);
    return data;
  }
}
