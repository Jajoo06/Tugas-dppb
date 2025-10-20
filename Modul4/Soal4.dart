class Mahasiswa {
 String nama;
 Mahasiswa(this.nama);
}

class Universitas {
 List<Mahasiswa> daftarMhs = [];
}

class Mesin {
 void nyala() {
 print("Mesin menyala...");
 }
}

class Mobil {
 final Mesin mesin = Mesin(); // Komposisi
 void nyalakanMobil() {
 mesin.nyala();
 print("Mobil siap jalan!");
 }
}

void main() {
print("=== AGREGASI ===");
Universitas? u = Universitas();
var m1 = Mahasiswa("Budi");
var m2 = Mahasiswa("Ani");
u!.daftarMhs.addAll([m1, m2]);
print("Mahasiswa: ${u!.daftarMhs.map((m) => m.nama).toList()}");

u = null;
print("Setelah Universitas dihapus, Mahasiswa tetap ada:");
print("Nama Mahasiswa: ${m1.nama}, ${m2.nama}");

print("\n=== KOMPOSISI ===");
Mobil? m = Mobil();
var mobil = Mobil();
mobil.nyalakanMobil();
m = null;
print("Jika Mobil dihapus, Mesin di dalamnya juga ikut dianggap tidak berguna.");

}
