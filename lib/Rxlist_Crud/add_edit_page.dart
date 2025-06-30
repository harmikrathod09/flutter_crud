import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class AddEditPage extends StatelessWidget {
  final RxlistCrudController _controller = Get.find();

  AddEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int? index = Get.arguments as int?;
    if (index != null) {
      _controller.setControllersForUser(index);
    } else {
      _controller.clearControllers();
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(
          APPBAR_ADD_EDIT_PAGE,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller.nameController,
              decoration: InputDecoration(
                labelText: NAME,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller.emailController,
              decoration: InputDecoration(
                labelText: EMAIL,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (index == null) {
                  _controller.addUser();
                } else {
                  _controller.updateUser(index);
                }
                Get.back();
              },
              child: Text(BTN_SUBMIT),
            ),
          ],
        ),
      ),
    );
  }
}
