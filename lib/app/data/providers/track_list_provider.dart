import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:musix_final/app/constants/api_constants.dart';
import 'package:musix_final/app/data/models/failure_model.dart';

class TrackListApiClient {
  final Dio dioClient;
  TrackListApiClient({@required this.dioClient});

  Future getTrackList() async => genericGetRequestSender(apiTrackList);

  Future getTrack({@required int trackId}) async =>
      genericGetRequestSender(apiTrackInfo(trackId: trackId));

  Future getTrackLyrics({@required int trackId}) async =>
      genericGetRequestSender(apiTrackLyrics(trackId: trackId));

  Future genericGetRequestSender(String path) async {
    try {
      final response = await dioClient.get(path);
      final decodedData = jsonDecode(response.data as String);
      final int statusCode =
          decodedData["message"]["header"]["status_code"] as int;
      return statusCode == 200
          ? decodedData
          : throw Failure(
              statusCode: statusCode,
              message: "Internal Server Error",
            );
    } on DioError catch (e) {
      if (e.response != null) {
        throw Failure(
          statusCode: e.response.statusCode,
          message: e.response.statusMessage,
        );
      } else {
        throw Failure(message: e.message);
      }
    }
  }
}
