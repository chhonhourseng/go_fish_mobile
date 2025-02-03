import 'package:app/export.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    required this.builder,
    this.validator,
    this.isBorderNone = true,
    this.initialValue,
    this.contentPadding,
  });

  final Widget Function(BuildContext context, bool isError) builder;
  final FormFieldValidator<String>? validator;
  final bool isBorderNone;
  final String? initialValue;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<String> field) {
        return InputDecorator(
          decoration: InputDecoration(
            contentPadding: contentPadding,
            errorText: field.errorText,
            border: isBorderNone ? InputBorder.none : null,
            enabledBorder: isBorderNone ? InputBorder.none : null,
            focusedBorder: isBorderNone ? InputBorder.none : null,
            errorBorder: isBorderNone ? InputBorder.none : null,
          ),
          child: builder.call(context, field.hasError),
        );
      },
    );
  }
}
