import 'package:flutter/material.dart';
import 'package:e_commerce_mob/widgets/left_drawer.dart';
import 'package:e_commerce_mob/screens/itementry_form.dart';
import 'package:e_commerce_mob/screens/item_detail.dart';
import 'package:e_commerce_mob/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.red),
        ShopItem("Tambah Item", Icons.add_shopping_cart, Colors.yellow),
        ShopItem("Logout", Icons.logout, Colors.green),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text(
                    'Shopping List',
                    style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            drawer: const LeftDrawer(),
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        children: <Widget>[
                            const Padding(
                                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                child: Text(
                                    'Welcome to E-Commerce Mobile',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                    ),
                                ),
                            ),
                            // Grid layout
                            GridView.count(
                                primary: true,
                                padding: const EdgeInsets.all(20),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                children: items.map((ShopItem item) {
                                    return ShopCard(item);
                                }).toList(),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}

class ShopItem {
    final String name;
    final IconData icon;
    final Color color;

    ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
    final ShopItem item;

    const ShopCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Material(
            color: item.color,
            child: InkWell(
                onTap: () async {
                    // Tombol Lihat Item
                    if (item.name == "Lihat Item") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemDetailPage(),
                            ));
                    }
                    // Tombol Tambah Item
                    else if (item.name == "Tambah Item") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ItemEntryFormPage(),
                            ));
                    }
                    // Tombol Logout
                    else if (item.name == "Logout") {
                        final response = await request.logout(
                            "http://127.0.0.1:8000/logout/");
                        String message = response["message"];
                        if (response['status']) {
                            String uname = response["username"];
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("$message Sampai jumpa, $uname."),
                            ));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                        }
                    }
                },
                child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                Icon(
                                    item.icon,
                                    color: Colors.white,
                                    size: 30.0,
                                ),
                                const Padding(padding: EdgeInsets.all(3)),
                                Text(
                                    item.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(color: Colors.white),
                                ),
                            ],
                        ),
                    ),
                ),
            ),
        );
    }
}