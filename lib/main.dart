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

void main() => runApp(Fof());

class Fof extends StatefulWidget {
  @override
  _FofState createState() => _FofState();
}

class _FofState extends State<Fof> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome()
    );
  }
}