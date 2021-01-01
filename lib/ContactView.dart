
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/widgets/custom_shape.dart';
import 'package:flutter_app/ui/widgets/customappbar.dart';
import 'package:flutter_app/ui/widgets/responsive_ui.dart';
import 'package:flutter_app/ui/widgets/textformfield.dart';

// ignore: must_be_immutable
class ContactView extends StatelessWidget {
  String firstName;
  String phoneNumber;
  String contactName;
  String lastName;
  String email;
  String job;
  String intrests;
  String cityName;
  int tempreature;
  List<dynamic> weatherDescription;


  ContactView(String firstName, String cellPhone, String lastName,
      String email, String job, String intrests, String cityName,
      int temperature, List<dynamic> weatherDescriptions) {

    this.firstName = firstName;
    this.phoneNumber = cellPhone;
    this.lastName = lastName;
    this.email = email;
    this.job = job;
    this.intrests = intrests;
    this.cityName = cityName;
    this.tempreature = temperature;
    this.weatherDescription = weatherDescriptions;

  }

  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;



  @override
  Widget build(BuildContext context) {


    _height = MediaQuery
        .of(context)
        .size
        .height;
    _width = MediaQuery
        .of(context)
        .size
        .width;
    _pixelRatio = MediaQuery
        .of(context)
        .devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.50, child: CustomAppBar()),
                clipShape(),
                form(),
                SizedBox(height: _height / 35,),
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
          left: _width / 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
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
    TextEditingController firstNameController = TextEditingController(text: firstName);
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "First Name",
      textEditingController: firstNameController,
    );
  }

  Widget lastNameTextFormField() {
    TextEditingController lastNameController = TextEditingController(text: lastName);
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "Last Name",
      textEditingController: lastNameController,
    );
  }

  Widget emailTextFormField() {
    TextEditingController emailController = TextEditingController(text: email);
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "Email ID",
      textEditingController: emailController,
    );
  }

  Widget phoneTextFormField() {
    TextEditingController cellPhoneController = TextEditingController(text: phoneNumber);
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "Mobile Number",
      textEditingController: cellPhoneController,
    );
  }

  Widget cityNameTextFormField() {
    TextEditingController cityNameController = TextEditingController(text: cityName);
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.location_on,
      hint: "City Name",
      textEditingController: cityNameController,
    );
  }

  Widget jobTextFormField() {
    TextEditingController jobController = TextEditingController(text: job);
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.work,
      hint: "Job",
      textEditingController: jobController,
    );
  }


  Widget intrestTextFormField() {
    TextEditingController intrestController = TextEditingController(text: intrests);
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
      onPressed: () {},
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('Save',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),),
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
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: (){
                print('Adding photo');
              },

              child: Icon(Icons.cloud, size: 70,color: Colors.orange[200],)),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

}