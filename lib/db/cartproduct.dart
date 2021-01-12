import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'dart:async';

class CartService {

  Firestore _firestore = Firestore.instance;
  String ref = 'cart';

  void uploadProduct(
      {String productName, int price, int quantity, String image}) {
    var id = Uuid();
    String productId = id.v1();

    _firestore.collection(ref).document(productId).setData({
      'name': productName,
      'id': productId,
      'quantity': quantity,
      'price': price,
      'picture': image,
    }).whenComplete(() {
      Fluttertoast.showToast(msg: 'Product added to the Cart');
    });
  }
}
