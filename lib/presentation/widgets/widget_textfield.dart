import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
//ignore: must_be_immutable
class WidgetTextField extends StatefulWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? endIcon;
  final TextInputType? textInputType;
  final GestureTapCallback? endIconOnTap;
  bool obscureText = true;
  final String? hintText;
  final String? labelText;
  final Iterable<String>? autofill;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry? contentPadding;
  final ValueChanged<String>? onSubmit;
  final double? heightSuffix;
  final double? widthSuffix;
  final double? radius;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final int? maxLines;
  final Color? bgColor;
  final bool showEyeSuffix;
  final bool autoFocus;
  final int? maxLength;
  final Color? borderColor;
  final Widget? prefix;
  final Widget? action;
  final Widget? actionSuffix;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final Function()? onEditingComplete;
  final OutlineInputBorder? outlineInputBorder;

  WidgetTextField(
      {Key? key,
      this.onTap,
      this.heightSuffix,
      this.readOnly = false,
      this.widthSuffix,
      this.onSubmit,
      this.hintText,
      this.contentPadding,
      this.onChanged,
      this.validator,
      this.controller,
      this.endIcon,
      this.textInputType = TextInputType.text,
      this.endIconOnTap,
      this.obscureText = false,
      this.style,
      this.hintStyle,
      this.maxLines,
      this.bgColor,
      this.inputFormatters,
      this.showEyeSuffix = false,
      this.autofill,
      this.autoFocus = false,
      this.maxLength,
      this.onEditingComplete,
      this.borderColor,
      this.prefix,
      this.action,
      this.actionSuffix,
      this.radius,
      this.labelText,
      this.focusNode,
      this.labelStyle,
      this.outlineInputBorder})
      : super(key: key);

  @override
  State<WidgetTextField> createState() => _WidgetTextFieldState();
}

class _WidgetTextFieldState extends State<WidgetTextField> {
  TextStyle get defaultStyle => Theme.of(context)
      .textTheme
      .labelMedium!
      .copyWith(color: const Color(0xff828282));
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText ?? '',
          style: widget.labelStyle,
        ),
        const Gap(10),
        TextFormField(
          focusNode: widget.focusNode,
          minLines: 1,
          textInputAction: TextInputAction.done,
          maxLines: widget.maxLines ?? 1,
          maxLength: widget.maxLength,
          autofillHints: widget.autofill,
          onTap: widget.onTap,
          autocorrect: false,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onSubmit,
          validator: widget.validator,
          readOnly: widget.readOnly,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
          cursorColor: Colors.black,
          inputFormatters: widget.inputFormatters,
          autofocus: widget.autoFocus,
          onEditingComplete: widget.onEditingComplete,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            isCollapsed: true,
            isDense: true,
            prefixIcon: widget.prefix,
            prefixIconConstraints: BoxConstraints.tightFor(
                width: widget.widthSuffix ?? 50,
                height: widget.heightSuffix ?? 24),
            contentPadding: widget.contentPadding ??
                const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            hintText: widget.hintText,
            hintStyle:
                (widget.hintStyle ?? defaultStyle.copyWith(color: Colors.grey)),
            alignLabelWithHint: true,
            suffixIcon: widget.actionSuffix ??
                (widget.showEyeSuffix
                    ? GestureDetector(
                        child: Icon(widget.obscureText
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onTap: () => setState(
                            () => widget.obscureText = !widget.obscureText))
                    : const SizedBox()),
            border: widget.outlineInputBorder ?? _border(),
            focusedBorder: widget.outlineInputBorder ?? _borderFocus(),
            focusedErrorBorder: widget.outlineInputBorder ?? _borderFocus(),
            enabledBorder: widget.outlineInputBorder ?? _border(),
            errorBorder: _borderErros(),
            suffixIconConstraints: BoxConstraints.tightFor(
                width:
                    (widget.widthSuffix == null && widget.showEyeSuffix == true)
                        ? 50
                        : 0,
                height:
                    (widget.widthSuffix == null && widget.showEyeSuffix == true)
                        ? 24
                        : 0),
            // suffixIcon: widget.actionSuffix ?? const SizedBox(),
          ),
          style: widget.style ?? defaultStyle,
        ),
      ],
    );
  }

  OutlineInputBorder _border() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? Colors.grey),
        borderRadius: BorderRadius.circular(widget.radius ?? 4));
  }

  OutlineInputBorder _borderFocus() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor ?? Colors.blue),
        borderRadius: BorderRadius.circular(widget.radius ?? 4));
  }

  OutlineInputBorder _borderErros() {
    return OutlineInputBorder(
        borderSide:
            BorderSide(color: widget.borderColor ?? const Color(0xffFF7D7D)),
        borderRadius: BorderRadius.circular(widget.radius ?? 4));
  }
}
