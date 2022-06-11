
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:interview/Views/Screens/ProductList/Providers/product_provider.dart';
import 'package:interview/Views/Screens/ProductList/list_widget.dart';

import 'package:interview/model/product_model.dart';
import 'package:provider/provider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({ Key? key }) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {








late ProductProvider productProvider;



@override
  void initState() {
  productProvider = Provider.of<ProductProvider>(context, listen: false);
  productProvider.loadProductsFromJson();
  
  productProvider.startTimer();
  
 
  
    // TODO: implement initState
    super.initState();
  }

 

 

  






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            _searchWidget(),
            _productList(),
            
          ],
        ),
      ),
      
    );
  }


  AppBar _appbar(){
    return AppBar(
      elevation: 0.0,
    automaticallyImplyLeading: false,
      title: const Text("Products"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Consumer<ProductProvider>(
            builder: (context, data, child) {
              return Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child: Center(child: Text(
                  data.timeCount.toString(),
                  style:const TextStyle(
                    color: Colors.black
                  ),
                  ),
                  ),
              );
            }
          ),
        ),

      ],
          

    );
  }

  Widget _searchWidget(){
    return  SizedBox(
      height: 40,
      child: Consumer<ProductProvider>(
        builder: (context, data, child) {
          return TextFormField(
            controller: data.controller,
            decoration:  InputDecoration(
              hintText: "Search Product",
             
                
              ),
              onChanged: (value){
                data.updateController();
              },
             
            );
        }
      ),
      );
    
  }

  Widget _productList(){
    return Expanded(child: Consumer<ProductProvider>(
      builder: (context, data, child) {
      return ListWidget(controller: data.controller,);
   } ));
  }
}