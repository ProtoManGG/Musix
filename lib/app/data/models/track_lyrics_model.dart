class TrackLyricsModel {
  int lyricsId;
  int explicit;
  String lyricsBody;
  String scriptTrackingUrl;
  String pixelTrackingUrl;
  String lyricsCopyright;
  String updatedTime;

  TrackLyricsModel({
    this.lyricsId,
    this.explicit,
    this.lyricsBody,
    this.scriptTrackingUrl,
    this.pixelTrackingUrl,
    this.lyricsCopyright,
    this.updatedTime,
  });

  TrackLyricsModel.fromJson(Map<String, dynamic> json) {
    lyricsId = json['lyrics_id'] as int;
    explicit = json['explicit'] as int;
    lyricsBody = json['lyrics_body'] as String;
    scriptTrackingUrl = json['script_tracking_url'] as String;
    pixelTrackingUrl = json['pixel_tracking_url'] as String;
    lyricsCopyright = json['lyrics_copyright'] as String;
    updatedTime = json['updated_time'] as String;
  }
}
