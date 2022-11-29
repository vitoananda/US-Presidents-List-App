import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_pam/Model/Screens/navBar.dart';
import 'package:project_pam/Helper/sharedPreference.dart';
import 'package:project_pam/Model/Screens/homePage.dart';
import 'package:project_pam/Model/dataModel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initiateLocalDB();
  SharedPreference().getLoginStatus().then((status) {
    runApp(MaterialApp

      (debugShowCheckedModeBanner:false,
        home: status ? NavBarPage() : HomePage()));
  });
  // runApp(const MyApp());
}


void initiateLocalDB() async {
  await Hive.initFlutter();
  Hive.registerAdapter(DataModelAdapter());
  await Hive.openBox<DataModel>("data");
}

