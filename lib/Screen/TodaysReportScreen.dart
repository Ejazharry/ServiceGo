import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class TodaysReportScreen extends StatefulWidget {
  @override
  _TodaysReportScreenState createState() => _TodaysReportScreenState();
}

class _TodaysReportScreenState extends State<TodaysReportScreen> {
  Query where(
      String field, {
        dynamic isEqualTo,
        dynamic isLessThan,
        dynamic isLessThanOrEqualTo,
        dynamic isGreaterThan,
        dynamic isGreaterThanOrEqualTo,
        dynamic arrayContains,
        bool isNull,
      }){

  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    DateTime date = new DateTime(now.year, now.month, now.day);
    var now_1w = now.subtract(Duration(days: 0));
    var now_1m = new DateTime(now.year, now.month-1, now.day);
    var now_1y = new DateTime(now.year-1, now.month, now.day);
    var currDt = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Center( child:Row(

          children: <Widget>[
            Text(
              "Today's",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "Vehicles",
              style: TextStyle(fontSize: 22, color: Colors.blue),
            )
          ],
        ),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body:  StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
        .collection('Users')
        .where('date',
        isEqualTo: date)
        .snapshots(),
        builder: (context, snapshot) {
        return (snapshot.connectionState == ConnectionState.waiting)
         ? Center(child: CircularProgressIndicator())
        : ListView.builder(
         itemCount: snapshot.data.documents.length,
         itemBuilder: (context, index) {
         DocumentSnapshot data = snapshot.data.documents[index];
         return Card(
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

                child:  Column(children: <Widget>[
                Row(
                //ROW 1
                  children: [
                   Container(
                     margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                     child: Icon(
                     Icons.electric_scooter_sharp,
                     color: Colors.black87,
                     size: 24.0,
                     ),
                     ),
                    Flexible(
                     child:Container(
                       margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                       child: Text( data['vehicleNumber'], style: TextStyle(fontSize: 18),)
                      ),
                   )
                  ],
          ),
          Divider(),
          Row(//ROW 2
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.wysiwyg,
                    color: Colors.black87,
                    size: 24.0,
                  ),
                ),
                Flexible(
                  child:Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                      child: Text( data['registrationNumber'], style: TextStyle(fontSize: 18),)
                  ),
                )

              ]),
          Divider(),
          Row(// ROW 3
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.merge_type_rounded,
                    color: Colors.black87,
                    size: 24.0,
                  ),
                ),
                Flexible(
                  child:Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                      child: Text( data['vehicleType'], style: TextStyle(fontSize: 18),)
                  ),
                )
              ]),
          Divider(),
          Row(// ROW 3
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black87,
                    size: 24.0,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                    child: Text( data['ownerName'],style: TextStyle(fontSize: 18),)
                ),
              ]),
          Divider(),
          Row(// ROW 3
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.phone,
                    color: Colors.black87,
                    size: 24.0,
                  ),
                ),
                Flexible(
                  child:Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                      child: Text( data['contactInfo'], style: TextStyle(fontSize: 18),)
                  ),
                )
              ]),
          Divider(),
          Row(// ROW 3
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.assignment_outlined,
                    color: Colors.black87,
                    size: 24.0,
                  ),
                ),
                Flexible(
                  child:Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                      child: Text( data['report'], style: TextStyle(fontSize: 18),)
                  ),
                )
              ]),
          Divider( ),
          Row(// ROW 3
              children: [
                Container(
                  margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                  child: Icon(
                    Icons.money,
                    color: Colors.black87,
                    size: 24.0,
                  ),
                ),
                Flexible(
                  child:Container(
                      margin: EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
                      child: Text( data['price'], style: TextStyle(fontSize: 18),)
                  ),
                )
              ]),

        ])),),],),
    );
    },
    );
    },
    ),
    );
  }
}
