void main() {
  print("\n******** MENGGUNAKAN MULTIPLE CATCH ********\n");
  try {
    int hasil = 9 ~/ 0;

  } on RangeError catch (e) {
    print(
      "RangeError: Anda mengakses array di luar indeks yang dideklarasikan.",
    );
    print("Detail error: $e");
  } on ArgumentError catch (e) {
    print("ArgumentError: Anda membuat array dengan ukuran yang salah.");
    print("Detail error: $e");
  } catch (e) {
    print("Exception umum: ${e.runtimeType} → $e");
  }
  print("\nPernyataan di luar blok try-catch.");
}





