import 'package:flutter/material.dart';
import 'cart_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_world/confirm_order.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int price=0;
  var _data;

  @override
  void initState(){
    setState(() {
      _data = getCart();
    });
    super.initState();
  }

  Future getCart() async{

    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('cart').getDocuments();
    return qn.documents;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        
        title: Text('Your Cart',),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: Icon(Icons.search,color: Colors.black),onPressed: (){},),
        ],
      ),
      // body: new Single_cart_product(data: _data),
      bottomNavigationBar: 
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text("Total"),
                  subtitle: Text(price.toString()),
                )
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: (){},
                  child: Text("Check Out",style: TextStyle(color: Colors.white)),
                  color: Colors.orange,             
                )
              ),
            ],
          ),
        ),
    );
  }
}