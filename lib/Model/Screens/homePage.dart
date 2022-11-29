import 'package:flutter/material.dart';
import 'package:project_pam/Helper/sharedPreference.dart';
import 'loginPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const LoginPageFul(),
    );
  }

}
