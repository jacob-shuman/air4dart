import 'package:air4dart/src/models/airsonic_response.dart';
import 'package:air4dart/air4dart.dart';

main() async {
  var airsonic = new AirSonicClient("https://music.example.com", "John", "Doe");
  AirSonicResponse response = await airsonic.getPing();
  print(response.isOkay);
}
