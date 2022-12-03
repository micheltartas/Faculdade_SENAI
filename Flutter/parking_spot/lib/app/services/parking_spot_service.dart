import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/parking_spot_list_model.dart';
import '../models/parking_spot_model.dart';

class ParkingSpotService {
  String urlGetListparkingSpot =
      "https://controle-vaga.herokuapp.com/parking-spot";

  String urlPostListparkingSpot = "https://controle-vaga.herokuapp.com/parking-spot";

  String urlPostListparkingEdit = "https://controle-vaga.herokuapp.com/parking-spot";

  String urlPostListparkingDelete = "https://controle-vaga.herokuapp.com/parking-spot";

  dynamic _response;

  ParkingSpotService() {
    _response = "";
  }

  Future<ParkingSpotList> fetchListParkingSpot() async {
    _response = await http.get(Uri.parse(urlGetListparkingSpot));
    if (_response.statusCode == 200) {
      // Map<String, dynamic> retorno = json.decode(_response.body);

      List<dynamic> list = json.decode(_response.body);

      return ParkingSpotList.fromJson(list);
    } else {
      throw Exception('Failed to load cote');
    }
  }

  Future<dynamic> fetchPostGarage(ParkingSpotModel garage) async {
    _response =
    await http.post(
        Uri.parse(urlPostListparkingSpot), body: json.encode(garage.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ParkingSpotModel.fromJson(retorno);
    } else {
      return false;
    }
  }

  Future<dynamic> fetchPostGarageEdit(ParkingSpotModel garage) async {
    _response =
    await http.put(
        Uri.parse(urlPostListparkingEdit+"/"+garage.id), body: json.encode(garage.toJson()),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        }
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      Map<String, dynamic> retorno = json.decode(_response.body);
      return ParkingSpotModel.fromJson(retorno);
    } else {
      return false;
    }
  }

  Future<dynamic> fetchPostGarageDelete(ParkingSpotModel garage) async {
    _response =
    await http.delete(
        Uri.parse(urlPostListparkingDelete+"/"+garage.id)
    );
    if (_response.statusCode == 200 || _response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}