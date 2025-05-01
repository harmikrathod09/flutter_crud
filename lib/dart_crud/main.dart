import 'dart:io';

import 'package:user.dart';

void main(){
  print('Welcome to CRUD Operation');
  User user=new User();
  do{
    stdout.write('Enter Choice\n1.Insert\n2.Read\n3.Update\n4.Delete\n5.search');
    int choice=int.parse(stdin.readLineSync()!);

    switch(choice){
      case 1:{
        stdout.write('Enter Name:');
        String name=stdin.readLineSync()!;
        stdout.write('Enter roll no:');
        int rollNo=int.parse(stdin.readLineSync()!);
        stdout.write('Enter city:');
        String city=stdin.readLineSync()!;

        user.userInsert(name: name, rollNo: rollNo, city: city);

        break;
      }
      case 2:{
        print(user.userRead());
        break;
      }
      case 3:{
        stdout.write('Enter Name:');
        String name=stdin.readLineSync()!;
        stdout.write('Enter roll no:');
        int rollNo=int.parse(stdin.readLineSync()!);
        stdout.write('Enter city:');
        String city=stdin.readLineSync()!;
        stdout.write('Enter ID:');
        int id=int.parse(stdin.readLineSync()!);

        user.userUpdate(name: name, rollNo: rollNo, city: city, id: id);

        break;
      }
      case 4:{
        stdout.write('Enter ID:');
        int id=int.parse(stdin.readLineSync()!);

        user.UserDelete(id: id);

        break;
      }
      case 5:{
        stdout.write('Search Here:');
        String id=stdin.readLineSync()!;

        user.UserDelete(id: id);

        break;
      }

    }
  }while(true);
}