import 'package:air4dart/air4dart.dart';
import 'package:test/test.dart';

import 'models/mock_client.dart';

void main() {
  group("REST Tests", () {
    AirSonicClient airSonic;

    setUpAll(() {
      airSonic = new MockClient("http://192.168.50.141:4040", "admin", "admin",
          timeout: 1);
    });

    test("Get Ping", () async {
      var data = await airSonic.getPing();
      expect(data.isOkay, isTrue);
    });

    test("Get License", () async {
      var data = await airSonic.getLicense();
      expect(data.isOkay, isTrue);
    });

    test("Get Music Folders", () async {
      var data = await airSonic.getMusicFolders();
      expect(data.isOkay, isTrue);
    });

    test("Get Indexes", () async {
      var data = await airSonic.getIndexes();
      expect(data.isOkay, isTrue);
    });

    test("Get Music Directory", () async {
      try {
        var data = await airSonic.getMusicDirectory("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Genres", () async {
      var data = await airSonic.getGenres();
      expect(data.isOkay, isTrue);
    });

    test("Get Artists", () async {
      var data = await airSonic.getArtists();
      expect(data.isOkay, isTrue);
    });

    test("Get Artist", () async {
      try {
        var data = await airSonic.getArtist("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Album", () async {
      try {
        var data = await airSonic.getAlbum("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Song", () async {
      try {
        var data = await airSonic.getSong("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Videos", () async {
      var data = await airSonic.getVideos();
      expect(data.isOkay, isTrue);
    });

    test("Get Video Info", () async {
      try {
        var data = await airSonic.getVideoInfo("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Artist Info", () async {
      try {
        var data = await airSonic.getArtistInfo("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }

      try {
        var data2 = await airSonic.getArtistInfo("1", useId3: true);
        expect(data2.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Album Info", () async {
      try {
        var data = await airSonic.getAlbumInfo("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Similar Songs", () async {
      try {
        var data = await airSonic.getSimilarSongs("1");
        expect(data.isOkay, isTrue);
      } on DataNotFoundException catch (e) {
        expect(e.code, equals(70));
      }
    });

    test("Get Top Songs", () async {
      var data = await airSonic.getTopSongs("Linkin Park");
      expect(data.isOkay, isTrue);
    });

    test("Get Album List", () async {
      var data = await airSonic.getAlbumList(SearchType.random);
      expect(data.isOkay, isTrue);
    });

    test("Get Random Songs", () async {
      var data = await airSonic.getRandomSongs();
      expect(data.isOkay, isTrue);
    });

    test("Get Songs By Genre", () async {
      var data = await airSonic.getSongsByGenre("rock");
      expect(data.isOkay, isTrue);
    });

    test("Get Now Playing", () async {
      var data = await airSonic.getNowPlaying();
      expect(data.isOkay, isTrue);
    });

    test("Get Starred", () async {
      var data = await airSonic.getStarred();
      expect(data.isOkay, isTrue);
    });

    test("Search", () async {
      var data = await airSonic.search("Linkin Park");
      expect(data.isOkay, isTrue);
    });

    test("Get Playlists", () async {
      var data = await airSonic.getPlaylists();
      expect(data.isOkay, isTrue);
      expect(data.data, isNotEmpty);
    });

    test("Change Credentials ", () async {
      final client =
          AirSonicClient("http://192.168.50.142:4040", "lucas", "password");
      client.changeSettings(
          username: "lucas", host: "http://192.168.50.142:4040");
      try {
        var response = await client.getPing();
        expect(response.isOkay, isFalse);
      } catch (e) {
        expect(e, isException);
      }
    });
  });
}
