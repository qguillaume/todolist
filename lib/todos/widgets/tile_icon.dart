import 'package:flutter/material.dart';

class TileIcon extends StatelessWidget {
  const TileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(Icons.work), Text('description')]);
  }
}
