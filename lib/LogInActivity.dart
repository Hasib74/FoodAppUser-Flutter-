import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:foodapp/Food/foodItem.dart';
import 'package:foodapp/Model/User.dart';
class LogInActivity extends StatefulWidget {
  @override
  _LogInActivityState createState() => _LogInActivityState();
}
TextEditingController email_contoller=new TextEditingController();
TextEditingController password_controller=new TextEditingController();
class _LogInActivityState extends State<LogInActivity> {
  @override
  Widget build(BuildContext context) {
    String email,password;
    return Scaffold (
      backgroundColor: Colors.red,
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(19.0),
            children: <Widget>[
              SizedBox(
                height: 300.0,
              ),
              TextField(
                  controller: email_contoller,
                  decoration: InputDecoration(

                    hintText: "Enter your email",

                    border: OutlineInputBorder(),
                  )
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: password_controller,
                decoration: InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder()


                ),


              ),


              MaterialButton(child: new Text("Log In"),color: Colors.red,onPressed: () async {
                email= email_contoller.text.toString();
                password=password_controller.text.toString();

                if(!email.isEmpty && !password.isEmpty){
                  var ref=await FirebaseDatabase.instance.reference().child("User").child(email);

                  ref.once().then((DataSnapshot ds){
                     String pass=ds.value['password'];

                     if(pass == password){
                       Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context) => FoodItem() ));
                     }else{
                       print("failed");
                     }

                  });

                }else{
                    print("data is empty");
                }

              }

              ),
              SizedBox(
                height: 10,
              ),

              MaterialButton(child: new Text("Google Sing In"),color: Colors.red,onPressed: (){

              }),


                SizedBox(
                height: 10,
              ),
              new GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "myRoute");
                },
                child: new Text("Are you register?",textAlign: TextAlign.center,),
              )
            ],
          )),
    );


  }


}


