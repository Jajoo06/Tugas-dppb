import 'dart:io';

// Custom Exception
class LoginException implements Exception {
  final String message;
  LoginException(this.message);
  @override
  String toString() => "LoginException: $message";
}

void main() {
  print("=== PROGRAM LOGIN SYSTEM (EXCEPTION HANDLING) ===\n");

  // Data login yang benar
  const String usernameBenar = "admin";
  const String passwordBenar = "12345";

  try {
    stdout.write("Masukkan username: ");
    String? username = stdin.readLineSync();
    stdout.write("Masukkan password: ");
    String? password = stdin.readLineSync();

    if (username == null ||
        username.isEmpty ||
        password == null ||
        password.isEmpty) {
      throw LoginException("Username dan Password tidak boleh kosong!");
    }

    // Validasi karakter hanya huruf dan angka
    final validPattern = RegExp(r'^[a-zA-Z0-9]+$');
    if (!validPattern.hasMatch(username) || !validPattern.hasMatch(password)) {
      throw LoginException(
        "Login Failed, Username/Password Salah (mengandung karakter tidak valid)",
      );
    }

    // Cek kecocokan data login
    if (username != usernameBenar || password != passwordBenar) {
      throw LoginException("Login Failed, Username/Password Salah");
    }

    print("\nLogin Berhasil! Selamat datang, $username.");
  } on LoginException catch (e) {
    print("Terjadi kesalahan login: $e");
  } catch (e) {
    print("Error umum: $e");
  } finally {
    print("\nProgram selesai dijalankan.");
  }
}
