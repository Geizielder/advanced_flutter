import 'package:flutter_test/flutter_test.dart';

class NextEventPlayer {
  final String id;
  final String name;
  late final String initials;
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
  }) {
    initials = _getInitiasl();
  }
  String _getInitiasl() {
    final names = name.toUpperCase().split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last.split('').elementAtOrNull(names.length == 1 ? 1 : 0) ?? '';
    return '$firstChar$lastChar';
  }
}

void main() {

  String initialsOf(String name) => NextEventPlayer( id: '',name: name,isConfirmerd: true,).initials;
  test('should return the first letter of the first and last names', () {
    expect(initialsOf('Geizielder Cordeiro'), 'GC');
    expect(initialsOf('Rhuan Cordeiro'), 'RC');
    expect(initialsOf('Giselle Cordeiro Gervazio'), 'GG');
  });
  test('should return the first and second letter of the first names', () {
    expect(initialsOf('Rhuan'), 'RH');
    expect(initialsOf('R'), 'R');
  });
    test('should convart to uppercase', () {
    expect(initialsOf('rhuan cordeiro'), 'RC');
    expect(initialsOf('rhuan'), 'RH');
    expect(initialsOf('r'), 'R');

  });
}