import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FofBottomNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(

      child: Container(
        height: 50,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(

              height: 50,
              width: MediaQuery.of(context).size.width / 2 -40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.history, color: Colors.white70,size: 35,),
                  Icon(Icons.near_me,color: Colors.white70,size: 35,)
                ],
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width / 2-40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.refresh, color: Colors.white70,size: 35,),
                  Icon(Icons.person, color: Colors.white70,size: 35,)
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.green.shade300,
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
    );
  }
}
