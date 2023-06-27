import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/screens/city_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MyNavBar extends StatefulWidget {
  @override
  _MyNavBarState createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: kBackgroundColour,
      items: [
        Icon(Icons.wb_cloudy_outlined, color: Colors.black,),
        Icon(Icons.location_city_outlined, color: Colors.black,),
      ],
      onTap: (index) async {
        if(index == 1){
          var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context){
            return CityScreen();
          }));
        }
      },
      buttonBackgroundColor: Colors.white,
      color: kSecondColour,
      height: 50,
      animationDuration: Duration(milliseconds: 250),
    );
  }
}
