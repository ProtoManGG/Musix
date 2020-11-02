class Track {
  int trackId;
  String trackName;
  int trackRating;
  int commontrackId;
  int instrumental;
  int explicit;
  int hasLyrics;
  int hasSubtitles;
  int hasRichsync;
  int numFavourite;
  int albumId;
  String albumName;
  int artistId;
  String artistName;
  String trackShareUrl;
  String trackEditUrl;
  int restricted;
  String updatedTime;

  Track({
    this.trackId,
    this.trackName,
    this.trackRating,
    this.commontrackId,
    this.instrumental,
    this.explicit,
    this.hasLyrics,
    this.hasSubtitles,
    this.hasRichsync,
    this.numFavourite,
    this.albumId,
    this.albumName,
    this.artistId,
    this.artistName,
    this.trackShareUrl,
    this.trackEditUrl,
    this.restricted,
    this.updatedTime,
  });

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'] as int;
    trackName = json['track_name'] as String;
    trackRating = json['track_rating'] as int;
    commontrackId = json['commontrack_id'] as int;
    instrumental = json['instrumental'] as int;
    explicit = json['explicit'] as int;
    hasLyrics = json['has_lyrics'] as int;
    hasSubtitles = json['has_subtitles'] as int;
    hasRichsync = json['has_richsync'] as int;
    numFavourite = json['num_favourite'] as int;
    albumId = json['album_id'] as int;
    albumName = json['album_name'] as String;
    artistId = json['artist_id'] as int;
    artistName = json['artist_name'] as String;
    trackShareUrl = json['track_share_url'] as String;
    trackEditUrl = json['track_edit_url'] as String;
    restricted = json['restricted'] as int;
    updatedTime = json['updated_time'] as String;
  }
}
