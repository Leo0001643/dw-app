
part of 'responsive.dart';

class ScreenScope {
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Orientation? orientation;

  const ScreenScope({
    this.minWidth = 0.0,
    this.maxWidth = 9999,
    this.minHeight = 0.0,
    this.maxHeight = 9999,
    this.orientation,
  }) : assert(minWidth >= 0.0 &&
      minWidth <= maxWidth &&
      maxWidth <= 9999 &&
      minHeight >= 0.0 &&
      minHeight <= maxHeight &&
      maxHeight <= 9999);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> rst = {};
    rst["minWidth"] = minWidth;
    rst["maxWidth"] = maxWidth;
    rst["minHeight"] = minHeight;
    rst["maxHeight"] = maxHeight;
    rst["orientation"] = orientation.toString();

    return rst;
  }

  bool isOfScreenScope(MediaQueryData data) {
    Size size = data.size;
    if (minWidth > size.width ||
        minHeight > size.height ||
        maxWidth < size.width ||
        maxHeight < size.height) {
      return false;
    }
    if (orientation != null && data.orientation != orientation) {
      return false;
    }
    return true;
  }

  @override
  bool operator ==(Object other) {
    if (other is ScreenScope) {
      if (minWidth == other.minWidth &&
          maxWidth == other.maxWidth &&
          minHeight == other.minHeight &&
          maxHeight == other.maxHeight &&
          orientation == other.orientation) {
        return true;
      }
    }
    return false;
  }

  @override
  int get hashCode =>
      hashValues(minWidth, maxWidth, minHeight, maxHeight, orientation);
}