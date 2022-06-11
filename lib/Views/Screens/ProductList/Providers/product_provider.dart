import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:interview/model/product_model.dart';
import 'package:overlay_support/overlay_support.dart';

class ProductProvider extends ChangeNotifier{
  Random random =  Random();
 late Timer time;
 int timeCount = 60;

   
List<Products>? products=[];
TextEditingController controller = TextEditingController();

loadProductsFromJson() async {
  List productList =[];
  String data = await rootBundle.loadString('assets/json/products.json');
  var jsonResult = json.decode(data);
  productList = jsonResult['products'];
  products = productList.map((e) => Products.fromJson(e)).toList();
  notifyListeners();
 return products;
}

 updateController(){
  controller = controller;
  notifyListeners();
}



void startTimer() {
  const oneSec =  Duration(seconds: 1);
  time =  Timer.periodic(
    oneSec,
    (Timer timer) {
      if (timeCount == 0) {
        updateIndexQty();
         // timer.cancel();
         
          timeCount=60;
           notifyListeners();
      } else {
          timeCount--;
          notifyListeners();
      
      }
    },
  );
}

 void updateIndexQty() {
int index = random.nextInt(products!.length);

 products![index].quantity = products![index].quantity!-1;
showSimpleNotification(
        Column(
          children: [
            Text( products![index].name!),
            Text( products![index].description!),
            Text( products![index].quantity!.toString()),
          ],
        ),
        background: Colors.red);
notifyListeners();   
  }
}

