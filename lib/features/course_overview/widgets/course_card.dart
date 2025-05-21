import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/assets.gen.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/features/shared/footer_menu/widgets/chip_mobile.dart';
import 'package:flutter_test_app/styles/text_styles.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
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
        spacing: 12,
        children: [
          _CourseCardImage(),
          _CourseCardChipGroup(),
          _CourseCardInformation(),
        ],
      ),
    );
  }
}

class _CourseCardImage extends StatelessWidget {
  const _CourseCardImage();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 141,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Assets.lib.assets.images.courseImageWide.image(
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
          child: ChipMobile(caption: "zuletzt bearbeitet"),
        ),
      ],
    );
  }
}

class _CourseCardChipGroup extends StatelessWidget {
  const _CourseCardChipGroup();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.start,
      alignment: WrapAlignment.start,
      spacing: 4,
      runSpacing: 4,
      children: [
        ChipMobile.appointments(text: "Kurs mit Terminen"),
        ChipMobile.person(name: "Andreas Bunz"),
        ChipMobile.date(date: "12.05. 12:00 Uhr"),
        ChipMobile.plain(text: "online"),
      ],
    );
  }
}

class _CourseCardInformation extends StatelessWidget {
  const _CourseCardInformation();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        spacing: 24,
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
      ),
    );
  }
}
