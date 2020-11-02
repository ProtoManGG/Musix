import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:musix_final/app/modules/track/track_controller.dart';

class TrackView extends GetView<TrackController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('TrackView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TrackView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  