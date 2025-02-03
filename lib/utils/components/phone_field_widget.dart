import 'package:app/export.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget({
    super.key,
    this.onChanged,
    this.country,
    this.controller,
    this.label,
    this.hintText,
  });

  final ValueChanged<Country>? onChanged;
  final Country? country;
  final TextEditingController? controller;
  final String? label;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    final code = country?.dialCode ?? app.DEFAULT_COUNTRY_CODE;
    final phoneNumber = PhoneNumber.getCountry(code);
    return Stack(
      children: [
        TextFieldWidget(
          controller: controller,
          hintText: hintText ?? T.phoneNumber.r,
          label: label,
          validator: (v) => app.validation.isNumberRequire(v, T.phoneNumber.r),
          keyboardType: TextInputType.number,
          prefixIcon: const SizedBox(
            width: 110,
          ),
        ),
        Positioned(
          top: 14,
          left: 10,
          child: AppGestureDetector(
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 30,
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: Stack(
                          children: [
                            Positioned(
                              top: -5,
                              child: Text(phoneNumber.flag, style: context.typography.headline5),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  6.sw(),
                  Container(
                    margin: 4.pt(),
                    child: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 15,
                    ),
                  ),
                  3.sw(),
                  Text(
                    code,
                    style: context.typography.body1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
