import 'package:flutter/material.dart';
import 'package:flutter_login_ui/GetXHelper/FirebaseController.dart';




import 'package:get/get.dart';

class ProfilePage extends GetWidget<FirebaseController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(onPressed: (){
                controller.signout();
              },child: Text("Sign Out ${controller.user}"),),
            ],
          ),
        ),
    );
  }
}