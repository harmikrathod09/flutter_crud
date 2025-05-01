class User {
  List<Map<String, dynamic>> userList = [];

  void userInsert({required name, required rollNo, required city}) {
    Map<String, dynamic> userMap = {};

    userMap['name'] = name;
    userMap['rollNo'] = rollNo;
    userMap['city'] = city;

    userList.add(userMap);
  }

  List<Map<String, dynamic>> userRead() {
    return userList;
  }

  void userUpdate(
      {required name, required rollNo, required city, required id}) {
    Map<String, dynamic> userMap = {};

    userMap['name'] = name;
    userMap['rollNo'] = rollNo;
    userMap['city'] = city;

    userList[id] = userMap;
  }

  void UserDelete({required id}) {
    userList.removeAt(id);
  }

 void userSearch({required data}) {
    for (var element in userList) {
      if (element['name'].toString().toLowerCase().contains(data.toString().toLowerCase()) || element['rollNo'].toString().toLowerCase().contains(data) || element['city'].toString().toLowerCase().contains(data)) {
        print('${element['name']} . ${element['rollNo']} . ${element['city']}');
      }
    }
  }
}