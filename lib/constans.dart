import 'package:coffee_app/models/cup_model.dart';

const List<Map<String, String>> types = [
  {'name': 'Coffee', 'path': 'coffee.png'},
  {'name': 'Beer', 'path': 'beer.png'},
  {'name': 'Wine Bar', 'path': 'wine.png'},
  {'name': 'Events', 'path': 'events.png'},
];

List<CupModel> cupList = [
  CupModel(image: 'assets/cups/cup_1.svg', title: 'Chai Latte', price: 85.00),
  CupModel(image: 'assets/cups/cup_2.svg', title: 'Matcha Latte', price: 22.00),
  CupModel(image: 'assets/cups/cup_3.svg', title: 'Red Eye Cold', price: 60.00),
  CupModel(image: 'assets/cups/cup_4.svg', title: 'Milk Shakes', price: 44.00),
];
