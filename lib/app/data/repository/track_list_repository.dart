import 'package:flutter/foundation.dart';

import '../providers/track_list_provider.dart';

class TrackListRepository {
  final TrackListApiClient trackListApiClient;
  TrackListRepository({@required this.trackListApiClient})
      : assert(trackListApiClient != null);

  Future getTrackList() async => trackListApiClient.getTrackList();

  Future getTrack({@required int trackId}) async =>
      trackListApiClient.getTrack(trackId: trackId);

  Future getTrackLyrics({@required int trackId}) =>
      trackListApiClient.getTrackLyrics(trackId: trackId);
}
