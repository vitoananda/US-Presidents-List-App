
import 'package:flutter/material.dart';
import 'package:project_pam/Model/Screens/homePage.dart';
import 'package:project_pam/Model/Screens/navBar.dart';
import 'presidentList.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project_pam/Helper/hiveDatabase.dart';
import 'package:project_pam/Helper/sharedPreference.dart';
import 'package:project_pam/Model/dataModel.dart';
import 'signUpPage.dart';

class LoginPageFul extends StatefulWidget {
  const LoginPageFul({Key? key}) : super(key: key);

  @override
  _LoginPageFulState createState() => _LoginPageFulState();
}

class _LoginPageFulState extends State<LoginPageFul> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void validateAndSave() {
    final FormState? form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Us \n Presidents",style: TextStyle(fontFamily: 'Cinzel Decorative',color:  Color(0xff0660a9),fontSize: 45),textAlign: TextAlign.center,),
              Padding(padding: const EdgeInsets.only(bottom: 30)),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: "Username",
                  hintStyle : TextStyle(
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
                validator: (value) => value!.isEmpty ? 'Username cannot be blank':null,
              ),
              Padding(padding: const EdgeInsets.only(bottom: 10)),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  hintStyle : TextStyle(
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
                obscureText: true,
                validator: (value) => value!.isEmpty ? 'Password cannot be blank' : null,
              ),
              Padding(padding: const EdgeInsets.only(bottom: 20)),
              _buildLoginButton(),
              Padding(padding: const EdgeInsets.only(bottom: 10)),
              _buildRegisterButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonSubmitButton({
    required String labelButton,
    required Function(String) submitCallback,
  }){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:  Color(0xff0660a9),
          padding: EdgeInsets.all(10.0),
          fixedSize: Size(180,40),
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

  Widget _buildLoginButton() {
    return _commonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        validateAndSave();
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  void _processLogin(String username, String password) async {
    final HiveDatabase _hive = HiveDatabase();
    bool found = false;

    found = _hive.checkLogin(username, password);

    if(!found) showAlertDialog(context);
    else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => NavBarPage(),
        ),
      );
      SnackBar snackBar = SnackBar(
        duration: Duration(seconds : 2),
        behavior: SnackBarBehavior.floating,
        shape:
        RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
        backgroundColor:  Color(0xff0660a9),
        content: Text("Login Success!",style: TextStyle(fontFamily: 'Montserrat'),),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  Widget _buildRegisterButton() {
    return _commonSubmitButton(
      labelButton: "Sign Up",

      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SignUp(),
          ),
        );
      },
    );
  }
}

showAlertDialog(BuildContext context) {


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    shape:
    RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
    title: Text("Login Failed!",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.w600),),
    content: Text("Your account is not found"),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


