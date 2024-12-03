# books

362358302106_Fitri ayu wulan sari 

### PRAKTIKUM 1

Soal 2
 - D:\Flutter_Praktikum\src week-11\books\image\w11_soal2.png

Soal 3

 1. Jelaskan maksud kode langkah 5 tersebut terkait substring dan cachError!
 Answer : 
a. substring(0, 450) Fungsi ini digunakan untuk membatasi jumlah karakter yang ditampilkan dari data respons API. Penjelasan rinci:
- **Fungsi `substring`:**  
  `substring(int startIndex, [int? endIndex])` adalah metode yang mengambil potongan string mulai dari `startIndex` hingga sebelum `endIndex`.

- **Penggunaan dalam Kode:**
  result = value.body.toString().substring(0, 450);
  Di sini, kita menggunakan `substring` untuk mengambil hanya **450 karakter pertama** dari respons API yang terdapat di `value.body`.

- **Kenapa Perlu Dibatasi?**
  - API sering kali mengembalikan data yang sangat besar atau kompleks, terutama dalam format JSON. Jika data tersebut langsung ditampilkan ke UI tanpa dibatasi, aplikasi dapat menjadi lambat atau tidak responsif.
  - Dengan membatasi karakter hingga 450, Anda menghindari risiko overload pada UI, sekaligus menjaga tampilannya tetap rapi.

b. catchError, metode ini digunakan untuk menangani **kesalahan** yang terjadi selama operasi asinkron, seperti memanggil API. Penjelasan rinci:

- **Fungsi `catchError`:**  
  `catchError` adalah metode yang menangkap error dalam Future. Error tersebut mungkin terjadi karena:
  - API tidak dapat dijangkau (koneksi internet terputus).
  - Respons API memiliki masalah (misalnya, server mengembalikan kode 500 - Internal Server Error).
  - Kesalahan pada kode pemanggilan API (misalnya, URL tidak valid).

- **Penggunaan dalam Kode:**
  .catchError((_) {
    setState(() {
      result = 'An error occurred';
      isLoading = false;
    });
  });

  - **Penjelasan Baris demi Baris:**
    - Ketika error terjadi selama proses `getData`, blok ini akan dipanggil.
    - `result` akan diatur ke string **'An error occurred'**, sehingga pengguna tahu bahwa terjadi masalah.
    - `isLoading` diatur menjadi `false` untuk menghentikan indikator loading (`CircularProgressIndicator`).

- **Kenapa Perlu `catchError`?**
  - Tanpa `catchError`, aplikasi bisa crash jika error tidak ditangani.
  - Pengguna tidak akan tahu kenapa tombol "GO!" tidak bekerja jika error dibiarkan begitu saja.
  - Dengan menangani error, Anda dapat memberikan feedback kepada pengguna (misalnya: menampilkan pesan error).

### Mengapa Keduanya Penting?

- **`substring`:**
  - Membatasi panjang data yang ditampilkan, menjaga UI tetap responsif.
  - Melindungi aplikasi dari overload data jika respons API terlalu besar.

- **`catchError`:**
  - Menjaga aplikasi agar tidak crash ketika terjadi kesalahan selama operasi asinkron.
  - Memberikan feedback yang jelas kepada pengguna tentang status aplikasi.

2. Cupture berupa gif
 - D:\Flutter_Praktikum\src week-11\books\image\w11_2.png
 - D:\Flutter_Praktikum\src week-11\books\image\w11.gif


### PRAKTIKUM 2

Soal 4
a. Jelaskan maksud kode langkah 1 dan 2 tersebut!
Answer :

### **1. Fungsi `returnOneAsync`**
```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}
```
- **Maksud**: Fungsi ini menunda eksekusi selama **3 detik** menggunakan `Future.delayed`.
- Setelah 3 detik, fungsi mengembalikan nilai `1`.

---

### **2. Fungsi `returnTwoAsync`**
```dart
Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}
```
- **Maksud**: Sama seperti `returnOneAsync`, tetapi mengembalikan nilai `2` setelah **3 detik**.

---

### **3. Fungsi `returnThreeAsync`**
```dart
Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```
- **Maksud**: Sama dengan dua fungsi sebelumnya, tetapi fungsi ini mengembalikan nilai `3` setelah **3 detik**.

---

