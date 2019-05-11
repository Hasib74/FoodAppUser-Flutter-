import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ItemDescription extends StatefulWidget {
  final image;
  final name;
  final price;
  final descount;
  final description;

  //String[] image_list={}


  ItemDescription(
      {this.image, this.name, this.price, this.descount, this.description});

  @override
  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  int _n = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      // backgroundColor: ,
       elevation: 0.0,

       centerTitle: true,
       backgroundColor: Colors.red,
       title: Text(widget.name),
       actions: <Widget>[
         (
             new Icon(Icons.add_shopping_cart,color: Colors.white,)
         ),
       ],
     ),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,

       children: <Widget>[

         Stack(

         children: <Widget>[
           new Container(
               width: double.infinity,
               height: 220,
               child:Image.network(widget.image,fit: BoxFit.fill,)
           ),








         ],
         ),

         Row(
           
           children: <Widget>[
             
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text("Price :"+widget.price,style: TextStyle(color: Colors.green,fontSize: 17),),
               ),
             ),


             Padding(
               padding: const EdgeInsets.only(right:25.0,top: 6),
               child: new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[

                   Padding(
                     padding: const EdgeInsets.only(right:8.0),
                     child: new FloatingActionButton(
                       heroTag: "a",
                       onPressed: minus,

                       child: Padding(
                         padding: const EdgeInsets.only(bottom:10.0),
                         child: new Icon(Icons.minimize, color: Colors.black,),
                       ),
                       backgroundColor: Colors.white,),
                   ),

                   new Text('$_n',
                       style: new TextStyle(fontSize: 15.0)),

                   Padding(
                     padding: const EdgeInsets.only(left:8.0),
                     child: new FloatingActionButton(
                       heroTag: "b",
                       onPressed: add,
                       child: new Icon(
                           Icons.add,
                           color: Colors.black),
                       backgroundColor: Colors.white,),
                   ),
                 ],
               ),
             ),
           ],
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: SizedBox(height: 10),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("Description"),
         ),
         Padding(
           padding: const EdgeInsets.only(top:8.0),
           child: SizedBox(height: 4),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text(widget.description),
         ),

         Padding(

           padding: const EdgeInsets.only(top:150.0,left: 10,right: 10),
           child: MaterialButton(
             onPressed: (){},
            // shape: Stro,
             color: Colors.red,
             minWidth: double.infinity,
             child: Text("Buy",style: TextStyle(color: Colors.white),
             ),),
         )

       ],
     ),
    );
  }




  void add() {
    setState(() {
      _n++;
    });
  }


  void minus() {
    setState(() {
      if(_n != 1){
          _n--;
      }
    });
  }


}


