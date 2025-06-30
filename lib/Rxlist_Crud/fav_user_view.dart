import 'package:get/get.dart';
import 'package:adv_flutter/utils/import_export.dart';

class FavoriteUsersView extends StatelessWidget {
  final RxlistCrudController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black87,
        title: Text(APPBAR_FAV_PAGE, style: TextStyle(color: Colors.white)),
      ),
      body: Obx(() {
        final favUsers = _controller.users.where((u) => u.isFavorite).toList();

        if (favUsers.isEmpty) {
          return Center(child: Text(NO_FAV_USER));
        }

        return ListView.builder(
          itemCount: favUsers.length,
          itemBuilder: (context, index) {
            final user = favUsers[index];
            return Card(
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: Icon(Icons.favorite, color: Colors.red),
              ),
            );
          },
        );
      }),
    );
  }
}
