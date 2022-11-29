import 'package:flutter/material.dart';
import '../Presidents/PresidentModel.dart';

class presidentDetail extends StatefulWidget {
  final President? presidentPass;
  const presidentDetail({Key? key,required this.presidentPass}) : super(key: key);

  @override
  State<presidentDetail> createState() => _presidentDetailState();
}

class _presidentDetailState extends State<presidentDetail> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.presidentPass?.name}",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w600),),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xff0660a9),
      ),
      body : Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
              children : [
                Container(
                  child :
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 300, height: 400,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 6,
                                color: Colors.white,
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
                                child: Image.network("${widget.presidentPass?.photo}"))),
                        Padding(padding: const EdgeInsets.only(top:15.0)),
                        Text("Years In Office : ${widget.presidentPass?.yearsInOffice}",style: TextStyle(fontFamily: 'Montserrat',color: Color(0xff0660a9),fontWeight: FontWeight.w600,fontSize: 23),textAlign: TextAlign.center,),
                        Padding(padding: const EdgeInsets.only(top:8.0)),
                        Text("Vice Presidents : ",
                          style: TextStyle(fontFamily: 'Montserrat',color:Color(0xff0660a9),fontSize: 18), textAlign: TextAlign.justify,
                        ),
                        Padding(padding: const EdgeInsets.only(top:3.0)),
                        Container(
                          height: 100,
                          width: 550,
                          child: ListView.builder(
                              itemCount: widget.presidentPass?.vicePresidents?.length,
                              itemBuilder: (BuildContext context, int index){
                                return
                                  Text((widget.presidentPass?.vicePresidents?[index] != "None")
                                      ? "\u2022 ${widget.presidentPass?.vicePresidents?[index]}"
                                      : "None" , textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Montserrat',color:Color(0xff0660a9),),
                                  );


                              }
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
