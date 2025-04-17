import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MapCrudWithSearch()));
}

class MapCrudWithSearch extends StatefulWidget {
  @override
  _MapCrudWithSearchState createState() => _MapCrudWithSearchState();
}

class _MapCrudWithSearchState extends State<MapCrudWithSearch> {
  List<Map<String, String>> userList = [];
  List<Map<String, String>> filteredList = [];

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final searchController = TextEditingController();

  int? editingIndex;

  @override
  void initState() {
    super.initState();
    searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredList = userList
          .where((user) => user['name']!.toLowerCase().contains(query))
          .toList();
    });
  }

  void _saveUser() {
    String name = nameController.text.trim();
    String age = ageController.text.trim();

    if (name.isEmpty || age.isEmpty) return;

    setState(() {
      if (editingIndex == null) {
        userList.add({'name': name, 'age': age});
      } else {
        userList[editingIndex!] = {'name': name, 'age': age};
        editingIndex = null;
      }
      nameController.clear();
      ageController.clear();
      _onSearchChanged(); // update filtered list
    });
  }

  void _editUser(int index) {
    nameController.text = filteredList[index]['name']!;
    ageController.text = filteredList[index]['age']!;
    setState(() {
      editingIndex = userList.indexOf(filteredList[index]);
    });
  }

  void _deleteUser(int index) {
    setState(() {
      userList.remove(filteredList[index]);
      _onSearchChanged();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Show full list if search is empty
    filteredList = searchController.text.isEmpty ? userList : filteredList;

    return Scaffold(
      appBar: AppBar(title: Text('List of Map CRUD with Search')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search by name',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 10),

            // Input fields
            TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
            TextField(controller: ageController, decoration: InputDecoration(labelText: 'Age')),
            ElevatedButton(
              onPressed: _saveUser,
              child: Text(editingIndex == null ? 'Add User' : 'Update User'),
            ),
            SizedBox(height: 20),

            // User List
            Expanded(
              child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final user = filteredList[index];
                  return ListTile(
                    title: Text(user['name'] ?? ''),
                    subtitle: Text('Age: ${user['age']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () => _editUser(index), icon: Icon(Icons.edit)),
                        IconButton(onPressed: () => _deleteUser(index), icon: Icon(Icons.delete)),
                      ],
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
