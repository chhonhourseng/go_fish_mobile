import 'package:app/export.dart';

class GenderField extends StatelessWidget {
  final GenderType? type;
  final ValueChanged<GenderType>? onChanged;
  final FormFieldValidator<String>? validator;

  const GenderField({
    super.key,
    this.type,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: TextEditingController(text: type?.i18n.r.toFirstUppercase()),
      label: T.gender.r,
      validator: (v) => validator?.call(v) ?? app.validation.require(v, T.type.r),
      suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      readOnly: true,
      onTap: () => AppBottomSheet.showAction(
        context,
        title: T.gender.r,
        children: List.of(
          GenderType.values.map(
            (v) => AppBottomSheetActionModel(
              text: v.i18n.r,
              icon: v == type ? Icons.radio_button_checked_outlined : Icons.radio_button_unchecked_outlined,
              callbackAction: () => onChanged?.call(v),
            ),
          ),
        ),
      ),
    );
  }
}
