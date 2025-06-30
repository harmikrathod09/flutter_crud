import 'package:adv_flutter/utils/import_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RxlistCrudController extends GetxController {
  RxList<RxlistCrudModel> users = <RxlistCrudModel>[].obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _isValidIndex(int index) => index >= 0 && index < users.length;

  void addUser() {
    if (nameController.text.isNotEmpty && emailController.text.isNotEmpty) {
      users.add(RxlistCrudModel(
        name: nameController.text,
        email: emailController.text,
      ));
      clearControllers();
    }
  }

  void removeUser(int index) {
    if (_isValidIndex(index)) {
      users.removeAt(index);
    }
  }

  void updateUser(int index) {
    if (_isValidIndex(index) &&
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty) {
      users[index] = RxlistCrudModel(
        name: nameController.text,
        email: emailController.text,
        isFavorite: users[index].isFavorite, // keep favorite status
      );
      clearControllers();
    }
  }

  void toggleFavorite(int index) {
    if (_isValidIndex(index)) {
      final user = users[index];
      users[index] = RxlistCrudModel(
        name: user.name,
        email: user.email,
        isFavorite: !user.isFavorite,
      );
    }
  }

  void clearControllers() {
    nameController.clear();
    emailController.clear();
  }

  void setControllersForUser(int index) {
    if (_isValidIndex(index)) {
      final user = users[index];
      nameController.text = user.name;
      emailController.text = user.email;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
