import 'dart:io';

const int MOD = 1000000007;

void main() {
 
  var input = stdin.readLineSync()!;
  while (input.trim().isEmpty) {
    input = stdin.readLineSync()!;
  }
  final B = int.parse(input.trim());
  final Y = stdin.readLineSync()!.trim();
  final n = Y.length;

  final maxLen = (B - 1).toString().length;

  // dp[i] = banyak cara mem-parse suffix Y[i..n-1]
  final dp = List<int>.filled(n + 1, 0);
  dp[n] = 1;

  for (int i = n - 1; i >= 0; i--) {
    int val = 0;
    for (int j = i; j < n && j - i + 1 <= maxLen; j++) {
      int digit = Y.codeUnitAt(j) - 48; // '0' ascii = 48
      if (Y.codeUnitAt(i) == 48 && j > i) {
        // leading zero di dalam blok multi-digit → break
        break;
      }
      val = val * 10 + digit;
      if (val >= B) break;

      int len = j - i + 1;
      if (val <= 9 && len != 1) {
        // 0..9 hanya boleh ditulis satu digit
        continue;
      }
      if (i == 0 && val == 0 && n != 1) {
        // angka utama tidak boleh leading 0 kecuali Y == "0"
        continue;
      }

      dp[i] += dp[j + 1];
      if (dp[i] >= MOD) dp[i] -= MOD;
    }
  }

  print(dp[0] % MOD);
}
