import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp/Item/ItemDescription.dart';
import 'package:foodapp/Map/MapActivity.dart';
import 'package:foodapp/Model/Food.dart';
import 'package:extended_image/extended_image.dart';

class Items extends StatefulWidget {

  final id;
  final title;

  Items({this.id,this.title});



  @override
  _ItemsState createState() => _ItemsState();

}


class _ItemsState extends State<Items> {
  List<Food> food_list=[];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    food_list.clear();

    _readData(widget.id);

   // print("Imagesss im  :"+widget.id);

  }
  @override
  Widget build(BuildContext context) {
    
    


    
    if(food_list.length!=null){

      return Scaffold(

        appBar: AppBar(

          centerTitle: true,
          title: new Text(widget.title,style:  TextStyle(color: Colors.black),),
          backgroundColor: Colors.red,

          leading: InkWell(onTap: (){

            Navigator.pop(context);

          }, child:
          Icon(

            Icons.arrow_back,
            color: Colors.white,)
          ),
          actions: <Widget>[
            InkWell(
              onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>MapActivity()));
              },
              child:  Icon(Icons.add_location,color: Colors.white,),
            )

          ],

        ),
        body: ListView.builder(

          itemCount:food_list.length ,

          itemBuilder: (BuildContext context, int index){
            return InkWell(

              /*  final image;
                  final name;
                  final price;
                  final descount;
                  final description;*/
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>new ItemDescription(
                    image:food_list[index].image,
                    name:food_list[index].name,
                    price: food_list[index].price,
                    descount: food_list[index].discount,
                    description: food_list[index].description,
                )));
              },
              child: Card(

                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.only(top:2.0),
                  child: new Stack(
                    children: <Widget>[
                      Container(
                        height:200,
                        width: double.infinity,

                        child:ExtendedImage.network(
                          food_list[index].image,

                          fit: BoxFit.fill,
                          cache: true,
                          border: Border.all(color: Colors.red, width: 1.0),

                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        ),

                      ),


                      Padding(
                        padding: EdgeInsets.only(top: 167),
                        child: Container(
                          width: double.infinity,
                          height: 30,
                          color: Colors.black87,

                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              food_list[index].name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,


                              ),),
                          ),

                        ),
                      )

                    ],

                  ),
                ),
              ),
            );
          },

        ),

      );
    }else{

   //   print("Data is Null");

      return Center(

        child: Text("Data Not Found"),
        
      );
    }


    
  }


  Future   _readData(String id) async{

   await  FirebaseDatabase.instance.reference().child("Foods").orderByChild("menuId").equalTo(id)
        .once().then((DataSnapshot ds){

      for(var val in ds.value.values){

        Food food=new Food(val['description'], val['discount'], val['image'], val['menuId'], val['name'], val['price']);

        setState(() {

          food_list.add(food);

        });

    }
    });

  }

}








