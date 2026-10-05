import 'dart:io';

void main() {
  int pinBenar = 1234;
  int saldo = 2000000;
  bool loginBerhasil = false;

  // 1. Verifikasi PIN
  while (!loginBerhasil) {
    print('==================================================');
    print('  BANK SERBA Zakharia');
    print('==================================================');
    stdout.write('Masukan Pin Anda : ');
    String? inputPinText = stdin.readLineSync();
    int? inputPin = int.tryParse(inputPinText ?? '');

    if (inputPin == pinBenar) {
      loginBerhasil = true;
    } else {
      print('\nPIN Salah! Silakan coba lagi.\n');
    }
  }

  // 2. Menu Utama
  bool lanjut = true;
  while (lanjut) {
    print('\n==================================================');
    print('  BANK SERBA zakharia');
    print('==================================================');
    print('1. Cek Saldo');
    print('2. Setor Tunai');
    print('3. Tarik Tunai');
    print('==================================================');
    stdout.write('Pilih Menu (1/2/3) : ');
    
    String? pilihanMenu = stdin.readLineSync();

    switch (pilihanMenu) {
      case '1':
        print('\nSALDO SAAT INI :');
        print('==================================================');
        print(saldo);
        print('==================================================');
        break;

      case '2':
        stdout.write('Jumlah yang disetor : ');
        String? inputSetor = stdin.readLineSync();
        int jumlahSetor = int.tryParse(inputSetor ?? '') ?? 0;

        if (jumlahSetor > 0) {
          saldo += jumlahSetor;
          print('Setor tunai berhasil!');
        } else {
          print('Jumlah setor tidak valid.');
        }
        break;

      case '3':
        print('==================================================');
        print('Pilih pecahan :');
        print('1. pecahan 50.000');
        print('2. pecahan 100.000');
        print('==================================================');
        stdout.write('Pilih pecahan (1/2) : ');
        
        String? pilihanPecahan = stdin.readLineSync();

        if (pilihanPecahan == '1' || pilihanPecahan == '2') {
          int nominalPecahan = (pilihanPecahan == '1') ? 50000 : 100000;

          stdout.write('Masukkan jumlah uang yang ditarik: ');
          String? inputTarik = stdin.readLineSync();
          int jumlahTarik = int.tryParse(inputTarik ?? '') ?? 0;

          if (jumlahTarik <= 0) {
            print('Nominal penarikan tidak valid.');
          } else if (jumlahTarik % nominalPecahan != 0) {
            print('Jumlah penarikan harus kelipatan Rp. $nominalPecahan');
          } else if (jumlahTarik > saldo) {
            print('Saldo Anda tidak mencukupi.');
          } else {
            saldo -= jumlahTarik;
            int lembar = jumlahTarik ~/ nominalPecahan;

            print('==================================================');
            print('Rp. $nominalPecahan x $lembar Lembar');
            print('==================================================');
          }
        } else {
          print('Pilihan pecahan tidak valid.');
        }
        break;

      default:
        print('Pilihan menu tidak valid.');
        break;
    }

    stdout.write('\nApakah ingin melakukan transaksi lain? (y/n): ');
    String? ulang = stdin.readLineSync();
    if (ulang?.toLowerCase() != 'y') {
      lanjut = false;
      print('\nTerima kasih telah menggunakan BANK SERBA ADA.');
    }
  }
}