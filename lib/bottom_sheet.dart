import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  final String urlImage;
  const BottomSheetPage({Key? key, required this.urlImage}) : super(key: key);

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(),
          )
        ],
      ),
    );
  }
}
