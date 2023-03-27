import 'dart:convert';

CarDetails carDetailsFromJson(String str) => CarDetails.fromJson(json.decode(str));

class CarDetails {
  CarDetails({
    required this.car,
  });

  List<Car> car;

  factory CarDetails.fromJson(Map<String, dynamic> json) => CarDetails(
    car: List<Car>.from(json["car"].map((x) => Car.fromJson(x))),
  );

}

class Car {
  Car({
    required this.name,
    required this.count,
    required this.model,
  });

  String name;
  int count;
  List<Model> model;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
    name: json["name"],
    count: json["count"],
    model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
  );
}

class Model {
  Model({
    required this.colour,
    required this.engine,
    required this.price,
  });

  String colour;
  String engine;
  List<Price> price;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    colour: json["colour"],
    engine: json["engine"],
    price: List<Price>.from(json["price"].map((x) => Price.fromJson(x))),
  );
}

class Price {
  Price({
    required this.amount,
  });

  int amount;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    amount: json["amount"],
  );
}
