import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp/Model/BannerModel.dart';

class Banners extends StatefulWidget {
  @override
  _BannersState createState() => _BannersState();
}





class _BannersState extends State<Banners>{
 PageController pageController;

  List<BannerModel> bannar_list=[];




 @override
 void initState() {
   // TODO: implement initState
   super.initState();
    bannar_list.clear();
   _getBanner();

 }

 @override
  Widget build(BuildContext context) {

   //_getBanner();
     return Container(
             height: 200,
             width:  double.infinity,
             child :Carousel(
               images:bannar_list.map((BannerModel m){
                  return NetworkImage(m.image);
               }).toList(),

               dotColor: Colors.lightGreenAccent,
               autoplay: false,

               autoplayDuration: new Duration(milliseconds: 500),


             )
    );

  }



 _getBanner()  async {
    bannar_list.clear();
    var ref= FirebaseDatabase.instance.reference().child("Bannar");

     ref.once().then((DataSnapshot ds) {
     // print(ds.value);

       for (var value in ds.value.values){

         /* BannerModel(this.description, this.discount, this.id, this.image, this.name,
      this.price);*/
        BannerModel bn=new BannerModel(value['description'], value['discount'], value['id'], value['image'], value['name'], value['price']);

       setState(() {
         bannar_list.add( bn);
       });


      }
     
   });


  }


 List<Widget> _setImage(){

    List<Widget>  imgList=[];

    for(var i=0;i<bannar_list.length;++i){

        imgList.add(Image.network(bannar_list[i].image));

    }

    return imgList;

  }
}
