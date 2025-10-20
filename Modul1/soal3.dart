int panas(int x) {
if (x == 0) return 0;
return (x % 10) + panas(x ~/ 10);
}
int dingin(int x, int y) {
int air = 0;
while (panas(air) != x) {
air += y;
}
return air;
}

void main() {
  int hasil1= dingin(10, 7);
  int hasil2= dingin(2, 35);
  print('hasil 1 = $hasil1');
  print('hasil 2 = $hasil2');
}
//a. hasil dari dingin (10,7) adalah 28
//b. hasil dari dingin (2,35) adalah 10010