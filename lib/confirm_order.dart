import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

class ConfirmOrder extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Confirm Order",
      home: Scaffold(
        appBar: new AppBar(
          title: Text("Confirm Order"),
        ),
            body:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Order is Confirmed"),
              MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
                child: Text("Home", style: TextStyle(color: Colors.white)),
                color: Colors.orange,
              ),
                ],
                
              ),
            )
      ),
    );
  }
}