import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Screen/UpdateScreen.dart';
import 'package:flutter_login_ui/Screen/create_blog.dart';
import 'crud.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();
  FirebaseFirestore firebaseFirestore;

  Stream blogsStream;
  Widget BlogsList() {
    return Container(
      child: blogsStream == null
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : ListView(
              shrinkWrap: true,
              children: <Widget>[
                StreamBuilder(
                    stream: blogsStream,
                    builder: (context, snapshot) {
                      if (snapshot.data == null)
                        return Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator());
                      else {
                        return ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: snapshot.data.docs.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BlogsTile(
                                vehicleNumber: snapshot.data.docs[index]
                                    .data()['vehicleNumber'],
                                registrationNumber: snapshot.data.docs[index]
                                    .data()["registrationNumber"],
                                vehicleType: snapshot.data.docs[index]
                                    .data()["vehicleType"],
                                ownerName: snapshot.data.docs[index]
                                    .data()["ownerName"],
                                contactInfo: snapshot.data.docs[index]
                                    .data()["contactInfo"],
                                report:
                                    snapshot.data.docs[index].data()["report"],
                                price:
                                    snapshot.data.docs[index].data()["price"],
                                time: snapshot.data.docs[index]
                                    .data()["timestamp"]
                                    .toDate()
                                    .toString(),
                              );
                            });
                      }
                    })
              ],
            ),
    );
  }

  @override
  void initState() {
    crudMethods.getData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Service ",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Go",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            )
          ],
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: BlogsList(),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String vehicleNumber,
      registrationNumber,
      vehicleType,
      ownerName,
      contactInfo,
      report,
      price,
      time;
  PageController pageController;
  BlogsTile(
      {@required this.vehicleNumber,
      @required this.registrationNumber,
      @required this.vehicleType,
      @required this.ownerName,
      @required this.contactInfo,
      @required this.report,
      @required this.price,
      @required this.time});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SingleChildScrollView(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.all(7.0),
                child: Center(
                    child: Column(children: <Widget>[
                  Row(
                    //ROW 1
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            left: 25, right: 25, top: 5, bottom: 5),
                        child: Icon(
                          Icons.electric_scooter_sharp,
                          color: Colors.black87,
                          size: 24.0,
                        ),
                      ),
                      Flexible(
                        child: Container(
                            margin: EdgeInsets.only(
                                left: 25, right: 25, top: 5, bottom: 5),
                            child: Text(vehicleNumber,
                                style: TextStyle(fontSize: 18))),
                      )
                    ],
                  ),
                  Divider(),
                  Row(//ROW 2
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.wysiwyg,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Text(registrationNumber,
                              style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                  Row(// ROW 3
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.merge_type_rounded,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Text(vehicleType,
                              style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                  Row(// ROW 3
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.person_outline,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child:
                              Text(ownerName, style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                  Row(// ROW 3
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.phone,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Text(contactInfo,
                              style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                  Row(// ROW 3
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.assignment_outlined,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Text(report, style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                  Row(// ROW 3
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.money,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Text(price, style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                  Row(// ROW 3
                      children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 25, right: 25, top: 5, bottom: 5),
                      child: Icon(
                        Icons.timer,
                        color: Colors.black87,
                        size: 24.0,
                      ),
                    ),
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Text(time, style: TextStyle(fontSize: 18))),
                    )
                  ]),
                  Divider(),
                ])),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => new UpdateScreen(
                    vehicleNumber,
                    registrationNumber,
                    vehicleType,
                    ownerName,
                    contactInfo,
                    report,
                    price,
                    time)));
      },
    );
  }
}

class CrudMethods {
  getData() async {
    // ignore: deprecated_member_use
    return Firestore.instance.collection("Users").snapshots();
  }
}
