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

    late String groupId;
    late LoadNextEvenMocktRepository repo;
    late NextEventLoader sut;

  setUp(() {
    groupId = Random().nextInt(50000).toString();
    repo = LoadNextEvenMocktRepository();
    sut = NextEventLoader(repo: repo);
  });
  test('should load event data from a repositoty', () async {

    await sut(groupId: groupId);
    expect(repo.groupId, groupId);
    expect(repo.callsCaount, 1);
  });
}