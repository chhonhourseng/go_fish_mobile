import 'package:app/export.dart';

part 'serializer.gen.dart';

K deserialize<K>(dynamic json) {
  var result = deserializeType<K>(json);
  if (result != null) {
    return result;
  }
  if ([String, int, double, bool, Color].contains(K)) {
    return json as K;
  } else if (K == num) {
    return numFromDynamicJson(json) as K;
  } else if (K == Color) {
    return getColorFromData(json) as K;
  } else if (K == dynamic || K == Object) {
    return json;
  }
  throw StringException('Type $K is not registered in serializer.dart');
}

List<T> deserializeList<T>(List<dynamic> json) {
  return List.generate(json.length, (index) => deserialize<T>(json[index]));
}
