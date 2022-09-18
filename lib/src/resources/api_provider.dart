import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class AnimalApiProvider {
  Client client = Client();
  Future<ItemModel> fetchAnimalList() async {
    print("entered");
    final response = await client
        .get(Uri.parse("https://zoo-animal-api.herokuapp.com/animals/rand/10"));
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}