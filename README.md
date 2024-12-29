# Nama : Muhammad Farhan Ramadhan
# NPM : 2306231422

Tugas 7
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

Tugas 8
1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
    const digunakan di Flutter untuk mendefinisikan nilai atau widget yang bersifat konstan, yang tidak akan berubah selama aplikasi berjalan. Penggunaan const dapat meningkatkan performa karena objek yang dideklarasikan sebagai const akan di-instantiate hanya sekali dan dapat digunakan kembali (reused) tanpa harus di-render ulang, sehingga menghemat memori.
    Gunakan const:
    - Gunakan const pada widget atau nilai yang statis dan tidak akan berubah selama aplikasi berjalan.
    - Cocok digunakan pada widget yang tidak memiliki perubahan state atau interaksi dinamis, seperti teks statis atau layout.
    Jangan gunakan const:
    - Jangan gunakan const pada widget atau nilai yang sifatnya dinamis atau mungkin berubah, karena const tidak memungkinkan perubahan.

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
    Column: Menyusun widget secara vertikal (dari atas ke bawah).
        contoh implementasi:
        Column(
            children: [
                Text("Widget 1"),
                Text("Widget 2"),
                Text("Widget 3"),
            ],
            );

    Row: Menyusun widget secara horizontal (dari kiri ke kanan).
        contoh implementasi:
        Row(
            children: [
                Icon(Icons.star),
                Text("Widget 1"),
                Text("Widget 2"),
            ],
            );

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
    Pada halaman form di tugas ini, elemen input yang digunakan adalah TextFormField untuk nama, deskripsi, dan jumlah (amount). Elemen ini berfungsi untuk menerima input teks dengan berbagai konfigurasi. Elemen input lainnya yang bisa digunakan tapi tidak digunakan di tugas ini antara lain:
    - DropdownButtonFormField: untuk pilihan dengan nilai tetap.
    - Checkbox: untuk pilihan ya atau tidak.
    - Radio: untuk pilihan eksklusif di antara beberapa opsi.
    - Slider: untuk memilih nilai dari rentang tertentu.

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
    Pengaturan tema dalam aplikasi Flutter dilakukan di bagian MaterialApp dengan mendefinisikan properti theme. Tema ini mencakup warna-warna utama, skema warna, dan gaya teks yang digunakan secara konsisten di seluruh aplikasi. Pada aplikasi yang dibuat, tema sudah diimplementasikan dengan warna utama deepPurple dan secondary diatur ke deepPurple[400].

    contoh implementasi:
    Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepPurple,
            ).copyWith(secondary: Colors.deepPurple[400]),
        ),
        home: MyHomePage(),
        );
    }

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
    Navigasi pada aplikasi dengan banyak halaman di Flutter biasanya diatur menggunakan Navigator dan MaterialPageRoute. Pada aplikasi ini, Navigator.push digunakan untuk berpindah ke halaman baru, sedangkan Navigator.pushReplacement digunakan untuk mengganti halaman saat ini tanpa bisa kembali ke halaman sebelumnya dengan tombol back.






