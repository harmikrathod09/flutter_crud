import 'package:adv_flutter/utils/import_export.dart';

class RxlistCrudModel {
  String name;
  String email;
  bool isFavorite; // New field

  RxlistCrudModel({
    required this.name,
    required this.email,
    this.isFavorite = false,
  });

  factory RxlistCrudModel.fromMap(Map<String, dynamic> map) {
    return RxlistCrudModel(
      name: map[NAME] ?? '',
      email: map[EMAIL] ?? '',
      isFavorite: map[IS_FAV] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      NAME: name,
      EMAIL: email,
      IS_FAV: isFavorite,
    };
  }
}
