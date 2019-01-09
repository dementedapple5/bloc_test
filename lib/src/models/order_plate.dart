import 'package:bloc_test/src/models/plate.dart';
import 'package:bloc_test/src/models/topic.dart';

class OrderPlate{

  Plate plate;
  Map<Topic, int> topics;
  double totalPriceMN;
  double total

  OrderPlate.fromJson(Map<String, dynamic> mappedOrderPlate){
    plate = Plate.fromJson(mappedOrderPlate["plate"]);
    for (int i = 0; i < mappedOrderPlate["topics"].keys.lenght; i++) {
      topics[Topic.fromJson(mappedOrderPlate["topics"].keys[i])] = mappedOrderPlate["topics"].values[i];
    }
  }

}