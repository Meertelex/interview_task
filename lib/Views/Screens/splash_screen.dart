import 'package:flutter/material.dart';
import 'package:interview/Resources/string_manager.dart';
import 'package:interview/Views/Screens/ProductList/product_list_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProductListScreen()), (route) => false);

    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: _titleWidget()

      ),
      
    );
  }

  Widget _titleWidget(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(StringManger.splashTitle, style: const TextStyle(fontSize: 25, color: Colors.white),),
         const SizedBox(
          height: 20,
          width: 20,
          child:  CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white) ,
          ),
        ),
      ],
    );
  }
}