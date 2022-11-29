import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:project_pam/Helper/baseNetwork.dart';
import 'package:project_pam/Model/Presidents/PresidentModel.dart';
import 'package:project_pam/Model/Detail/presidentDetails.dart';
import 'package:project_pam/Model/Detail/presidentDetails2.dart';
import 'package:project_pam/Helper/sharedPreference.dart';
import 'homePage.dart';

class PresidentDataSource{
  static PresidentDataSource instance = PresidentDataSource();
  Future<List<dynamic>> loadPresidents(){
    return BaseNetwork.get('presidents');
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff0660a9),
        title: Text("US Presidents",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Image.network("https://cdn-icons-png.flaticon.com/512/3909/3909383.png",),

        ),
        leadingWidth: 40,
        actions: [
          IconButton(
            onPressed: () {
              SharedPreference().setLogout();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                      (route) => false);
            },
            icon: Icon(Icons.logout),
          ),
        ],



      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        padding:  EdgeInsets.all(8),
        child: FutureBuilder(
          future: PresidentDataSource.instance.loadPresidents(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
            if(snapshot.hasError){
              return _buildErrorSection();
            }
            if(snapshot.hasData){
              PresidentDataModel presidentModel = PresidentDataModel.fromJson(snapshot.data);
              print(snapshot);
              return _buildSuccessSection(presidentModel);
            }
            return _buildLoadingSection();
          },
        ),
      ),
    );

  }
  Widget _buildErrorSection(){
    return Text("Error");
  }
  Widget _buildLoadingSection(){
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(PresidentDataModel data){
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: (2.3/4)
      ),
      itemCount: data.president?.length,
      itemBuilder: (BuildContext context, int index){
        final President? president = data.president?[index];
        if(index == 1){
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => presidentDetail2(presidentPass: president)));
              },
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 180 ,
                        width: 150,

                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Image.network("https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
                            width: 100, height: 135,),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("${data.president?[index].name}", textAlign:TextAlign.center,style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600,fontSize: 12 )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Years in Office : ${data.president?[index].yearsInOffice}",style: TextStyle(fontFamily: 'Montserrat',fontSize: 5,),textAlign: TextAlign.center,),
                    ],
                  ),
                ),
              )
          );
        }else {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => presidentDetail(presidentPass: president)));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 180,
                      width: 130,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network("${data.president?[index].photo}",
                          width: 100, height: 135,),
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text("${data.president?[index].name}", textAlign:TextAlign.center,style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w600,fontSize: 15)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Years in Office : \n${data.president?[index].yearsInOffice}",style: TextStyle(fontFamily: 'Montserrat',fontSize: 12,),textAlign: TextAlign.center,),
                  ],
                ),
              ),
            ),
          );
        }
      },

    );
  }
}







