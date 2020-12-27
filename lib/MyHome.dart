import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:http/http.dart';

import 'AddContact.dart';
import 'ContactView.dart';
import 'Contacts.dart';
import 'DataSearch.dart';
import 'FofBottomNavigator.dart';

class MyHome extends StatelessWidget {

  static List<Contacts> _contacts = [];



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
                      itemCount: _contacts.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text('${_contacts[index].firstName}'),
                          subtitle: Text('${_contacts[index].cellPhone}'),
                          leading: CircleAvatar(),
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ContactView(_contacts[index].firstName, _contacts[index].cellPhone)));
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

  void fetchItems() async{
    var url = 'https://fof.cleverapps.io/contact';
    Map<String, String> headers = {"Content-type": "application/json",  "authorization": userToken};
    Response response = await get(url, headers: headers);
    setState(){
      var contactJson = json.decode(response.body);
      for(var c in contactJson){
        var contactItem = Contacts(c['id'], c['first_name'], c['last_name'], c['cellphone'], c['email'], c['job'], c['intrests'], c['city_name']);
        _contacts.add(contactItem);
      }
    }
  }
}