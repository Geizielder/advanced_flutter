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
    initials = getInitiasl();
  }
  String getInitiasl() {
    final names = name.split(' ');
    final firstChar = names.first[0];
    final lastChar = names.last[0];
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
}