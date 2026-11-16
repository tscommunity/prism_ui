import 'package:flutter/widgets.dart';
import 'package:prism_ui/input_border.dart';

abstract final class AppCorner {
  static const double none = 0;
  static const double xs = 0;
  static const double sm = 0;
  static const double md = 0;
  static const double lg = 0;
  static const double xl = 0;
  static const double xxl = 0;
  static const double alert = 0;
  static const double full = 0;

  static double fit(double shortestSide) => none;
}

abstract final class AppRadius {
  static const BorderRadius none = BorderRadius.zero;
  static const BorderRadius xs = BorderRadius.zero;
  static const BorderRadius sm = BorderRadius.zero;
  static const BorderRadius md = BorderRadius.zero;
  static const BorderRadius lg = BorderRadius.zero;
  static const BorderRadius xl = BorderRadius.zero;
  static const BorderRadius xxl = BorderRadius.zero;
  static const BorderRadius full = BorderRadius.zero;

  static BorderRadius all(double corner) => BorderRadius.zero;

  static BorderRadius top(double corner) => BorderRadius.zero;

  static BorderRadius vertical({
    double top = AppCorner.none,
    double bottom = AppCorner.none,
  }) => BorderRadius.zero;
}

abstract final class AppShape {
  static const RoundedSuperellipseBorder none = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder xs = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder sm = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder md = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder lg = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder xl = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder xxl = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder full = RoundedSuperellipseBorder();
  static const RoundedSuperellipseBorder circle = RoundedSuperellipseBorder();
  static const AppInputBorder input = AppInputBorder();

  static RoundedSuperellipseBorder all(double corner) =>
      RoundedSuperellipseBorder();

  static RoundedSuperellipseBorder top(double corner) =>
      RoundedSuperellipseBorder();

  static RoundedSuperellipseBorder vertical({
    double top = AppCorner.none,
    double bottom = AppCorner.none,
  }) => RoundedSuperellipseBorder();

  static RoundedSuperellipseBorder of(BorderRadius borderRadius) =>
      RoundedSuperellipseBorder();
}

class AppInputBorder extends InputBorder {
  const AppInputBorder({
    super.borderSide = const BorderSide(),
    this.borderRadius = AppRadius.none,
  });

  final BorderRadius borderRadius;

  RoundedSuperellipseBorder get _shape =>
      RoundedSuperellipseBorder(side: borderSide);

  @override
  bool get isOutline => true;

  @override
  bool get preferPaintInterior => true;

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderSide.width);

  @override
  AppInputBorder copyWith({
    BorderSide? borderSide,
    BorderRadius? borderRadius,
  }) {
    return AppInputBorder(
      borderSide: borderSide ?? this.borderSide,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  AppInputBorder scale(double t) {
    return AppInputBorder(borderSide: borderSide.scale(t));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) =>
      _shape.getInnerPath(rect, textDirection: textDirection);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) =>
      _shape.getOuterPath(rect, textDirection: textDirection);

  @override
  void paintInterior(
    Canvas canvas,
    Rect rect,
    Paint paint, {
    TextDirection? textDirection,
  }) => _shape.paintInterior(canvas, rect, paint, textDirection: textDirection);

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is AppInputBorder) {
      return AppInputBorder(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is AppInputBorder) {
      return AppInputBorder(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) =>
      _shape.paint(canvas, rect, textDirection: textDirection);
}
