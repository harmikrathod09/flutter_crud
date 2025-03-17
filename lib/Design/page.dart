import 'package:crudpractice/Design/api.dart';
import 'package:crudpractice/Design/database.dart';
import 'package:flutter/material.dart';

class CrudDatabase extends StatefulWidget {
  const CrudDatabase({super.key});

  @override
  State<CrudDatabase> createState() => _CrudDatabaseState();
}

class _CrudDatabaseState extends State<CrudDatabase> {
  List<Map<String, dynamic>> user = [];
  TextEditingController NameController = TextEditingController();
  TextEditingController CityController = TextEditingController();
  String selectId = "";

  void initState() {
    super.initState();
    getUser();
  }


  Future<void> getUser() async {
    // List<Map<String, dynamic>> data = await DatabaseUser().getUser();
    List<Map<String, dynamic>> data = await ApiService().getUser();

    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API CRUD", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: NameController,
              decoration: InputDecoration(labelText: "Enter Name"),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: CityController,
              decoration: InputDecoration(labelText: "Enter City"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                Map<String, dynamic> user = {
                  "name": NameController.text,
                  "city": CityController.text,
                };
                if (selectId!="") {
                  user["id"] = selectId;
                  // await DatabaseUser().updateUser(user);
                  await ApiService().updateUser(user["id"], user);
                  selectId = "";
                } else {
                  // await DatabaseUser().insertUser(user);
                  await ApiService().insertUser(user);
                }
                getUser();
                NameController.clear();
                CityController.clear();
              },

              child: Text("Save"),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("Name: ${user[index]["name"]}"),
                      subtitle: Text("City: ${user[index]["city"]}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color:  Colors.blue),
                            onPressed: () {
                              selectId=user[index]["id"];
                              NameController.text = user[index]["name"];
                              CityController.text = user[index]["city"];
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              print(user[index]['id']);
                              // DatabaseUser().deleteUser(user[index]['id']);
                              await ApiService().deleteUser(user[index]['id']);
                              getUser();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
