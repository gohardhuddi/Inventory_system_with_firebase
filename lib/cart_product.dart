import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello_world/confirm_order.dart';

class Single_cart_product extends StatefulWidget {
  @override
  _Single_cart_productState createState() => _Single_cart_productState();
}

class _Single_cart_productState extends State<Single_cart_product> {
  int price = 0;
  var _data = [];

  getCart() async {
    var firestore = Firestore.instance;

    QuerySnapshot qn = await firestore.collection('cart').getDocuments();
    setState(() {
      _data = qn.documents;
    });
    gettotalprice();
  }

  gettotalprice() {
    for (int i = 0; i < _data.length; i++) {
      price += _data[i].data['price'];
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'Your Cart',
        ),
        centerTitle: true,
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
          itemCount: _data.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  // =================LEADING PICTURE===========
                  leading: Image.asset(_data[index].data['picture'],
                      width: 80.0, height: 80.0),
                  //===================TITLE=================
                  title: Text(_data[index].data['name']),
                  //===================SUBTITLE===============
                  subtitle: Row(
                    children: <Widget>[
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            _data[index].data['price'].toString(),
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          )),
                      Container(
                        width: 120.0,
                      ),
                    ],
                  ),
                  trailing: FittedBox(
                    fit: BoxFit.fill,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(Icons.arrow_drop_up),
                            iconSize: 40,
                            onPressed: () {}),
                        Text(
                          _data[index].data['quantity'].toString(),
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 40,
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
                child: ListTile(
              title: Text("Total"),
              subtitle: Text(price.toString()),
            )),
            Expanded(
                child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ConfirmOrder()));
              },
              child: Text("Check Out", style: TextStyle(color: Colors.white)),
              color: Colors.orange,
            )),
          ],
        ),
      ),
    );
  }
}
