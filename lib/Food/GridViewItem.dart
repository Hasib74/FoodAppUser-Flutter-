import 'package:flutter/material.dart';
import 'package:foodapp/Model/Category.dart';
import 'package:foodapp/Item/Items.dart';
import 'package:foodapp/Model/Food.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/scheduler.dart';
import 'package:cached_network_image/cached_network_image.dart';
class GridViewItem extends StatefulWidget {
  @override
  _GridViewItemState createState() => _GridViewItemState();
}
class _GridViewItemState extends State<GridViewItem> {

  List<Category> catagory_list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    catagory_list.clear();

    _readAllMenu();

  }


  @override
  Widget build(BuildContext context) {


  //  print("Length1:"+catagory_list.length.toString());

    return  GridView.builder(

        itemCount: catagory_list.length,

        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){

          return new GestureDetector(

            onTap: (){
            //  Navigator.of(context)..push(route)
               Navigator.of(context).push(MaterialPageRoute(builder:(context) => Items(id: index.toString(),title: catagory_list[index].name,) ));


            },
            //catagory_list[index].image

            child: Card(
              elevation: 0.3,
              child: new Stack(
                
                children: <Widget>[

                  Image.network(catagory_list[index].image),


                 Padding(
                      padding: EdgeInsets.only(top: 167),
                      child: Container(
                         width: double.infinity,
                         height: 30,
                         color: Colors.black87,

                         child: Align(
                           alignment: Alignment.center,
                           child: Text(
                             catagory_list[index].name,
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 18,


                             ),),
                         ),

                     ),
                 )


                ],

            //    alignment: Alignment.centerLeft,


              ),

            ),

          );

        }

    );

  }

_readAllMenu() async {

   await FirebaseDatabase.instance.reference().child("Category").once().then((DataSnapshot ds){
        for(var val in ds.value.values){

         Category  category=new Category(val['image'], val['name']);


         setState(() {
           catagory_list.add(category);

         });

        }
    });

  }




}
