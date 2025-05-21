import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/assets.gen.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/features/shared/footer_menu/widgets/chip_mobile.dart';
import 'package:flutter_test_app/styles/text_styles.dart';

class CourseCardSmall extends StatelessWidget {
  final List<ChipMobile> chips;

  const CourseCardSmall({super.key, required this.chips});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 2,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.08),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ColorName.surfaceColorsOutlineVariant,
          style: BorderStyle.solid,
          width: 0.5,
        ),
        color: ColorName.surfaceColorsSurfaceContainerHighest,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CourseCardChipGroup(chips: chips),
          const SizedBox(height: 24),
          Row(
            spacing: 24,
            children: [
              Expanded(child: _CourseCardInformation()),
              _CourseCardImage(),
            ],
          ),
        ],
      ),
    );
  }
}

class _CourseCardImage extends StatelessWidget {
  const _CourseCardImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Assets.lib.assets.images.courseImage.image(fit: BoxFit.fill),
      ),
    );
  }
}

class _CourseCardChipGroup extends StatelessWidget {
  final List<ChipMobile> chips;

  const _CourseCardChipGroup({required this.chips});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start,
      spacing: 4,
      runSpacing: 4,
      children: chips,
    );
  }
}

class _CourseCardInformation extends StatelessWidget {
  const _CourseCardInformation();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 36,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Building a better Sprinkler package", style: TextStyles.title),
        LinearProgressIndicator(
          borderRadius: BorderRadius.circular(27),
          minHeight: 8,
          color: ColorName.colorVariablesTertiary,
          backgroundColor: ColorName.surfaceColorsSurfaceContainer,
          value: 0.1,
        ),
      ],
    );
  }
}
