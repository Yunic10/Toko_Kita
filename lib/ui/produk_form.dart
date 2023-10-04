import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/profile_page.dart';

 class ProdukForm extends StatefulWidget {
 Produk? produk;

 ProdukForm({Key? key, this.produk}) : super(key: key);

 @override
 _ProdukFormState createState() => _ProdukFormState();
 }

 class _ProdukFormState extends State<ProdukForm> {
 final _formKey = GlobalKey<FormState>();
 bool _isLoading = false;
 String judul = "TAMBAH PRODUK";
 String tombolSubmit = "SIMPAN";

 final _kodeProdukTextboxController = TextEditingController();
 final _namaProdukTextboxController = TextEditingController();
 final _hargaProdukTextboxController = TextEditingController();

 @override
 void initState() {
 super.initState();
 isUpdate();
 }

 isUpdate() {
 if (widget.produk != null) {
 setState(() {
 judul = "UBAH PRODUK";
 tombolSubmit = "UBAH";
 _kodeProdukTextboxController.text = widget.produk!.kodeProduk!;
 _namaProdukTextboxController.text = widget.produk!.namaProduk!;
 _hargaProdukTextboxController.text =
 widget.produk!.hargaProduk.toString(); 38; });
 } else {
 judul = "TAMBAH PRODUK";
 tombolSubmit = "SIMPAN";
 }
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
  title: Text(judul),
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
 body: SingleChildScrollView(
 child: Padding(
 padding: const EdgeInsets.all(8.0),
 child: Form(
 key: _formKey,
 child: Column(
 children: [
 _kodeProdukTextField(),
 _namaProdukTextField(),
 _hargaProdukTextField(),
 _buttonSubmit()
 ],
 ),
 ),
 ),
 ),
 );
 }

 //Membuat Textbox Kode Produk
 Widget _kodeProdukTextField() {
 return TextFormField(
 decoration: const InputDecoration(labelText: "Kode Produk"),
 keyboardType: TextInputType.text,
 controller: _kodeProdukTextboxController,
 validator: (value) {
 if (value!.isEmpty) {
 return "Kode Produk harus diisi";
 }
 return null;
 },
 );
 }

 //Membuat Textbox Nama Produk
 Widget _namaProdukTextField() {
 return TextFormField(
 decoration: const InputDecoration(labelText: "Nama Produk"),
 keyboardType: TextInputType.text,
 controller: _namaProdukTextboxController,
 validator: (value) {
 if (value!.isEmpty) {
 return "Nama Produk harus diisi";
 }
 return null;
 },
 );
 }

 //Membuat Textbox Harga Produk
 Widget _hargaProdukTextField() {
 return TextFormField(
 decoration: const InputDecoration(labelText: "Harga"),
 keyboardType: TextInputType.number,
 controller: _hargaProdukTextboxController,
 validator: (value) {
 if (value!.isEmpty) {
 return "Harga harus diisi";
 }
 return null;
 },
 );
 }

 //Membuat Tombol Simpan/Ubah
 Widget _buttonSubmit() {
 return OutlinedButton(
 child: Text(tombolSubmit),
 onPressed: () {
 var validate = _formKey.currentState!.validate();
 });
 }
 }
