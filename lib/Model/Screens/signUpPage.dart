import 'package:flutter/material.dart';
import 'package:project_pam/Helper/hiveDatabase.dart';
import 'package:project_pam/Model/dataModel.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final HiveDatabase _hive = HiveDatabase();

  var encryptedText,password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Your Account", style: TextStyle(
            fontFamily: "Montserrat",
            color: Color(0xff0660a9),
            fontSize: 15,
            fontWeight: FontWeight.w600)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff0660a9),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat',
                ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Color(0xff0660a9),
                  ),
                ),
              ),
              validator: (String? value) {
                if (value!.trim().isEmpty) {
                  return 'Username is required';
                }
              },
            ),
            Padding(padding: const EdgeInsets.only(bottom: 10)),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  fontFamily: 'Montserrat',
                ),
                contentPadding: EdgeInsets.all(8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Color(0xff0660a9),
                  ),
                ),
              ),
              validator: (String? value) {
                if (value!.trim().isEmpty) {
                  return 'Password is required';
                }
              },
            ),
            Padding(padding: const EdgeInsets.only(bottom: 25)),
            _buildRegisterButton(),
          ],
        ),
      ),
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0660a9),
          padding: EdgeInsets.all(10.0),
          fixedSize: Size(180, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // <-- Radius
          ),
        ),
        child: Text(labelButton,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 12),),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }

  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Sign Up",

      submitCallback: (value) {
        if (_usernameController.text.isNotEmpty &&
            _passwordController.text.isNotEmpty) {
          _hive.addData(
              DataModel(
                  username: _usernameController.text,
                  password: _passwordController.text
              )

          );
          _usernameController.clear();
          _passwordController.clear();

          setState(() {
          });


          Navigator.pop(context);
        }
      },
    );
  }
}

