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
  test('should return the first letter of the first and last names', () {
    final player = NextEventPlayer(
      id: '',
      name: 'Geizielder Cordeiro',
      isConfirmerd: true,
    );
    expect(player.getInitiasl(), 'GC');
    final player2 = NextEventPlayer(
      id: '',
      name: 'Rhuan Cordeiro',
      isConfirmerd: true,
    );
    expect(player2.getInitiasl(), 'RC');
        final player3 = NextEventPlayer(
      id: '',
      name: 'Giselle Cordeiro Gervazio',
      isConfirmerd: true,
    );
    expect(player3.getInitiasl(), 'GG');

  });
}