import 'dart:math';

import 'package:app/export.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    this.label,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.controller,
    this.onTap,
    this.readOnly = false,
    this.isBorderNone = false,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.hintText,
    this.contentPadding,
    this.focusNode,
    this.helperText,
    this.maxLines,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.filled = false,
  });

  final String? label;
  final String? hintText;
  final String? helperText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final bool isBorderNone;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final bool filled;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildForm(context);
  }

  Widget buildForm(BuildContext context) {
    final _isBorderNone = widget.isBorderNone || widget.filled;
    return TextFormField(
      controller: widget.controller,
      onTapOutside: (v) => app.focusNew(context),
      validator: widget.validator,
      focusNode: focusNode,
      maxLines: widget.minLines != null
          ? max(widget.minLines!, (widget.maxLines ?? 1))
          : widget.maxLines ?? 1,
      minLines: widget.minLines ?? 1,
      expands: widget.expands,
      style: context.typography.body1,
      decoration: InputDecoration(
        contentPadding:
            widget.contentPadding ?? (widget.filled ? 10.p() : null),
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffix: widget.suffix,
        suffixIcon: widget.suffixIcon,
        labelText: widget.label,
        hintText: widget.hintText,
        helperText: widget.helperText,
        fillColor: widget.filled ? Colors.white : null,
        filled: widget.filled ? true : false,
        border: _isBorderNone ? InputBorder.none : null,
        enabledBorder: _isBorderNone ? InputBorder.none : null,
        focusedBorder: _isBorderNone ? InputBorder.none : null,
        focusedErrorBorder: _isBorderNone ? InputBorder.none : null,
        errorBorder: _isBorderNone ? InputBorder.none : null,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      inputFormatters: <TextInputFormatter>[
        if (widget.keyboardType == TextInputType.number)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
    );
  }
}
