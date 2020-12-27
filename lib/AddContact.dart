import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/MyHome.dart';
import 'package:flutter_app/constants/constants.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart';
import 'ui/widgets/custom_shape.dart';
import 'ui/widgets/customappbar.dart';
import 'ui/widgets/responsive_ui.dart';
import 'ui/widgets/textformfield.dart';



class AddContact extends StatefulWidget {
  @override
  _AddContactState createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController cellPhoneController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController intrestController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.50,child: CustomAppBar()),
                form(),
                SizedBox(height: _height/35,),
                button(),
                //signInTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height/ 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            cityNameTextFormField(),
            SizedBox(height: _height / 60.0),
            jobTextFormField(),
            SizedBox(height: _height / 60.0),
            intrestTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
      textEditingController: firstNameController,
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
      textEditingController: lastNameController,
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
      textEditingController: emailController,
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
      textEditingController: cellPhoneController,
    );
  }

  Widget cityNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.location_on,
      hint: "City Name",
      textEditingController: cityNameController,
    );
  }

  Widget jobTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.work,
      hint: "Job",
      textEditingController: jobController,
    );
  }


  Widget intrestTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.favorite,
      hint: "Intrests in?",
      textEditingController: intrestController,
    );
  }


  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        _makePostRequest(
            firstNameController.text,
            lastNameController.text,
            cellPhoneController.text,
            cityNameController.text,
            emailController.text,
            jobController.text,
            intrestController.text
        );
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHome()));
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('Save', style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
      ),
    );
  }



  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800, color: Colors.orange[200], fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}


_makePostRequest(firstName,lastName,cellPhone,cityName,email,job,intrest) async {
  String url = 'https://fof.cleverapps.io/contact';
  Map<String, String> headers = {"Content-type": "application/json" , "authorization": userToken};
  String json = '{'
      '"first_name": "$firstName",'
      '"last_name": "$lastName",'
      '"cellphone": "$cellPhone",'
      '"email": "$email",'
      '"birth_day": 22,'
      '"birth_month": 2,'
      '"job": "$job",'
      '"interests": "$intrest",'
      '"city_name":"$cityName"}';
  Response response = await post(url,headers: headers ,body: json);
  int statusCode = response.statusCode;
  print('------kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk-------------------');
  print(statusCode);
  print(userToken);
  String body = response.body;
  print(response.body);

//  print(statusCode);
//  print("---------------------------------------------------");
//  print(firstName);
//  print(lastName);
//  print(cellPhone);
//  print(email);
//  print(password);
//  print(job);
//  print("---------------------------------------------------");

}

