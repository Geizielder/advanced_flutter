import 'dart:convert';

import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';

import '../../helpers/fake.dart';

class LoadNextEventHttpRepository {
  final Client httpClient;

  LoadNextEventHttpRepository({required this.httpClient});

  Future<void> loadNextEvent({required String groupId}) async {
    await httpClient.get(
      Uri(
        scheme: "https",
        host: 'lochalhost',
        path: '/api/groups/:groupId/next_event',
      ),
    );
  }
}

class HttpClientSpy implements Client {
  String? method;
  int callCount = 0;

  @override
  void close() {}

  @override
  Future<Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response> get(Uri url, {Map<String, String>? headers}) async {
    method = 'get';
    callCount++;
    return Response('', 200);
  }

  @override
  Future<Response> head(Uri url, {Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Response> put(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> read(Uri url, {Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<Uint8List> readBytes(Uri url, {Map<String, String>? headers}) {
    throw UnimplementedError();
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) {
    throw UnimplementedError();
  }
}

void main() {
  test('should request with corrct methor', () async {
    final groupId = anyString();
    final httpClient = HttpClientSpy();
    final sut = LoadNextEventHttpRepository(httpClient: httpClient);
    await sut.loadNextEvent(groupId: groupId);
    expect(httpClient.method, 'get');
    expect(httpClient.callCount, 1);
  });
}
