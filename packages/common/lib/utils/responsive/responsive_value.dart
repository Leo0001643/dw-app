
part of 'responsive.dart';

class ResponsiveValue<T> {
  late Map<ScreenScope, T> values;

  ResponsiveValue(this.values);

  T? resolve(
      BuildContext context, [
        T? Function(T? previousValue, T? element)? combine,
      ]) {
    T? rst;
    values.forEach((key, value) {
      if (key.isOfScreenScope(MediaQuery.of(context))) {
        if (combine == null) {
          rst = value;
        } else {
          rst = combine(rst, value);
        }
      }
    });
    return rst;
  }
}
