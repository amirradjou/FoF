import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'MyHome.dart';

// ignore: must_be_immutable
class ContactView extends StatelessWidget {
  String phoneNumber;
  String contactName;


  ContactView(String contactName, String phoneNumber, String lastName, String email, String job, String intrests, String cityName, int temperature, String weather_descriptions){
    this.phoneNumber = phoneNumber;
    this.contactName = contactName;
  }



  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController(text: contactName);
    TextEditingController phoneController = TextEditingController(text: phoneNumber);

    return Scaffold(
        appBar: AppBar(
          title: Text('FOF'),
          centerTitle: true,
          leading:IconButton(
            icon: Icon(Icons.arrow_back_rounded,color: Colors.white,), onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHome()));
          },
          ),
          backgroundColor: Colors.green,
        ),
        body: new Material(
            child: new Container (
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: new Container(
                  child: new Center(
                      child: new Column(
                          children : [
                            new Padding(padding: EdgeInsets.only(top: 50.0)),
                            new Text('Edit Contact',
                              style: new TextStyle(color: Colors.black, fontSize: 25.0,),),
                            new Padding(padding: EdgeInsets.only(top: 50.0)),
                            new TextFormField(
                              controller: nameController,
                              decoration: new InputDecoration(
                                labelText: "Enter Name",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Name cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.name,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 10.0)),
                            new TextFormField(
                              controller: phoneController,
                              decoration: new InputDecoration(
                                labelText: "Enter Number",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(25.0),
                                  borderSide: new BorderSide(
                                  ),
                                ),
                                //fillColor: Colors.green
                              ),
                              validator: (val) {
                                if(val.length==0) {
                                  return "Number cannot be empty";
                                }else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.phone,
                              style: new TextStyle(
                                fontFamily: "Poppins",
                              ),
                            ),
                            new Padding(padding: EdgeInsets.only(top: 80.0)),
                            ElevatedButton(
                              onPressed: () {
                                print(nameController.text);
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHome()));
                              },
                              child: Text('Save'),
                            )
                          ]
                      )
                  ),
                )
            )
        )
    );
  }
}
