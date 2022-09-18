import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ItemModel extends GetxController {

  List<_Result> _results = [];

  ItemModel.fromJson(List parsedJson) {
    List<_Result> temp=[];
    for (int i = 0; i < parsedJson.length; i++) {
      _Result result = _Result(parsedJson[i]);
      temp.add(result);
    }
    _results = temp;
    update();
  }

  List<_Result> get results => _results;

}

class _Result {

  late String _name;
  late String _latin_name;
  late String _animal_type;
  late String _active_time;
  late String _length_min;
  late String _length_max;
  late String _weight_min;
  late String _weight_max;
  late String _lifespan;
  late String _habitat;
  late String _diet;
  late String _geo_range;
  late String _image_link;
  late int _id;


  _Result(result) {
    _name = result['name'];
    _latin_name = result['latin_name'];
    _animal_type = result['animal_type'];
    _active_time = result['active_time'];
    _length_min = result['length_min'];
    _length_max = result['length_max'];
    _weight_min = result['weight_min'];
    _weight_max = result['weight_max'];
    _lifespan = result['lifespan'];
    _habitat = result['habitat'];
    _diet = result['diet'];
    _geo_range = result['geo_range'];
    _image_link = result['image_link'];
    _id = result['id'];
  }

  String get name => _name;
  String get latin_name => _latin_name;
  String get animal_type => _animal_type;
  String get active_time => _active_time;
  String get length_min => _length_min;
  String get length_max => _length_max;
  String get weight_min => _weight_min;
  String get weight_max => _weight_max;
  String get lifespan => _lifespan;
  String get habitat => _habitat;
  String get diet => _diet;
  String get geo_range => _geo_range;
  String get image_link => _image_link;
  int get id => _id;


}