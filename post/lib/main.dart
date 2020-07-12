import 'package:flutter/material.dart';
import 'package:post/getresultmodel.dart';

import 'postresultmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Post postResult = null;
  Get getResult = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ex POST GET"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text((postResult != null)
                  ? postResult.id +
                      " | " +
                      postResult.name +
                      " | " +
                      postResult.job +
                      " | " +
                      postResult.created
                  : "Tidak ada data"),
              RaisedButton(
                onPressed: () {
                  Post.connectApi("yolo", "guru").then((value) {
                    postResult = value;
                    setState(() {});
                  });
                },
                child: Text("post"),
              ),
              SizedBox(
                height: 150,
              ),
              Text((getResult != null)
                  ? getResult.id +
                      " | " +
                      getResult.nama +
                      " | " +
                      getResult.email
                  : "Tidak ada data"),
              RaisedButton(
                onPressed: () {
                  Get.connectApi("2").then((value) {
                    getResult = value;
                    setState(() {});
                  });
                },
                child: Text("Get"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
