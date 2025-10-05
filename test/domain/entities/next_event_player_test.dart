import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  final String? photo;
  final String? position;
  final bool isConfirmerd;
  final DateTime? confirmationDate;

  NextEventPlayer({
    required this.id,
    required this.name,
    required this.isConfirmerd,
    this.photo,
    this.position,
    this.confirmationDate,
  });
  String getInitiasl() {
    final names = name.split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last[0];
    return '$firstChar$lastChar';
  }
}

void main() {

  NextEventPlayer makeSut (String name) => NextEventPlayer( id: '',name: name,isConfirmerd: true,);
  test('should return the first letter of the first and last names', () {
    expect(makeSut('Geizielder Cordeiro').getInitiasl(), 'GC');
    expect(makeSut('Rhuan Cordeiro').getInitiasl(), 'RC');
    expect(makeSut('Giselle Cordeiro Gervazio').getInitiasl(), 'GG');
  });
}