import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class CommonWidgets {
  static Widget buildInitial() {
    return Card(
      color: Colors.blueAccent,
      child: const Text("It's Lonely in Here").padding(all: 20),
    );
  }

  static Widget buildLoading() {
    return const Text("Loading...")
        .bold()
        .fontSize(25)
        .textColor(Colors.white)
        .textAlignment(TextAlign.center)
        .padding(all: 16)
        .card(color: Colors.redAccent);
  }

  static Widget buildError(String message) {
    return Text(message)
        .bold()
        .fontSize(25)
        .textColor(Colors.white)
        .textAlignment(TextAlign.center)
        .padding(all: 16)
        .card(color: Colors.redAccent);
  }
}
