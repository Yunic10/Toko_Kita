 import 'package:flutter/material.dart';
 import 'package:tokokita/bloc/produk_bloc.dart';
import 'package:tokokita/model/produk.dart';
 import 'package:tokokita/ui/produk_form.dart';
 import 'package:tokokita/ui/produk_page.dart';
import 'package:tokokita/ui/profile_page.dart';

 class ProdukDetail extends StatefulWidget {
 Produk? produk;

 ProdukDetail({Key? key, this.produk}) : super(key: key);

 @override
 _ProdukDetailState createState() => _ProdukDetailState();
 }

 class _ProdukDetailState extends State<ProdukDetail> {
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text('Detail Produk'),
 actions: [
  Padding(
 padding: const EdgeInsets.only(right: 20.0),
 child: GestureDetector(
 child: const Icon(Icons.person, size: 26.0),
 onTap: () async {
 Navigator.push(context,
 MaterialPageRoute(builder: (context) => const ProfilePage()));
 },
 )),
 ],
 ),
 body: Center(
 child: Column(
 children: [
 Text(
 "Kode : ${widget.produk!.kodeProduk}",
 style: const TextStyle(fontSize: 20.0),
 ),
 Text(
 "Nama : ${widget.produk!.namaProduk}",
 style: const TextStyle(fontSize: 18.0),
 ),
 Text(
 "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
 style: const TextStyle(fontSize: 18.0),
 ),
 _tombolHapusEdit()
 ],
 ),
 ),
 );
 }

 Widget _tombolHapusEdit() {
 return Row(
 mainAxisSize: MainAxisSize.min,
 children: [
 //Tombol Edit
 OutlinedButton(
 child: const Text("EDIT"),
 onPressed: () {
 Navigator.push(
 context,
 MaterialPageRoute(
 builder: (context) => ProdukForm(
 produk: widget.produk!,
 )));
 }),
 //Tombol Hapus
 OutlinedButton(
 child: const Text("DELETE"), onPressed: () => confirmHapus()),
 ],
 );
 }

 void confirmHapus() {
 AlertDialog alertDialog = AlertDialog(
 content: const Text("Yakin ingin menghapus data ini?"),
 actions: [
 //tombol hapus
 OutlinedButton(
 child: const Text("Ya"),
 onPressed: () {
 ProdukBloc.deleteProduk(id: widget.produk!.id).then((value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProdukPage()));
            });
 },
 ),
 //tombol batal
 OutlinedButton(
 child: const Text("Batal"),
 onPressed: () => Navigator.pop(context),
 )
 ],
 );

 showDialog(builder: (context) => alertDialog, context: context);
 }
 }