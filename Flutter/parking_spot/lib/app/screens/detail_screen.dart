import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_spot/app/screens/home_screen.dart';
import 'package:get/get.dart';
import '../components/menu_component.dart';
import '../controllers/parking_spot_controller.dart';
import '../models/parking_spot_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.title, required this.objeto}) : super(key: key);

  final String title;
  final ParkingSpotModel objeto;

  @override
  State<DetailScreen> createState() => _MyDetailScreenState();
}

class _MyDetailScreenState extends State<DetailScreen> {

  var controller = ParkingSpotController.parkingSpotController;

  final _parkingSpotNumber  = TextEditingController();
  final _licensePlateCar    = TextEditingController();
  final _brandCar           = TextEditingController();
  final _modelCar           = TextEditingController();
  final _colorCar           = TextEditingController();
  final _responsibleName    = TextEditingController();
  final _apartment          = TextEditingController();
  final _block              = TextEditingController();

  @override
  void initState() {
    super.initState();
    _parkingSpotNumber.text = widget.objeto.parkingSpotNumber;
    _licensePlateCar.text   = widget.objeto.licensePlateCar;
    _brandCar.text          = widget.objeto.brandCar;
    _modelCar.text          = widget.objeto.modelCar;
    _colorCar.text          = widget.objeto.colorCar;
    _responsibleName.text   = widget.objeto.responsibleName;
    _apartment.text         = widget.objeto.apartment;
    _block.text             = widget.objeto.block;
  }

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
                  style: TextStyle(fontSize: 16)
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