import 'dart:io';

// ===============================
// Class PohonTebang (Encapsulation)
// ===============================
class PohonTebang {
  final int _tinggi;
  PohonTebang(this._tinggi);

  int get tinggi => _tinggi;
}

// ===============================
// Class Hutan (Aggregation)
// ===============================
class Hutan {
  List<PohonTebang> daftarPohon = [];

  void tambahPohon(PohonTebang pohon) {
    daftarPohon.add(pohon);
  }
}

// ===============================
// Class TebangController (Composition + Logic)
// ===============================
class TebangController {
  final Hutan _hutan;
  TebangController(this._hutan);

  // Hitung total kayu yang didapat jika batas tinggi X
  int hitungKayu(int batas) {
    int total = 0;
    for (var pohon in _hutan.daftarPohon) {
      if (pohon.tinggi > batas) {
        total += (pohon.tinggi - batas);
      }
    }
    return total;
  }

  // Cari batas tertinggi dengan binary search
  int cariBatasTertinggi(int kebutuhanKayu) {
    if (_hutan.daftarPohon.isEmpty) return -1;

    int low = 0;
    int high = _hutan.daftarPohon
        .map((p) => p.tinggi)
        .reduce((a, b) => a > b ? a : b);
    int hasil = -1;

    while (low <= high) {
      int mid = (low + high) ~/ 2;
      int totalKayu = hitungKayu(mid);

      if (totalKayu >= kebutuhanKayu) {
        hasil = mid; // simpan batas yang valid
        low = mid + 1; // coba batas lebih tinggi
      } else {
        high = mid - 1; // batas terlalu tinggi, turunkan
      }
    }

    return hasil;
  }
}

// ===============================
// Fungsi main() dengan Input Terminal
// ===============================
void main() {
  // Input N dan M
  print("Masukkan N dan M (pisahkan dengan spasi):");
  var input1 = stdin.readLineSync()!.split(' ');
  int N = int.parse(input1[0]);
  int M = int.parse(input1[1]);

  // Input tinggi pohon
  print("Masukkan tinggi pohon (pisahkan dengan spasi):");
  var input2 = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  // Buat objek Hutan dan isi daftar pohon
  var hutan = Hutan();
  for (var tinggi in input2) {
    hutan.tambahPohon(PohonTebang(tinggi));
  }

  // Buat controller dan cari batas tertinggi
  var controller = TebangController(hutan);
  int batas = controller.cariBatasTertinggi(M);

  // Output hasil
  print("\nBatas tinggi maksimum: $batas");
}
