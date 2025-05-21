import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/assets/gen/fonts.gen.dart';

class CourseTabBar extends StatelessWidget {
  const CourseTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: _CourseTabBarRow(),
      ),
    );
  }
}

class _CourseTabBarRow extends StatelessWidget {
  const _CourseTabBarRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorName.surfaceColorsSurfaceDim,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          _CourseTabBarItem(caption: "Deine Kurse", active: true),
          _CourseTabBarItem(caption: "Entdecken", active: false),
          _CourseTabBarItem(caption: "Abgeschlossen", active: false),
        ],
      ),
    );
  }
}

class _CourseTabBarItem extends StatelessWidget {
  final bool active;
  final String caption;

  const _CourseTabBarItem({required this.active, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color:
            active
                ? ColorName.surfaceColorsSurface
                : ColorName.surfaceColorsSurfaceDim,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        caption,
        style: TextStyle(
          fontSize: 14,
          fontFamily: FontFamily.inter,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
          letterSpacing: 0.1,
          color: ColorName.surfaceColorsOnSurface,
        ),
      ),
    );
  }
}
