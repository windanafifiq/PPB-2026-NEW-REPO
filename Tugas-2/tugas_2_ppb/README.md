# Tugas menganalisis dan menjelaskan kode flutter (Tugas 2)

Aplikasi Flutter sederhana yang mendemonstrasikan penggunaan layout `Row`, `Column`, `Container`, gambar dari internet, ikon, serta komponen stateful widget dengan counter interaktif.

---

## Struktur Kode

```
main.dart
├── main()
├── MyApp (StatelessWidget)
├── RowColumnPage (StatelessWidget)
└── CounterCard (StatefulWidget)
    └── _CounterCardState
```

---

## Penjelasan Per Bagian

### 1. `main()`

```dart
void main() {
  runApp(const MyApp());
}
```

- `main()` adalah fungsi utama dari aplikasi flutter yang mana ketika aplikasi dijalankan, fungsi ini yang akan dipanggil terlebih dahulu.
- `runApp()` menginisialisasi dan menjalankan widget utama aplikasi, lalu pada aplikasi ini widget utama yang dijalankan yaitu `MyApp`.

---

### 2. Class `MyApp` 

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});
```

`MyApp` adalah widget utama aplikasi yang menggunakan `statelessWidget` yang dimana widget ini merupakan widget yang **tidak memiliki state atau data yang berubah selama aplikasi berjalan**

Fungsi dari class `MyApp` sendiri adalah sebagai berikut:
- Mengatur struktur dasar aplikasi
- Menentukan tema aplikasi
- Menentukan halaman utama

### 3. Method `build()`

```dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RowColumnPage(),
    );
  }
}
```

Method `build()` digunakan untuk membangun tampilan antarmuka pengguna (UI). Lalu parameter `BuildContent context` sendiri untuk memberikan informasi posisi widget di dalam widget tree flutter.

Lalu berikut merupakan penjelasan dari Properti dalam `MaterialApp` yang mana widget utama yang menyediakan struktur dasar aplikasi berbasis _Material Design_

| Properti | Keterangan |
|---|---|
| `title` | Judul aplikasi yang tampil di task switcher |
| `theme` | Menggunakan Material 3 dengan warna seed `deepPurple` |
| `home` | Halaman utama yang ditampilkan pertama kali, yaitu `RowColumnPage` |

---

### 4. `RowColumnPage` 

```dart
class RowColumnPage extends StatelessWidget {
  const RowColumnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
```

Class `RowColumnPage` merupakan halaman utama aplikasi yang menampilkan berbagai komponen UI dan menggunakan widget **StatelessWidget**. 

`MediaQuery` digunakan untuk mendapatkan layar perangkat dengan data yang diperoleh yaitu lebar dan tinggi layar.

`Scaffold` merupakan struktur dasar layout dalam flutter yang nantinya akan berisi:
 - Appbar
 - Body
 - FloatingActionButton
 - Drawer

#### **A. AppBar**

```dart
appBar: AppBar(
  title: const Text('My First App', style: TextStyle(color: Colors.black)),
  backgroundColor: Colors.orange[200],
  centerTitle: true,
),
```

- `AppBar` merupakan bagian header aplikasi yang menampilkan judul di bagian atas layar
- Menampilkan judul **"My First App"** di tengah.
- Warna latar belakang AppBar adalah oranye muda (`orange[200]`).

---

#### **B. Body — Column Utama**

```dart
body: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  mainAxisAlignment: MainAxisAlignment.center,
  children: [ ... ],
),
```

Seluruh konten disusun secara vertikal menggunakan `Column`, dengan alignment tengah baik secara horizontal maupun vertikal.

---

#### **Container 1 — Menampilkan gambar dari Internet**

```dart
Container(
  child: AspectRatio(
    aspectRatio: 1.0,
    child: Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
      padding: EdgeInsets.all(20.0),
      color: Colors.lightBlue[100],
      child: Center(
        child: Image.network(
          'https://picsum.photos/200',
          fit: BoxFit.cover,
          width: 500,
        ),
      ),
    ),
  ),
),
```

| Bagian | Keterangan |
|---|---|
| `AspectRatio(1.0)` | Memastikan container berbentuk persegi (lebar = tinggi) |
| `MediaQuery` | Mengambil lebar layar perangkat secara dinamis |
| `margin` | Jarak luar: kiri 20, atas 5, kanan 20, bawah 10 |
| `padding` | Jarak dalam 20 dari semua sisi |
| `color` | Latar belakang biru muda |
| `Image.network` | Memuat gambar acak dari URL `https://picsum.photos/200` |
| `BoxFit.cover` | Gambar memenuhi area container tanpa distorsi |

