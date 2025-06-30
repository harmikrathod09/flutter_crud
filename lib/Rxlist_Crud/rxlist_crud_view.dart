import 'package:adv_flutter/utils/import_export.dart';
import 'package:get/get.dart';

class RxlistCrudView extends StatelessWidget {
  RxlistCrudView({Key? key}) : super(key: key);

  final RxlistCrudController _controller = Get.put(RxlistCrudController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(APPBAR_RXLIST_CRUD, style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Get.toNamed(RXLIST_FAV);
            },
          ),
        ],
      ),
      body: Obx(() {
        if (_controller.users.isEmpty) {
          return Center(child: Text(NO_USER));
        }

        return ListView.builder(
          itemCount: _controller.users.length,
          itemBuilder: (context, index) {
            final user = _controller.users[index];
            return Card(
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        user.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: user.isFavorite ? Colors.red : Colors.grey,
                      ),
                      onPressed: () => _controller.toggleFavorite(index),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        Get.toNamed(RXLIST_ADD_EDIT, arguments: index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _controller.removeUser(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RXLIST_ADD_EDIT);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
