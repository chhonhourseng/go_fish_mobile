import 'package:app/export.dart';
import 'package:flutter/cupertino.dart';

class DateFieldWidget extends StatefulWidget {
  const DateFieldWidget({
    super.key,
    this.label,
    this.validator,
    this.onChanged,
    this.hintText,
    this.initialDateTime,
    this.minimumDate,
  });

  final String? label;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<DateTime>? onChanged;
  final DateTime? initialDateTime;
  final DateTime? minimumDate;

  @override
  State<DateFieldWidget> createState() => _DateFieldWidgetState();
}

class _DateFieldWidgetState extends State<DateFieldWidget> {
  DateTime dateTimes = new DateTime.now();

  @override
  void initState() {
    if (widget.initialDateTime == null) {
      dateTimes = new DateTime(dateTimes.year, dateTimes.month, dateTimes.day);
    }
    super.initState();
  }

  void showDate() {
    AppBottomSheet(
      isAutoHeight: true,
      child: buildDate(),
      isClose: false,
      isOK: true,
      onOK: () => widget.onChanged?.call(dateTimes),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      label: widget.label,
      hintText: widget.hintText,
      controller: TextEditingController(text: (widget.initialDateTime ?? app.now).toFormat()),
      validator: (v) => widget.validator?.call(v) ?? app.validation.require(v, T.type.r),
      suffixIcon: const Icon(Icons.date_range, color: AppColor.greyLightI),
      readOnly: true,
      onTap: () => showDate(),
    );
  }

  Widget buildDate() {
    return SizedBox(
      height: 300,
      child: Builder(builder: (context) {
        return CupertinoTheme(
          data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
              dateTimePickerTextStyle: TextStyle(
                color: context.isDark ? Colors.white : AppColor.blackColor,
                fontSize: 17,
              ),
            ),
          ),
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: widget.initialDateTime ?? dateTimes,
            minimumDate: widget.minimumDate,
            onDateTimeChanged: (newDateTime) {
              dateTimes = newDateTime;
            },
          ),
        );
      }),
    );
  }
}
