import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:musix_final/app/modules/bookmark/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('BookmarkView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BookmarkView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  