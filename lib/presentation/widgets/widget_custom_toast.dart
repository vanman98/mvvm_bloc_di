import 'package:flutter/material.dart';

enum CustomToastType {
  success,
  warning,
  error,
}

class CustomToast extends StatelessWidget {
  final Widget content;
  final CustomToastType type;
  final String message;
  const CustomToast(
      {Key? key,
      this.type = CustomToastType.warning,
      required this.message,
      required this.content})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: 80 + MediaQuery.of(context).viewInsets.bottom),
        child: DefaultTextStyle(
          style: TextStyle(color: getColor()),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: getColor(),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: content,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor() {
    switch (type) {
      case CustomToastType.success:
        return const Color(0xFF5AC926);
      case CustomToastType.warning:
        return const Color(0xFFF6B100);
      case CustomToastType.error:
        return const Color(0xFFFF5238);
    }
  }
}
