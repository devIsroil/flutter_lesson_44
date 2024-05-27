import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/product_controller.dart';
import '../../models/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final productController = ProductController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLoading = true;

    productController.getProducts().then((value) {
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.9),
      appBar: AppBar(
        title: Text("Products"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : productController.list.isEmpty
              ? Center(
                  child: Text("Mahsulotlar mavjud emas"),
                )
              : GridView.builder(
        itemCount: productController.list.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1/3,
                      crossAxisCount: 2,
                  crossAxisSpacing: 20,mainAxisSpacing: 20),
                  itemBuilder: (context, index) {
                    Product product = productController.list[index];
                    return Container(
                      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        //mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(product.image,height: 100.h,),
                          Text(product.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14),textAlign: TextAlign.center,),
                          SizedBox(height: 10,),
                          Text(product.description)
                        ],
                      ),

                    );
                  },
                ),
    );
  }
}
