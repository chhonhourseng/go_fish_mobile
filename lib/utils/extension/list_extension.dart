import 'package:app/export.dart';

extension ListExtension on List {
  List<Widget> separator(Widget Function(int index) separatorBuilder) {
    var result = List<Widget>.empty(growable: true);
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(separatorBuilder(i));
      }
    }
    return result;
  }
}