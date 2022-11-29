import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Profile Page",style: TextStyle(
              color: Colors.white,fontWeight: FontWeight.w600,fontFamily: 'Montserrat'
          ),),
          backgroundColor: Color(0xff0660a9),
          centerTitle: true,),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 6,
                        color: Color(0xff0660a9),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Image.network("https://media-exp1.licdn.com/dms/image/C5603AQEJpi9ubMJ-JQ/profile-displayphoto-shrink_800_800/0/1659435355292?e=2147483647&v=beta&t=kJl4tfAs7JogUiWdCHzmonn5jUcfSvWfBfJyeVqpTtk"))
                )
                ,

                Padding(
                  padding: const EdgeInsets.only(bottom:30),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama    :   Vito Rizqi Ananda",style: TextStyle(fontFamily: 'Montserrat',color: Color(0xff0660a9),fontWeight: FontWeight.w600,fontSize: 15,letterSpacing: 1),),
                    Text("NIM       :   124200044",style: TextStyle(fontFamily: 'Montserrat',color: Color(0xff0660a9),fontWeight: FontWeight.w600,fontSize: 15,letterSpacing: 1),),
                    Text("Hobi      :   Ngoding",style: TextStyle(fontFamily: 'Montserrat',color: Color(0xff0660a9),fontWeight: FontWeight.w600,fontSize: 15,letterSpacing: 1),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