### **4. Fungsi `count`**
```dart
Future<int> count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    totalResult = total.toString(); 
  });
  return total;
}
```
#### **Penjelasan langkah per langkah:**
1. **Deklarasi variabel**:
   - `int total = 0;` digunakan untuk menyimpan jumlah dari nilai yang dihasilkan oleh fungsi asinkron (`returnOneAsync`, `returnTwoAsync`, `returnThreeAsync`).

2. **Menjalankan fungsi `returnOneAsync`**:
   ```dart
   total = await returnOneAsync();
   ```
   - Fungsi `returnOneAsync` dijalankan terlebih dahulu.
   - Karena ada keyword **`await`**, program akan menunggu selama 3 detik hingga nilai `1` dikembalikan, kemudian menyimpannya ke variabel `total`.

3. **Menjalankan fungsi `returnTwoAsync`**:
   ```dart
   total += await returnTwoAsync();
   ```
   - Setelah nilai `1` dari fungsi sebelumnya ditambahkan ke `total`, fungsi `returnTwoAsync` dijalankan.
   - Program kembali menunggu selama **3 detik**, lalu menambahkan nilai `2` ke `total`.

4. **Menjalankan fungsi `returnThreeAsync`**:
   ```dart
   total += await returnThreeAsync();
   ```
   - Program menunggu selama **3 detik** untuk mendapatkan nilai `3` dari `returnThreeAsync`.
   - Nilai tersebut kemudian ditambahkan ke `total`.

5. **Update nilai `totalResult`**:
   ```dart
   setState(() {
     totalResult = total.toString();
   });
   ```
   - Setelah semua proses selesai, nilai total (jumlah `1 + 2 + 3 = 6`) diubah menjadi string dan disimpan dalam `totalResult`.
   - **`setState`** digunakan untuk memperbarui UI agar menampilkan nilai terbaru dari `totalResult`.

6. **Mengembalikan hasil**:
   - Fungsi `count()` mengembalikan nilai total (`6`) sebagai hasil akhir.

---

### **Alur Eksekusi**
1. Ketika `count()` dipanggil, program akan secara berurutan menjalankan:
   - `returnOneAsync` → Menunggu 3 detik → Menambahkan `1`.
   - `returnTwoAsync` → Menunggu 3 detik → Menambahkan `2`.
   - `returnThreeAsync` → Menunggu 3 detik → Menambahkan `3`.
2. Proses total membutuhkan **9 detik** (3 detik per fungsi).
3. Setelah semua selesai, UI akan diperbarui dengan nilai total `6`.

Hasil Cupture
- D:\Flutter_Praktikum\src week-11\books\image\gif3.gif

### PRAKTIKUM 3

Soal 5
A. Jelaskan maksud kode langkah 2 tersebut!
Answer:

### **1. Deklarasi Completer**
```dart
late Completer completer;
```
- **`Completer`** adalah objek yang memungkinkan Anda untuk menyelesaikan (`complete`) atau memberikan hasil pada sebuah `Future` secara manual.
- **`late`** digunakan untuk memastikan bahwa variabel **`completer`** akan diinisialisasi sebelum digunakan, tetapi tidak perlu diinisialisasi langsung saat deklarasi.

### **2. Fungsi `getNumber`**
```dart
Future getNumber() {
  completer = Completer<int>();
  calculate();
  return completer.future;
}
```
- **`getNumber`**:
  - Fungsi ini membuat objek **`Completer`** baru yang bertipe **`Completer<int>`**. Artinya, `Completer` ini akan menghasilkan sebuah `Future` dengan nilai bertipe **`int`**.
  - Fungsi ini memulai proses asinkron dengan memanggil **`calculate`** untuk melakukan perhitungan atau operasi asinkron lainnya.
  - **`completer.future`** adalah `Future` yang akan "diselesaikan" (completed) saat fungsi **`completer.complete(value)`** dipanggil di bagian kode lain.

#### **Return Value**
- Fungsi ini mengembalikan sebuah **`Future`**, tetapi `Future` tersebut tidak selesai (pending) hingga metode **`completer.complete`** dipanggil.

### **3. Fungsi `calculate`**
```dart
Future calculate() async {
  await Future.delayed(const Duration(seconds: 5));
  completer.complete(42);
}
```
- **`calculate`**:
  - Fungsi ini adalah proses asinkron yang mensimulasikan sebuah operasi dengan **`Future.delayed`** selama 5 detik.
  - Setelah penundaan selesai, fungsi memanggil **`completer.complete(42)`**, yang akan memberikan nilai **42** ke `Future` yang dihasilkan oleh **`completer.future`**.

