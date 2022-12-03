import 'package:parking_spot/app/models/parking_spot_model.dart';

class ParkingSpotList {

  final List<ParkingSpotModel> listParkingSpot;

  ParkingSpotList(this.listParkingSpot);

  ParkingSpotList.fromJson(List<dynamic> json):
        listParkingSpot = List.from(json).map((item) => ParkingSpotModel.fromJson(item)).toList() ;

}
