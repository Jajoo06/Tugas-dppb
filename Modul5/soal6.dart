import 'dart:io';

// Exception custom
class EmptyInputException implements Exception {
  final String message;
  EmptyInputException(this.message);
  @override
  String toString() => "EmptyInputException: $message";
}

class InvalidFormatException implements Exception {
  final String message;
  InvalidFormatException(this.message);
  @override
  String toString() => "InvalidFormatException: $message";
}

class InvalidValueException implements Exception {
  final String message;
  InvalidValueException(this.message);
  @override
  String toString() => "InvalidValueException: $message";
}

void main() {
  print("=== PROGRAM DATA FILM (EXCEPTION HANDLING) ===\n");

  try {
    stdout.write("Masukkan judul film: ");
    String? judul = stdin.readLineSync();
    if (judul == null || judul.isEmpty)
      throw EmptyInputException("Judul film tidak boleh kosong.");

    stdout.write("Masukkan tahun rilis: ");
    String? tahunInput = stdin.readLineSync();
    if (tahunInput == null || tahunInput.isEmpty)
      throw EmptyInputException("Tahun rilis tidak boleh kosong.");

    int tahun;
    try {
      tahun = int.parse(tahunInput);
    } catch (e) {
      throw InvalidFormatException(
        "Format tahun tidak valid, harus berupa angka.",
      );
    }

    stdout.write("Masukkan durasi film (menit): ");
    String? durasiInput = stdin.readLineSync();
    if (durasiInput == null || durasiInput.isEmpty)
      throw EmptyInputException("Durasi tidak boleh kosong.");

    int durasi;
    try {
      durasi = int.parse(durasiInput);
    } catch (e) {
      throw InvalidFormatException(
        "Format durasi tidak valid, harus berupa angka.",
      );
    }

    if (durasi <= 0)
      throw InvalidValueException("Durasi film tidak boleh negatif atau nol.");

    print("\n=== DATA FILM ===");
    print("Judul  : $judul");
    print("Tahun  : $tahun");
    print("Durasi : $durasi menit");
  } on EmptyInputException catch (e) {
    print("Terjadi kesalahan input: $e");
  } on InvalidFormatException catch (e) {
    print("Terjadi kesalahan format: $e");
  } on InvalidValueException catch (e) {
    print("Terjadi kesalahan nilai: $e");
  } catch (e) {
    print("Error umum: $e");
  } finally {
    print("\nProgram telah selesai dijalankan.");
  }
}
