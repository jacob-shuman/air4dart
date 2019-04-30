import 'dart:async';
import 'dart:io';

import 'package:air4dart/src/enums.dart';
import 'package:air4dart/src/models/airsonic_response.dart';

abstract class AirSonicAPI {
  Future<AirSonicResponse> getPing();

  Future<AirSonicResponse> getLicense();

  Future<AirSonicResponse> getMusicFolders();

  Future<AirSonicResponse> getIndexes(
      [String musicFolderId, String ifModifiedSince]);

  Future<AirSonicResponse> getMusicDirectory(String id);

  Future<AirSonicResponse> getGenres();

  Future<AirSonicResponse> getArtists([String musicFolderId]);

  Future<AirSonicResponse> getArtist(String id);

  Future<AirSonicResponse> getAlbum(String id);

  Future<AirSonicResponse> getSong(String id);

  Future<AirSonicResponse> getVideos();

  Future<AirSonicResponse> getVideoInfo(String id);

  Future<AirSonicResponse> getArtistInfo(String id,
      {String count, bool includeNotPresent, bool useId3 = false});

  Future<AirSonicResponse> getAlbumInfo(String id, {bool useId3 = false});

  Future<AirSonicResponse> getSimilarSongs(String id,
      {int count = 50, bool useId3 = false});

  Future<AirSonicResponse> getTopSongs(String artist, {int count = 50});

  Future<AirSonicResponse> getAlbumList(SearchType type,
      {int size,
      int offset,
      DateTime fromYear,
      DateTime toYear,
      String genre,
      String musicFolderId,
      bool useId3 = false});

  Future<AirSonicResponse> getRandomSongs(
      {int size,
      String genre,
      DateTime fromYear,
      DateTime toYear,
      String musicFolderId});

  Future<AirSonicResponse> getSongsByGenre(String genre,
      {int count = 10, int offset = 0, String musicFolderId});

  Future<AirSonicResponse> getNowPlaying();

  Future<AirSonicResponse> getStarred(
      {String musicFolderId, bool useId3 = false});

  Future<AirSonicResponse> search(String query,
      {int artistCount,
      int artistOffset,
      int albumCount,
      int albumOffset,
      int songCount,
      int songOffset,
      String musicFolderId,
      bool useId3 = false});

  Future<AirSonicResponse> getPlaylists({String username});

  Future<AirSonicResponse> getPlayList(String id);

  Future<AirSonicResponse> createPlaylist(String name, List<String> songs);

  Future<AirSonicResponse> updatePlaylist(String id,
      {String name,
      String comment,
      bool public,
      List<String> songstoAdd,
      List<int> songIndexesToRemove});

  Future<AirSonicResponse> deletePlaylist(String playlistId);

  Future<HttpClientResponse> stream(String id,
      {String maxBitRate,
      String format,
      int timeOffset,
      String resolution,
      bool estimateContentLength = false,
      bool converted = false});

  Future<HttpClientResponse> download(String id);

  Future<AirSonicResponse> hls();

  Future<AirSonicResponse> getCaptions(String id, {String format});

  Future<HttpClientResponse> getCoverArt(String id, {String size});

  Future<AirSonicResponse> getLyrics({String artist, String title});

  Future<HttpClientResponse> getAvatar(String username);

  Future<AirSonicResponse> star({String id, String albumId, String artistId});

  Future<AirSonicResponse> unstar({String id, String albumId, String artistId});

  Future<AirSonicResponse> setRating(String id, int rating);

  Future<AirSonicResponse> scrobble(String id,
      {DateTime time, bool submission});

  Future<AirSonicResponse> getShares();

  Future<AirSonicResponse> createShare(String id,
      {String description, DateTime expires});

  Future<AirSonicResponse> updateShare(String id,
      {String description, DateTime expires});

  Future<AirSonicResponse> deleteShare(String id);

  Future<AirSonicResponse> getPodcasts({bool includeEpisodes, String id});

  Future<AirSonicResponse> getNewestPodcasts({int count});

  Future<AirSonicResponse> refreshPodcasts();

  Future<AirSonicResponse> createPodcastChannel(String url);

  Future<AirSonicResponse> deletePodcastChannel(String id);

  Future<AirSonicResponse> deletePodcastEpisode(String id);

  Future<AirSonicResponse> downloadPodcastEpisode(String id);

  Future<AirSonicResponse> jukeboxControl(JukeBoxAction action,
      {int index, int offset, String id, int gain});

  Future<AirSonicResponse> getInternetRadioStations();

  Future<AirSonicResponse> createInternetRadioStation(
      String streamUrl, String name,
      {String homepageUrl});

  Future<AirSonicResponse> updateInternetRadioStation(
      String id, String streamUrl, String name,
      {String homepageUrl});

  Future<AirSonicResponse> deleteInternetRadioStation(String id);

  Future<AirSonicResponse> getChatMessages({DateTime since});

  Future<AirSonicResponse> addChatMessage(String message);

  Future<AirSonicResponse> getUser(String username);

  Future<AirSonicResponse> getUsers();

  Future<AirSonicResponse> createUser(
      String username, String password, String email,
      {bool ldapAuthenticated = false,
      bool adminRole = false,
      bool settingsRole = true,
      bool streamRole = true,
      bool jukeboxRole = false,
      bool downloadRole = false,
      bool uploadRole = false,
      bool playlistRole = false,
      bool coverArtRole = false,
      bool commentRole = false,
      bool podcastRole = false,
      bool shareRole = false,
      bool videoConversionRole = false,
      List<String> musicFolders});

  Future<AirSonicResponse> updateUser(
      String username, String password, String email,
      {bool ldapAuthenticated = false,
      bool adminRole = false,
      bool settingsRole = true,
      bool streamRole = true,
      bool jukeboxRole = false,
      bool downloadRole = false,
      bool uploadRole = false,
      bool playlistRole = false,
      bool coverArtRole = false,
      bool commentRole = false,
      bool podcastRole = false,
      bool shareRole = false,
      bool videoConversionRole = false,
      List<String> musicFolders,
      int maxBitRate});

  Future<AirSonicResponse> deleteUser(String username);

  Future<AirSonicResponse> changePassword(String password, {String username});

  Future<AirSonicResponse> getBookmarks();

  Future<AirSonicResponse> createBookmark(String id, int position,
      {String comment});

  Future<AirSonicResponse> deleteBookmark(String id);

  Future<AirSonicResponse> getPlayQueue();

  Future<AirSonicResponse> savePlayQueue(String id,
      {String currentlyPlayingId, int position});

  Future<AirSonicResponse> getScanStatus();

  Future<AirSonicResponse> startScan();
}
