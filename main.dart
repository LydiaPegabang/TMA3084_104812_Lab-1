import 'dart:io';

void main() {
  bool isOrdering = true;

  // Gelung while untuk pesanan berulang / berturut-turut
  while (isOrdering) {
    print('-----------------------------------');
    print('--- MENU PIZZA ---');
    print('Small  : \$5');
    print('Medium : \$7');
    print('Large  : \$10');
    print('-----------------------------------');

    // Meminta input saiz piza daripada pengguna
    stdout.write('Masukkan saiz piza (Small / Medium / Large): ');
    String? sizeInput = stdin.readLineSync();

    // Meminta input kuantiti daripada pengguna
    stdout.write('Masukkan kuantiti: ');
    String? quantityInput = stdin.readLineSync();
    int quantity = int.tryParse(quantityInput ?? '') ?? 0;

    int pricePerPizza = 0;
    bool validSize = true;

    // Pernyataan switch untuk menentukan harga mengikut saiz
    switch (sizeInput?.trim().toLowerCase()) {
      case 'small':
        pricePerPizza = 5;
        break;
      case 'medium':
        pricePerPizza = 7;
        break;
      case 'large':
        pricePerPizza = 10;
        break;
      default:
        validSize = false;
        print('Saiz piza tidak sah! Sila cuba lagi.');
    }

    if (validSize && quantity > 0) {
      int totalPayment = pricePerPizza * quantity;
      print('\n--- RESIT PESANAN ---');
      print('Saiz Pizza : ${sizeInput?.trim()}');
      print('Kuantiti   : $quantity');
      print('Jumlah Bayaran : \$$totalPayment');
      print('---------------------\n');
    } else if (quantity <= 0) {
      print('Kuantiti mestilah sekurang-kurangnya 1.');
    }

    // Bertanya sama ada pengguna mahu meneruskan pesanan
    stdout.write('Adakah anda mahu membuat pesanan lain? (y/n): ');
    String? continueInput = stdin.readLineSync();
    if (continueInput?.trim().toLowerCase() != 'y') {
      isOrdering = false;
      print('Terima kasih kerana memesan!');
    }
  }
}