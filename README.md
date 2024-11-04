# Nama : Muhammad Farhan Ramadhan
# NPM : 2306231422

1. Jelaskan apa yang dimaksud dengan Stateless Widget dan Stateful Widget, dan jelaskan perbedaan dari keduanya?
    - Stateless Widget: Widget yang tidak memiliki state atau keadaan yang berubah-ubah. Sekali widget ini dibuat, tampilan atau kondisinya tidak akan berubah selama aplikasi berjalan. Contohnya adalah Text, Icon, dan widget statis lainnya. Karena tidak ada perubahan keadaan, widget ini lebih ringan dan tidak membutuhkan pemrosesan ulang.
    - Stateful Widget: Widget yang memiliki state, sehingga bisa mengalami perubahan kondisi selama aplikasi berjalan. Widget ini dapat diperbarui atau berubah berdasarkan aksi pengguna atau data baru. Contohnya adalah TextField, Checkbox, atau widget yang membutuhkan perubahan tampilan secara dinamis. Stateful Widget membutuhkan metode setState() untuk memperbarui tampilan saat terjadi perubahan.
    - Perbedaan utama: Stateless widget statis dan tidak berubah, sedangkan stateful widget dinamis dan bisa berubah sesuai kondisi atau interaksi pengguna.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
    - MaterialApp: Sebagai root atau induk dari aplikasi, berfungsi untuk mengatur tema, judul, dan pengaturan global lainnya.
    - Scaffold: Memberikan struktur dasar halaman, seperti AppBar, Body, dan bagian lain yang umumnya ada di aplikasi.
    - AppBar: Widget yang menampilkan bilah atas halaman, biasanya untuk judul atau menu navigasi.
    - ElevatedButton.icon: Tombol yang menampilkan ikon dan teks, digunakan untuk aksi seperti "Lihat Daftar Produk", "Tambah Produk", dan "Logout".
    - SnackBar: Pesan singkat yang muncul di bagian bawah layar untuk memberikan informasi kepada pengguna saat tombol ditekan. Digunakan untuk menampilkan pesan sesuai aksi yang dilakukan.
    - Center: Mengatur posisi child widget di tengah layar.
    - Column: Widget untuk menyusun widget secara vertikal.
    - SizedBox: Digunakan untuk memberikan jarak antara elemen.

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
    - Fungsi setState() pada Flutter digunakan di dalam StatefulWidget untuk memberi tahu Flutter bahwa ada perubahan pada state yang memerlukan pembaruan tampilan. Ketika setState() dipanggil, Flutter akan memicu rebuild dari widget tersebut sehingga semua perubahan yang terjadi di dalamnya akan ditampilkan.
    - Variabel-variabel yang terdampak oleh setState() adalah variabel yang terkait dengan state dari widget itu sendiri, biasanya variabel yang diubah seiring waktu atau berdasarkan interaksi pengguna, seperti variabel yang menyimpan teks input, status login, atau data dinamis lainnya.

4. Jelaskan perbedaan antara const dengan final.
    - const: Digunakan untuk mendeklarasikan nilai konstan atau tetap yang sudah diketahui pada saat kompilasi. Artinya, nilai yang ditetapkan pada const harus ditentukan di awal dan tidak bisa diubah. Biasanya digunakan untuk objek atau nilai yang tidak berubah sama sekali selama aplikasi berjalan.
    - final: Digunakan untuk mendeklarasikan nilai tetap yang hanya bisa diinisialisasi sekali, tetapi nilai ini tidak harus ditentukan di awal (bisa ditentukan pada saat runtime). Setelah diinisialisasi, nilainya tidak dapat diubah. final sering digunakan untuk nilai yang ditentukan di dalam fungsi atau berdasarkan input pengguna.

    contoh:
    const int x = 10; // nilai x sudah pasti dan tidak berubah.
    final int y = DateTime.now().year; // nilai y ditentukan pada saat runtime.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
    Berikut adalah langkah-langkah yang saya gunakan untuk mengimplementasikan checklist dalam proyek ini:

    a. Membuat tema E-Commerce: Saya membuat aplikasi dengan judul "E-Commerce App" dan beberapa tombol aksi yang umum digunakan di aplikasi e-commerce, seperti melihat daftar produk, menambah produk, dan logout.
    b. Tombol dengan ikon dan teks: Saya menggunakan ElevatedButton.icon yang mendukung ikon dan teks di dalam tombol, dan membuat tiga tombol untuk "Lihat Daftar Produk", "Tambah Produk", dan "Logout".
    c. Warna yang berbeda untuk setiap tombol: Setiap tombol diberi warna berbeda dengan backgroundColor menggunakan ElevatedButton.styleFrom. Warna-warna yang digunakan: hijau untuk "Lihat Daftar Produk", biru untuk "Tambah Produk", dan merah untuk "Logout".
    d. Menampilkan Snackbar saat tombol ditekan: Pada setiap tombol, saya menambahkan fungsi onPressed yang memanggil ScaffoldMessenger.of(context).showSnackBar() untuk menampilkan Snackbar dengan pesan yang sesuai ketika tombol ditekan, sesuai dengan instruksi yang diberikan.


