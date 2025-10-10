import 'package:advanced_flutter/domanin/entities/next_event_player.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  String initialsOf(String name) =>
      NextEventPlayer(id: '', name: name, isConfirmed: true).initials;

  test('should return the first letter of the first and last names', () {
    expect(initialsOf('Geizielder Cordeiro'), 'GC');
    expect(initialsOf('Rhuan Cordeiro'), 'RC');
    expect(initialsOf('Giselle Cordeiro Gervazio'), 'GG');
  });

  test('should return the first and second letter of the first names', () {
    expect(initialsOf('Rhuan'), 'RH');
    expect(initialsOf('R'), 'R');
  });

  test('should return "-" when name is empty', () {
    expect(initialsOf(''), '-');
  });

  test('should convart to uppercase', () {
    expect(initialsOf('rhuan cordeiro'), 'RC');
    expect(initialsOf('rhuan'), 'RH');
    expect(initialsOf('r'), 'R');
  });
  test('should ignore extra whitespaces', () {
    expect(initialsOf('Rhuan Cordeiro '), 'RC');
    expect(initialsOf(' Rhuan Cordeiro'), 'RC');
    expect(initialsOf(' Rhuan Cordeiro '), 'RC');
    expect(initialsOf(' Rhuan  Cordeiro '), 'RC');
    expect(initialsOf(' R huan  Cordeiro '), 'RC');
    expect(initialsOf(' Rhuan C Araujo'), 'RA');
  });
}
