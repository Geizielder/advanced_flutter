import 'dart:math';

import 'package:flutter_test/flutter_test.dart';

class NextEventLoader {
  final LoadNextEventRepository repo;

  NextEventLoader({
    required this.repo
  });

  Future<void> call({ required String groupId}) async {
    await repo.loadNextEvent(groupId: groupId);
  }

}

abstract class LoadNextEventRepository {
  Future<void> loadNextEvent({ required String groupId}) async {
  }
}

class LoadNextEvenMocktRepository implements LoadNextEventRepository{
  String? groupId;
  var callsCaount = 0;

  @override
  Future<void> loadNextEvent({ required String groupId}) async {
    this.groupId = groupId;
    callsCaount++;
  }
}

void main() {
  test('should load event data from a repositoty', () async {
    final groupId = Random().nextInt(50000).toString();
    final repo = LoadNextEvenMocktRepository();
    final sut = NextEventLoader(repo: repo);
    await sut(groupId: groupId);
    expect(repo.groupId, groupId);
    expect(repo.callsCaount, 1);
  });
}