#### **`completer.complete(42)`**
- Menyelesaikan `Future` dengan nilai **42**.
- Semua fungsi atau operasi yang sedang menunggu (await) pada `Future` ini akan melanjutkan eksekusi dengan hasil bernilai **42**.

### **Cara Kerja Keseluruhan**
1. **`getNumber`** dipanggil:
   - Membuat sebuah **`Completer`** baru.
   - Memulai proses perhitungan asinkron dengan memanggil fungsi **`calculate`**.
   - Mengembalikan `Future` yang saat itu belum selesai (pending).

2. **`calculate`**:
   - Menunggu selama 5 detik menggunakan **`Future.delayed`**.
   - Setelah selesai, memanggil **`completer.complete(42)`**, yang menyelesaikan `Future` dan memberikan nilai **42**.

3. **`Future` dari `getNumber`**:
   - Semua kode yang sedang menunggu `Future` dari **`getNumber`** akan menerima nilai **42** setelah 5 detik.

Hasil Cupture Gif
- D:\Flutter_Praktikum\src week-11\books\image\gif4.gif

Soal 6
B. Jelaskan maksud  kode langkah 2 dengan langkah 5-6 tersebut!
Answer: 
Perbedaan utama antara langkah 2 dan langkah 5-6 terletak pada penanganan hasil dan error:

1. **Langkah 2:**
   - Penanganan hasil dilakukan langsung di dalam `calculate()`, menggunakan `completer.complete(42)`. 
   - Tidak ada mekanisme untuk menangkap error atau kegagalan secara eksplisit.

2. **Langkah 5-6:**
   - `calculate()` diubah sehingga lebih modular atau diganti dengan `calculate2()`, dan pemanggilan dilakukan melalui `getNumber()`.
   - Penanganan hasil menggunakan method `then()` pada `Future`, yang memanggil `setState()` untuk memperbarui UI ketika nilai `Future` berhasil diselesaikan.
   - Penanganan error menggunakan `catchError()`, memberikan kemampuan untuk menangkap dan menangani kegagalan dalam proses asinkron.

**Kesimpulan:**
Pendekatan pada langkah 5-6 lebih fleksibel, karena mendukung penanganan sukses dan error secara terpisah, serta memperbarui UI menggunakan hasil dari `Future`.

Hasil Cupture
- D:\Flutter_Praktikum\src week-11\books\image\gif5.gif

### PRAKTIKUM 4

Soal 7
- D:\Flutter_Praktikum\src week-11\books\image\gif6.gif
- D:\Flutter_Praktikum\src week-11\books\image\gif7.gif

Soal 8
Jelaskan maksud perbedaan kode langkah 1 dan 4!
Answer : 
#### **Langkah 1: Menggunakan `FutureGroup`**
Pada langkah ini, kita menggunakan **`FutureGroup`** dari package `async` untuk menangani beberapa `Future` yang berjalan secara paralel. Berikut adalah prosesnya:
1. **Pendaftaran Future**:
   - Kita menambahkan beberapa `Future` (dalam hal ini `returnOneAsync`, `returnTwoAsync`, dan `returnThreeAsync`) ke dalam sebuah instance `FutureGroup`.
2. **Penyelesaian FutureGroup**:
   - Setelah semua `Future` ditambahkan, kita memanggil `futureGroup.close()` untuk menandakan bahwa tidak ada lagi `Future` yang akan ditambahkan.
3. **Mendapatkan Hasil**:
   - Hasil dari semua `Future` yang sudah selesai dieksekusi akan dikumpulkan dalam sebuah `List`, yang kemudian bisa diproses.

**Keuntungan:**
- `FutureGroup` memberikan kontrol tambahan jika Anda ingin menambah atau mengelola `Future` secara dinamis sebelum memanggil `.close()`.

**Kelemahan:**
- Perlu import package eksternal (`async`).
- Penggunaannya sedikit lebih verbose dibandingkan dengan `Future.wait`.

#### **Langkah 4: Menggunakan `Future.wait`**
Pada langkah ini, kita menggunakan **`Future.wait`** bawaan dari Dart. Berikut adalah prosesnya:
1. **Deklarasi Future**:
   - Kita langsung mendeklarasikan daftar `Future` (dalam hal ini `returnOneAsync`, `returnTwoAsync`, dan `returnThreeAsync`) dalam sebuah list.
