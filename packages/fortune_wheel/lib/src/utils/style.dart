part of 'utils.dart';

class StyleUtils {
  static DecorationImage decorationImage(String imgName, {double? size}) =>
      DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/landscape/$imgName',
          package: 'fortune_wheel',
        ),
      );

  static DecorationImage decorationImagePortrait(String imgName,
          {double? size}) =>
      DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/portrait/$imgName',
          package: 'fortune_wheel',
        ),
      );

  static DecorationImage decorationImagePortraitZ01(String imgName,
          {double? size}) =>
      DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(
          'assets/images/portrait/z01/$imgName',
          package: 'fortune_wheel',
        ),
      );
  static const TextHeightBehavior textHeight = TextHeightBehavior(
    leadingDistribution: TextLeadingDistribution.even,
  );

  static final TextStyle primaryTextStyle = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    color: const Color.fromRGBO(91, 56, 175, 1),
  );

  static final TextStyle primaryTextStyleZ01 = TextStyle(
    fontSize: 10.sp,
    fontWeight: FontWeight.bold,
    color: const Color(0xFF505050),
  );
}