---

#### **Container 2 — Teks Widget**

```dart
Container(
  width: MediaQuery.of(context).size.width,
  margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
  padding: EdgeInsets.all(20.0),
  color: Colors.pink[200],
  child: Text('What image is that', style: TextStyle(fontSize: 16)),
),
```

- Menampilkan teks **"What image is that"** dengan latar belakang merah muda.
- Lebar container mengikuti lebar layar penuh.

---

#### **Container 3 — Row dengan Ikon Kategori**

```dart
Container(
  color: Colors.yellow[200],
  padding: EdgeInsets.all(20.0),
  margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Column(children: [Icon(Icons.food_bank), Text("Food")]),
      Column(children: [Icon(Icons.landscape), Text("Scenery")]),
      Column(children: [Icon(Icons.people), Text("People")]),
    ],
  ),
),
```

- Menggunakan `Row` untuk menampilkan 3 item secara horizontal.
- `MainAxisAlignment.spaceEvenly` membagi jarak antar item secara merata.
- Setiap item berisi `Column` dengan **ikon** di atas dan **teks** di bawah.

| Ikon | Label |
|---|---|
| `Icons.food_bank` | Food |
| `Icons.landscape` | Scenery |
| `Icons.people` | People |

---

### 5. `CounterCard` — Stateful Widget

```dart
class CounterCard extends StatefulWidget {
  const CounterCard({super.key});

  @override
  State<CounterCard> createState() => _CounterCardState();
}
```

`StatefulWidget` digunakan karena widget ini memiliki **data yang berubah** (nilai counter), sehingga membutuhkan state management.

---

#### **`_CounterCardState` — Logika State**

```dart
class _CounterCardState extends State<CounterCard> {
  int _counter = 0; // State awal: counter dimulai dari 0

  void _incrementCounter() {
    setState(() {
      _counter++; // Menambah nilai counter sebesar 1
    });
  }
  ...
}
```

| Elemen | Keterangan |
|---|---|
| `_counter` | Variabel state yang menyimpan nilai counter (awal = 0) |
| `_incrementCounter()` | Fungsi untuk menambah counter, dipanggil saat tombol ditekan |
| `setState()` | Memberitahu Flutter untuk me-render ulang widget dengan state terbaru |

---

#### **Tampilan CounterCard**

```dart
return Container(
  margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
  padding: EdgeInsets.all(20.0),
  width: MediaQuery.of(context).size.width,
  color: Colors.cyan[100],
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text("Counter here: $_counter", style: TextStyle(fontSize: 16)),
      Container(
        color: Colors.cyan[200],
        padding: EdgeInsets.all(5.0),
        child: IconButton(
          onPressed: _incrementCounter,
          icon: Icon(Icons.add, color: Colors.black, size: 16),
        ),
      ),
    ],
  ),
);
```

- Menampilkan teks **"Counter here: [nilai]"** di sisi kiri.
- Tombol **`+`** di sisi kanan untuk menambah counter.
- `MainAxisAlignment.spaceBetween` memisahkan teks dan tombol ke ujung berlawanan.
- Latar belakang berwarna cyan muda.

---

## Ringkasan Warna UI

| Komponen | Warna |
|---|---|
| AppBar | `orange[200]` |
| Container Gambar | `lightBlue[100]` |
| Container Teks | `pink[200]` |
| Container Ikon | `yellow[200]` |
| CounterCard | `cyan[100]` |
| Tombol Counter | `cyan[200]` |

---

## Konsep Flutter yang Digunakan

| Konsep | Penggunaan |
|---|---|
| `StatelessWidget` | `MyApp`, `RowColumnPage` — tampilan statis |
| `StatefulWidget` | `CounterCard` — tampilan dinamis dengan counter |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Container` | Membungkus widget dengan styling (margin, padding, warna) |
| `MediaQuery` | Mendapatkan ukuran layar secara dinamis |
| `AspectRatio` | Menjaga rasio lebar:tinggi widget |
| `Image.network` | Memuat gambar dari URL internet |
| `setState()` | Memperbarui UI ketika state berubah |

---