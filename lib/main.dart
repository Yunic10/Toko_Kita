import 'package:flutter/material.dart';
import 'package:tokokita/ui/registrasi_page.dart';
import 'package:tokokita/ui/produk_page.dart';

 void main() {
 runApp(const MyApp());
 }

 class MyApp extends StatelessWidget {
 const MyApp({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
 return const MaterialApp(
 title: 'Toko Kita',
 debugShowCheckedModeBanner: false,
 home: ProdukPage(),
 );
 }
 }