2. **Eksekusi Future**:
   - Fungsi `Future.wait` akan menjalankan semua `Future` tersebut secara paralel.
3. **Mendapatkan Hasil**:
   - Hasil dari semua `Future` yang selesai dieksekusi akan dikembalikan dalam sebuah `List`.

**Keuntungan:**
- Sederhana dan lebih mudah diimplementasikan.
- Tidak perlu package tambahan, karena `Future.wait` adalah bagian dari Dart.

**Kelemahan:**
- Tidak memiliki fleksibilitas untuk menambahkan `Future` secara dinamis setelah deklarasi.

### Kesimpulan:
- **`Future.wait`** lebih cocok jika semua `Future` sudah diketahui sejak awal dan tidak memerlukan modifikasi lebih lanjut.
- **`FutureGroup`** berguna jika Anda perlu mengatur atau menambahkan `Future` secara dinamis sebelum menyelesaikannya.

Jika Anda hanya butuh eksekusi paralel sederhana dan cepat, gunakan **`Future.wait`**. Namun, untuk skenario yang lebih kompleks, **`FutureGroup`** mungkin lebih baik.

Soal 9
- D:\Flutter_Praktikum\src week-11\books\image\gif8.gif

Soal 10
- Panggil method handleError() tersebut di ElevatedButton, lalu run. Apa hasilnya? Jelaskan perbedaan kode langkah 1 dan 4!
Answer :
### **Hasil Setelah Dijalankan**
1. Ketika tombol **GO!** ditekan:
   - Fungsi `returnError` akan menunggu selama 2 detik (`Future.delayed`) dan kemudian melemparkan error.
   - Blok `try` dalam `handleReturnError` menangkap error ini.
   - Blok `catch` memanggil `setState` untuk memperbarui UI dengan pesan error (`Something terrible happened`).
   - Blok `finally` mencetak pesan **"Complete"** di console.

2. Tampilan di aplikasi:
   - **Text widget** akan menampilkan **"Something terrible happened"** setelah 2 detik.

3. **Console output**:
   - Akan mencetak **"Complete"** setiap kali fungsi selesai.

### **Perbedaan Langkah 1 dan Langkah 4**

#### **Langkah 1**
Kode menggunakan pendekatan berbasis chaining dengan `then`, `catchError`, dan `whenComplete`. Contohnya:
```dart
returnError()
    .then((value) {
      setState(() {
        result = 'Success';
      });
    })
    .catchError((error) {
      setState(() {
        result = error.toString();
      });
    })
    .whenComplete(() => print('Complete'));
```

**Karakteristik:**
- Memanfaatkan gaya chaining `Future` untuk menangani hasil sukses, error, dan penyelesaian tugas.
- Penanganan error dan logika lainnya disusun secara berurutan dengan metode berbeda (`then`, `catchError`, `whenComplete`).

**Kelebihan:**
- Struktur deklaratif, mudah diikuti untuk tugas-tugas sederhana.
- Ideal untuk skenario di mana tugas-tugas ditangani dalam konteks linier.

#### **Langkah 4**
Kode menggunakan pendekatan `try-catch-finally` dalam fungsi `async`. Contohnya:
```dart
Future handleError() async {
  try {
    await returnError();
  } catch (error) {
    setState(() {
      result = error.toString();
    });
  } finally {
    print('Complete');
  }
}
```

**Karakteristik:**
- Menggunakan blok `try-catch-finally` untuk menangkap error dan menyelesaikan tugas.
- Memberikan kontrol lebih besar atas flow program, terutama jika terdapat logika kompleks sebelum atau sesudah menangani error.

**Kelebihan:**
- Lebih fleksibel untuk mengelola alur logika kompleks.
- Blok `finally` memastikan kode tertentu selalu dijalankan, terlepas dari apakah error terjadi.

### **Kesimpulan**
1. **Langkah 1** lebih cocok untuk kasus sederhana dan langsung karena memanfaatkan API bawaan `Future`.
2. **Langkah 4** lebih baik untuk kasus di mana Anda memerlukan kontrol alur lebih rinci, seperti menggabungkan beberapa logika tambahan dalam `try` atau `finally`. 

Hasil akhirnya sama: error ditangkap dan ditampilkan di UI, tetapi pendekatan `async-await` (Langkah 4) memberikan struktur yang lebih readable untuk tugas yang kompleks.

Soal 11






















## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
