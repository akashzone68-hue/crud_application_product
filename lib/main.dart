import 'package:crud_application_product/feature/product/presentation/bindings/product_binding.dart';
import 'package:crud_application_product/feature/product/presentation/pages/product_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Product CRUD',

      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),

      initialBinding: ProductBinding(),

      home: const ProductPages(),
    );
  }
}
