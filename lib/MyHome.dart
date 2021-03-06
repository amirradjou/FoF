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
          backgroundColor: Colors.orange[200],
          actions: [
            IconButton(
              icon: Icon(Icons.refresh,color: Colors.white,), onPressed: (){
                fetchItems();
                print(_contacts);
              (context as Element).reassemble();
            },
            )
          ],
        ),
        bottomNavigationBar: FofBottomNavigator(),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add), backgroundColor: Colors.redAccent,onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddContact()));
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
                          leading: CircleAvatar(backgroundColor: Colors.redAccent,),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                                ContactView(
                                    _contacts[index].firstName,
                                    _contacts[index].cellPhone,
                                    _contacts[index].lastName,
                                    _contacts[index].email,
                                    _contacts[index].job,
                                    _contacts[index].intrests,
                                    _contacts[index].cityName,
                                    _contacts[index].temperature,
                                    _contacts[index].weather_descriptions
                                )));
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
      var contactJson = json.decode(response.body);
      _contacts = [];
      for(var c in contactJson){
        var contactItem = Contacts(c['id'], c['first_name'], c['last_name'], c['cellphone'], c['email'], c['job'],
            c['intrests'], c['city_name'], c['geo_info']['current']['temperature'], c['geo_info']['current']['weather_descriptions']);
        var weather = c['geo_info']['current'];
        print(c['geo_info']['current']['weather_descriptions'].toString());
        _contacts.add(contactItem);
      }

  }
}