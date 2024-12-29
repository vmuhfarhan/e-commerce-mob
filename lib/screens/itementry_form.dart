import 'package:flutter/material.dart';
import 'package:e_commerce_mob/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_mob/screens/item_list.dart';

class ItemEntryFormPage extends StatefulWidget {
    const ItemEntryFormPage({super.key});

    @override
    State<ItemEntryFormPage> createState() => _ItemEntryFormPageState();
}

class _ItemEntryFormPageState extends State<ItemEntryFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Form Tambah Item',
                    style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Nama Item",
                                        labelText: "Nama Item",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                            _name = value ?? "";
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Nama tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Harga",
                                        labelText: "Harga",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                            _price = int.tryParse(value ?? "") ?? 0;
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Harga tidak boleh kosong!";
                                        }
                                        if (int.tryParse(value) == null) {
                                            return "Harga harus berupa angka!";
                                        }
                                        return null;
                                    },
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(
                                    decoration: InputDecoration(
                                        hintText: "Deskripsi",
                                        labelText: "Deskripsi",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(5.0),
                                        ),
                                    ),
                                    onChanged: (String? value) {
                                        setState(() {
                                            _description = value ?? "";
                                        });
                                    },
                                    validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                            return "Deskripsi tidak boleh kosong!";
                                        }
                                        return null;
                                    },
                                    maxLines: 4,
                                ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(Colors.indigo),
                                        ),
                                        onPressed: () async {
                                            if (_formKey.currentState!.validate()) {
                                                try {
                                                    final response = await request.post(
                                                        "http://127.0.0.1:8000/create-shoes-flutter/",
                                                        {
                                                            'name': _name,
                                                            'price': _price.toString(),
                                                            'description': _description,
                                                        },
                                                    );

                                                    if (response['status'] == 'success') {
                                                        if (context.mounted) {
                                                            ScaffoldMessenger.of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content: Text("Item berhasil ditambahkan!"),
                                                                    ),
                                                                );
                                                            Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(builder: (context) => const ItemListPage()),
                                                            );
                                                        }
                                                    } else {
                                                        if (context.mounted) {
                                                            ScaffoldMessenger.of(context)
                                                                .showSnackBar(
                                                                    const SnackBar(
                                                                        content: Text("Terdapat kesalahan, silakan coba lagi."),
                                                                    ),
                                                                );
                                                        }
                                                    }
                                                } catch (e) {
                                                    if (context.mounted) {
                                                        ScaffoldMessenger.of(context)
                                                            .showSnackBar(
                                                                SnackBar(
                                                                    content: Text("Error: $e"),
                                                                ),
                                                            );
                                                    }
                                                }
                                            }
                                        },
                                        child: const Text(
                                            "Save",
                                            style: TextStyle(color: Colors.white),
                                        ),
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}