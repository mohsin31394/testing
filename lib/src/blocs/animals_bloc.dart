import 'dart:async';


import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class AnimalBloc {
  final _repository = Repository();
  StreamController<ItemModel>  _animalFetcher = StreamController<ItemModel>();

  Stream<ItemModel> get allAnimals => _animalFetcher.stream;

  fetchAllAnimals() async {
    ItemModel itemModel = await _repository.fetchAllAnimal();
    _animalFetcher.sink.add(itemModel);
  }

  dispose() {
    _animalFetcher.close();
  }
}

final bloc = AnimalBloc();