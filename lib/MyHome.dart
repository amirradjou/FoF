import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AddContact.dart';
import 'ContactView.dart';
import 'DataSearch.dart';
import 'FofBottomNavigator.dart';

class MyHome extends StatelessWidget {

  static List<String> contactNames = <String>[];
  static List<String> contactNumbers = <String>[];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('FOF'),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.white,),
          backgroundColor: Colors.green,
          actions: [
            IconButton(
              icon: Icon(Icons.add,color: Colors.white,), onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AddContact()));
            },
            )
          ],
        ),
        bottomNavigationBar: FofBottomNavigator(),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.search), backgroundColor: Colors.green,onPressed: () {
          showSearch(context: context, delegate: DataSearch());
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Container(
          child: Column(
            children: [
              Container(

              ),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: contactNames.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('${contactNames[index]}'),
                          subtitle: Text('${contactNumbers[index]}'),
                          leading: CircleAvatar(),
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContactView(contactNames[index], contactNumbers[index])));
                          },

                        );
                      }
                  )
              )
            ],
          ),
        )
    );
  }
}