import 'package:flutter/material.dart';
import 'package:interview/Views/Screens/ProductList/Providers/product_provider.dart';
import 'package:interview/model/product_model.dart';
import 'package:provider/provider.dart';

class ListWidget extends StatefulWidget {
  int? one;
  TextEditingController? controller;
   ListWidget({ Key? key, this.controller, this.one}) : super(key: key);

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, snap, child) {
        var data =snap.products;
        return ListView.builder(
              itemCount: data!.length,
              padding: const EdgeInsets.only(top: 10),
              itemBuilder: (BuildContext context, int index){
                if (widget.controller!.text.isEmpty) {
                          return list(index, data, );
                        } else if (data[index]
                                .name!
                                .toLowerCase()
                                .contains(widget.controller!.text) ||
                            data[index]
                                .description!
                                .toLowerCase()
                                .contains(widget.controller!.text)) {
                          return list(index, data, );
                        } else {
                          return Container();
                        }
        
               }
              );
      }
    );
  }

  Widget list(int index, List<Products>data, ){
            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                padding:const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(data[index].name!,
                     style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),),
                    Text(data[index].description!, style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey
                    ),),

                      Text("Total Qty: ${data[index].quantity!.toString()}", style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey
                    ),),
                  ],
                ),
                
              ),
            );
  }
}