import 'package:base_getx/presentation/presentation.dart';
import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AssetManager.emptyData,
        scale: 3,
      ),
    );
  }
}
