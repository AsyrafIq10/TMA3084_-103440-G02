import 'dart:io';

void main() {
  bool keepOrdering = true;

  print('=================================');
  print('     WELCOME TO THE PIZZA SHOP   ');
  print('=================================');

  // Outer loop: allows continuous ordering
  while (keepOrdering) {
    // Display prices
    print('\n----------- MENU -----------');
    print('S - Small  : \$5.00');
    print('M - Medium : \$7.00');
    print('L - Large  : \$10.00');
    print('----------------------------');

    // Ask for pizza size (repeat until valid)
    String sizeName = '';
    int price = 0;
    bool validSize = false;

    while (!validSize) {
      stdout.write('Enter pizza size (S/M/L): ');
      String input = (stdin.readLineSync() ?? '').trim().toUpperCase();

      // Switch statement to set the price based on size
      switch (input) {
        case 'S':
          sizeName = 'Small';
          price = 5;
          validSize = true;
          break;
        case 'M':
          sizeName = 'Medium';
          price = 7;
          validSize = true;
          break;
        case 'L':
          sizeName = 'Large';
          price = 10;
          validSize = true;
          break;
        default:
          print('Invalid size. Please enter S, M or L.');
      }
    }

    // Ask for quantity (repeat until a positive whole number is entered)
    int quantity = 0;
    while (quantity <= 0) {
      stdout.write('Enter quantity: ');
      int? input = int.tryParse((stdin.readLineSync() ?? '').trim());

      if (input == null || input <= 0) {
        print('Invalid quantity. Please enter a whole number greater than 0.');
      } else {
        quantity = input;
      }
    }

    // Calculate and print the total payment
    int total = price * quantity;
    print('\n---------- RECEIPT ----------');
    print('Size     : $sizeName');
    print('Price    : \$${price.toStringAsFixed(2)}');
    print('Quantity : $quantity');
    print('Total    : \$${total.toStringAsFixed(2)}');
    print('-----------------------------');

    // Ask whether to order again (repeat until y or n)
    bool validAnswer = false;
    while (!validAnswer) {
      stdout.write('\nWould you like to order again? (Y/N): ');
      String answer = (stdin.readLineSync() ?? '').trim().toUpperCase();

      switch (answer) {
        case 'Y':
          validAnswer = true;
          break;
        case 'N':
          validAnswer = true;
          keepOrdering = false;
          break;
        default:
          print('Please enter Y or N.');
      }
    }
  }

  print('\nThank you for your order! Enjoy your pizza.');
}