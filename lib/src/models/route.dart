import 'package:air4dart/src/models/endpoint.dart';

class Route implements EndPoint {
  var endpoint;
  var params;
  var dataKey;

  Route(String endpoint,
      {String dataKey, Map<String, dynamic> payload = const {}}) {
    this.endpoint = endpoint;
    this.params = payload;
    this.dataKey = dataKey;
  }
}
