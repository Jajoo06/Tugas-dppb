int go(int n) {
 int s = 0;
 int f = 1;
 
  for (int i = 2; i <= n; i++) {
 if (n % i == 0) {
 if (i - f > s) {
 s = i - f;
 }
 f = i;
 }
 }
 return s;
}

void main() {
  int hasil = go(2);
  print('Hasil go(2) = $hasil');
}

// A. hasil dari go(30) adalah 15
// B. BENAR karena kembalian dari pemanggilan go(N) adalah setengah dari N