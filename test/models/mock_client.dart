import 'dart:async';
import 'dart:io';

import 'package:air4dart/src/models/route.dart';
import 'package:air4dart/src/models/airsonic_response.dart';
import 'package:air4dart/air4dart.dart';

class MockClient extends AirSonicClient {
  MockClient(String path, String username, String password, {int timeout})
      : super(path, username, password, timeout: timeout);

  @override
  Future<AirSonicResponse> request(Route route) async {
    return AirSonicResponse({"status": "ok"}, null);
  }

  @override
  Future<HttpClientResponse> requestData(Route route) {
    // TODO: implement requestData
    return null;
  }
}
