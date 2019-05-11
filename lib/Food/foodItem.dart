import 'package:flutter/material.dart';
import 'package:foodapp/Food/Banners.dart';
import 'package:foodapp/Food/GridViewItem.dart';
import 'package:foodapp/Map/MapActivity.dart';
class FoodItem extends StatefulWidget {
  @override
  _FoodItemState createState() => _FoodItemState();
}


class _FoodItemState extends State<FoodItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.red,
        leading: Icon(Icons.menu),

        actions: <Widget>[
          InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>MapActivity()));
            },
            child:  Icon(Icons.add_location,color: Colors.white,),
          )

        ],

      ),
      body: new Stack(

        children: <Widget>[
            new  Banners(),
            Padding(
              padding: const EdgeInsets.only(top:210.0),
              child: new  GridViewItem(),
            ),


        ],
      ),

    );
  }
}

