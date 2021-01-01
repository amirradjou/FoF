// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyHome.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


import 'ui/signin.dart';

String userToken = '';
final loginToken = new FlutterSecureStorage();
//final String mySecureKey = getSecureKey() as String;

void main() => runApp(Fof());

class Fof extends StatefulWidget {
  @override
  _FofState createState() => _FofState();
}

class _FofState extends State<Fof> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MyHome().fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    print(userToken);
    if(userToken == ''){
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
