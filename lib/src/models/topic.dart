class Topic{

  String name;
  double valueMN;
  double valueCUC;

  Topic.fromJson(Map<String, dynamic> mappedTopic) {
    name = mappedTopic["name"];
    valueMN = mappedTopic["unit_value_mn"];
    valueCUC = mappedTopic["unit_value_cuc"];
  }

}