import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:parking_spot/app/screens/detail_screen.dart';

import '../components/menu_component.dart';
import '../controllers/parking_spot_controller.dart';
import 'edit_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = ParkingSpotController.parkingSpotController;

  @override
  void initState() {
    super.initState();
    controller.listParkingSpot();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MenuComponent(context),
        body: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: controller.listParkingSpotObs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: Column(
                        children: [
                          ListTile(
                            title: Text(controller
                                .listParkingSpotObs[index].responsibleName),
                            trailing: Wrap(
                              spacing: 12,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.panorama_fish_eye),
                                    color: Colors.orange,
                                    onPressed: () {
                                      Get.to(DetailScreen(
                                        objeto: controller
                                            .listParkingSpotObs[index],
                                        title: 'Visualizar',
                                      ));
                                    }),
                                IconButton(
                                    icon: const Icon(Icons.edit),
                                    color: Colors.orange,
                                    onPressed: () {
                                      Get.to(EditScreen(
                                        objeto: controller
                                            .listParkingSpotObs[index],
                                        title: 'Editar',
                                      ));
                                    }),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () async {
                                    var retorno = await controller.delete(
                                        controller.listParkingSpotObs[index]);

                                    if (retorno == true) {
                                      controller.listParkingSpot();
                                      Get.snackbar(
                                        "Sucesso",
                                        "Salvo com Sucesso",
                                        icon: Icon(Icons.check,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.lightGreen,
                                        colorText: Colors.white,
                                      );
                                    } else {
                                      Get.snackbar(
                                        "Deu erro",
                                        "Errou Feio! Errou Rude",
                                        icon: Icon(Icons.check,
                                            color: Colors.white),
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor: Colors.red,
                                        colorText: Colors.white,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                    }),
              )) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
