import 'package:flutter/material.dart';
import 'package:e_commerce_mob/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_mob/screens/login.dart';

class ItemListPage extends StatefulWidget {
    const ItemListPage({Key? key}) : super(key: key);

    @override
    _ItemListPageState createState() => _ItemListPageState();
}

class _ItemListPageState extends State<ItemListPage> {
    Future<List<dynamic>> fetchProduct() async {
        final request = context.watch<CookieRequest>();
        try {
            final response = await request.get('http://127.0.0.1:8000/get-shoes/');
            if (response is Map<String, dynamic> && response.containsKey('shoes')) {
                return response['shoes'];
            }
            return [];
        } catch (e) {
            // If unauthorized (e.g., session expired), redirect to login
            if (e.toString().contains('401') || e.toString().contains('403')) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                );
            }
            return [];
        }
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
                    if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Center(
                            child: Text(
                                "Tidak ada data item.",
                                style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                            ),
                        );
                    }
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, 
                                vertical: 12
                            ),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                    ),
                                ],
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                    Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                            Text(
                                                snapshot.data![index]['name'],
                                                style: const TextStyle(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                ),
                                            ),
                                            PopupMenuButton(
                                                itemBuilder: (context) => [
                                                    PopupMenuItem(
                                                        onTap: () async {
                                                            final request = context.read<CookieRequest>();
                                                            final response = await request.post(
                                                                'http://127.0.0.1:8000/delete-shoes-flutter/${snapshot.data![index]["id"]}/',
                                                                {}
                                                            );

                                                            if (response['status'] == 'success') {
                                                                setState(() {});
                                                                if (context.mounted) {
                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                        const SnackBar(
                                                                            content: Text("Item berhasil dihapus!"),
                                                                        ),
                                                                    );
                                                                }
                                                            }
                                                        },
                                                        child: const Text('Delete'),
                                                    ),
                                                ],
                                            ),
                                        ],
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Harga: ${snapshot.data![index]['price']}",
                                        style: const TextStyle(fontSize: 16.0),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        snapshot.data![index]['description'],
                                        style: const TextStyle(fontSize: 14.0),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                        "Ditambahkan: ${snapshot.data![index]['time']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                        ),
                                    ),
                                ],
                            ),
                        ),
                    );
                }
            ),
        );
    }
}