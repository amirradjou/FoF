// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_app/AddContact.dart';
import 'package:flutter_app/DataSearch.dart';
import 'package:flutter_app/MyHome.dart';
import 'FofBottomNavigator.dart';


import 'constants/constants.dart';
import 'ui/signin.dart';
import 'ui/signup.dart';
import 'ui/splashscreen.dart';


void main() => runApp(Fof());
String userToken = '';

class Fof extends StatefulWidget {
  @override
  _FofState createState() => _FofState();
}

class _FofState extends State<Fof> {


  @override
  Widget build(BuildContext context) {
    if(userToken==''){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInPage()
      );
    }
    else{
      return MaterialApp(
          debugShowCheckedModeBanner: false,
        home: MyHome(),
      );
    }
  }
}