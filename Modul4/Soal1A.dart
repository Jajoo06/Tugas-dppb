class Kendaraan {
 void jalan() {
   print("Kendaraan sedang berjalan");
 }
}

class Mobil extends Kendaraan {
 void klakson() {
   print("Mobil membunyikan klakson: Tin tin!");
 }
}

class Pesawat extends Kendaraan {
 void terbang() {
   print("Pesawat terbang di udara!");
 }
}

void main() {
 var k = Kendaraan();
 k.jalan();

 var m = Mobil();
 m.jalan();
 m.klakson();

 var pesawat = Pesawat();
 pesawat.jalan();
 pesawat.terbang();
}
