import 'package:flutter/material.dart';
import 'package:e_commerce_mob/screens/menu.dart';
import 'package:e_commerce_mob/screens/itementry_form.dart';
import 'package:e_commerce_mob/screens/item_list.dart';
import 'package:e_commerce_mob/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LeftDrawer extends StatelessWidget {
    const LeftDrawer({super.key});

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Drawer(
            child: ListView(
                children: [
                    DrawerHeader(
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                        ),
                        child: const Column(
                            children: [
                                Text(
                                    'E-Commerce Mobile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                    ),
                                ),
                                Padding(padding: EdgeInsets.all(10)),
                                Text(
                                    "Pilihan Menu",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                    ),
                                ),
                            ],
                        ),
                    ),
                    ListTile(
                        leading: const Icon(Icons.home_outlined),
                        title: const Text('Halaman Utama'),
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                ),
                            );
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.add_shopping_cart),
                        title: const Text('Tambah Item'),
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ItemEntryFormPage(),
                                ),
                            );
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.shopping_basket),
                        title: const Text('Daftar Item'),
                        onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ItemListPage(),
                                ),
                            );
                        },
                    ),
                    ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Logout'),
                        onTap: () async {
                            try {
                                final response = await request.logout(
                                    "http://127.0.0.1:8000/logout/");
                                
                                if (response['status']) {
                                    if (context.mounted) {
                                        String message = response["message"];
                                        String uname = response["username"] ?? "";
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                            content: Text("$message Sampai jumpa, $uname."),
                                        ));
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const LoginPage()),
                                        );
                                    }
                                }
                            } catch (e) {
                                if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                            content: Text("Terjadi kesalahan saat logout."),
                                    ));
                                }
                            }
                        },
                    ),
                ],
            ),
        );
    }
}