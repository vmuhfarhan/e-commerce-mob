import 'package:flutter/material.dart';
import 'package:e_commerce_mob/screens/menu.dart';
import 'package:e_commerce_mob/screens/itementry_form.dart';

// TODO: Impor halaman ItemEntryFormPage jika sudah dibuat

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            // TODO: Bagian drawer header
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Column(
              children: [
                Text(
                  'E-Commerce Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(8)),
                Text(
                  "Ayo belanja setiap hari disini!",
                ),
              ],
            ),
          ),
            // TODO: Bagian routing
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Halaman Utama'),
              // Bagian redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Tambah Item'),
              // Bagian redirection ke ItemEntryFormPage
              onTap: () {
                /*
                TODO: Buatlah routing ke ItemEntryFormPage di sini,
                setelah halaman ItemEntryFormPage sudah dibuat.
                */
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ItemEntryFormPage(),
                    ));
              },
            ),
        ],
      ),
    );
  }
}