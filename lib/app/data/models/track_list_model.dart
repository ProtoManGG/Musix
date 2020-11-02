import 'track_model.dart';

class TrackListModel {
  List<TrackList> trackList;

  TrackListModel({this.trackList});

  TrackListModel.fromJson(Map<String, dynamic> json) {
    if (json['track_list'] != null) {
      trackList = <TrackList>[];
      json['track_list'].forEach((v) {
        trackList.add(TrackList.fromJson(v as Map<String, dynamic>));
      });
    }
  }
}

class TrackList {
  Track track;

  TrackList({this.track});

  TrackList.fromJson(Map<String, dynamic> json) {
    track = json['track'] != null
        ? Track.fromJson(json['track'] as Map<String, dynamic>)
        : null;
  }
}
