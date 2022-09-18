import 'dart:async';
import 'package:testing_task/src/resources/api_provider.dart';
import '../models/item_model.dart';

class Repository {
  final animalApiProvider = AnimalApiProvider();

  Future<ItemModel> fetchAllAnimal() => animalApiProvider.fetchAnimalList();
}