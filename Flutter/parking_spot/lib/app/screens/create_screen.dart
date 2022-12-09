import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

import '../components/menu_component.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';
import 'home_screen.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CreatePage> createState() => _AboutPageState();
}

class _AboutPageState extends State<CreatePage> {
  var controller = ParkingSpotController.parkingSpotController;

  final _parkingSpotNumber = TextEditingController();
  final _licensePlateCar = TextEditingController();
  final _brandCar = TextEditingController();
  final _modelCar = TextEditingController();
  final _colorCar = TextEditingController();
  final _responsibleName = TextEditingController();
  final _apartment = TextEditingController();
  final _block = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title, textAlign: TextAlign.center)),
      drawer: MenuComponent(context),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Número da vaga',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _parkingSpotNumber,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Placa do veículo',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _licensePlateCar,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Marca do veículo',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _brandCar,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Modelo do veículo',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _modelCar,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Cor do veículo',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _colorCar,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Proprietário do veículo',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _responsibleName,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Apartamento',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _apartment,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              Text(
                'Bloco',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                  textAlign: TextAlign.center,
                  controller: _block,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 16)),
              ElevatedButton(
                  onPressed: () async {
                    ParkingSpotModel parkingSpot = ParkingSpotModel(
                        "",
                        _parkingSpotNumber.text,
                        _licensePlateCar.text,
                        _brandCar.text,
                        _modelCar.text,
                        _colorCar.text,
                        "",
                        _responsibleName.text,
                        _apartment.text,
                        _block.text);

                    var response = await controller.post(parkingSpot);

                    if (response != false) {
                      Get.snackbar(
                        "Sucesso",
                        "Salvo com Sucesso",
                        icon: Icon(Icons.check, color: Colors.white),
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.lightGreen,
                        colorText: Colors.white,
                      );
                    } else {
                      Get.snackbar("Houve um erro", "Não   funcionou",
                          icon: Icon(Icons.error, color: Colors.white),
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.blue,
                          //   borderColor: Colors.blue
                          colorText: Colors.white);
                    }
                  },
                  child: Text("Salvar"),

              ),

              ElevatedButton(
                  child: Text("Voltar"),
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(padding: const EdgeInsets.fromLTRB(20, 10, 20, 10))
              )

            ]),
      ),
    );
  }
}
