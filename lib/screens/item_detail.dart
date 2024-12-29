import 'package:flutter/material.dart';
import 'package:e_commerce_mob/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ItemDetailPage extends StatefulWidget {
    const ItemDetailPage({Key? key}) : super(key: key);

    @override
    _ItemDetailPageState createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends State<ItemDetailPage> {
    Future<List<dynamic>> fetchProduct() async {
        final request = context.watch<CookieRequest>();
        final response = await request.get('http://127.0.0.1:8000/get-shoes/');
        return response['shoes'];
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Daftar Item'),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: FutureBuilder<List<dynamic>>(
                future: fetchProduct(),
                builder: (context, snapshot) {
                    if (snapshot.data == null) {
                        return const Center(child: CircularProgressIndicator());
                    } else {
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return const Center(
                                child: Text(
                                    "Tidak ada data item.",
                                    style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                ),
                            );
                        } else {
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (_, index) => Card(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, 
                                        vertical: 12
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                Text(
                                                    snapshot.data![index]['name'],
                                                    style: const TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight: FontWeight.bold,
                                                    ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text("Harga: ${snapshot.data![index]['price']}"),
                                                const SizedBox(height: 10),
                                                Text("Deskripsi: ${snapshot.data![index]['description']}"),
                                                const SizedBox(height: 10),
                                                Text("Added: ${snapshot.data![index]['time']}")
                                            ],
                                        ),
                                    ),
                                ),
                            );
                        }
                    }
                }
            ),
        );
    }
}