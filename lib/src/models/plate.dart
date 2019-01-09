import 'package:bloc_test/src/models/topic.dart';

class Plate{

  String name;
  String description;
  double priceMN;
  double priceCUC;
  String imagePath;
  List<Topic> topics;

  Plate.fromJson(Map<String, dynamic> mappedPlate) {
    name = mappedPlate["name"];
    description = mappedPlate["description"];
    priceMN = mappedPlate["price_mn"];
    priceCUC = mappedPlate["price_cuc"];
    imagePath = mappedPlate["image_path"];
  }


}