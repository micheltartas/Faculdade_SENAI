import 'package:get/get.dart';
import 'package:parking_spot/app/controllers/parking_spot_controller.dart';

class ControllerBinding implements Bindings {

  @override

  void dependencies (){
    Get.lazyPut<ParkingSpotController>(() => ParkingSpotController());

  }

}