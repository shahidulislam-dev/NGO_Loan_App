import 'dart:convert';

DistrictsModel districtsModelFromJson(String str) => DistrictsModel.fromJson(json.decode(str));

class DistrictsModel {
  DistrictsModel({
    required this.districts,
  });

  List<Districts> districts;

  factory DistrictsModel.fromJson(Map<String, dynamic> json) => DistrictsModel(
    districts: List<Districts>.from(json["districts"].map((x) => Districts.fromJson(x))),
  );
}

class Districts {
  Districts({
    required this.name,
  });

  String name;


  factory Districts.fromJson(Map<String, dynamic> json) => Districts(
    name: json["name"],
  );
}

