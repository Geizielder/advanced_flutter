import 'package:advanced_flutter/domanin/entities/next_event.dart';

abstract class LoadNextEventRepository {
    Future<NextEvent> loadNextEvent({ required String groupId});
}