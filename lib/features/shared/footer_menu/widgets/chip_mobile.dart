import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/assets.gen.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/styles/text_styles.dart';

class ChipMobile extends StatelessWidget {
  final String caption;
  final Widget? avatar;
  final Color? backgroundColor;
  final Color? fontColor;

  const ChipMobile({
    super.key,
    required this.caption,
    this.avatar,
    this.backgroundColor,
    this.fontColor = ColorName.surfaceColorsOnSurface,
  });

  ChipMobile.date({Key? key, required String date})
    : this(
        key: key,
        caption: date,
        avatar: Assets.lib.assets.icons.groups.svg(
          colorFilter: ColorFilter.mode(
            ColorName.surfaceColorsOutlineVariant,
            BlendMode.srcIn,
          ),
        ),
      );

  ChipMobile.person({Key? key, required String name})
    : this(
        key: key,
        caption: name,
        avatar: ClipOval(
          child: Assets.lib.assets.images.avatar.image(fit: BoxFit.cover),
        ),
      );

  const ChipMobile.plain({Key? key, required String text})
    : this(key: key, caption: text);

  ChipMobile.calender({Key? key, required String text})
    : this(
        key: key,
        caption: text,
        avatar: Assets.lib.assets.icons.calendarClock.svg(
          colorFilter: ColorFilter.mode(
            ColorName.surfaceColorsOnSurface,
            BlendMode.srcIn,
          ),
        ),
      );

  ChipMobile.calenderDue({Key? key, required String text})
    : this(
        key: key,
        caption: text,
        avatar: Assets.lib.assets.icons.calendarClock.svg(
          colorFilter: ColorFilter.mode(
            ColorName.errorSuccessColorsOnError,
            BlendMode.srcIn,
          ),
        ),
        backgroundColor: ColorName.errorSuccessColorsError,
        fontColor: ColorName.errorSuccessColorsOnError,
      );

  ChipMobile.appointments({Key? key, required String text})
    : this(
        key: key,
        caption: text,
        avatar: Assets.lib.assets.icons.graph.svg(
          colorFilter: ColorFilter.mode(
            ColorName.surfaceColorsOutlineVariant,
            BlendMode.srcIn,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: backgroundColor ?? ColorName.surfaceColorsSurfaceContainer,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          if (avatar != null) avatar!,
          Text(
            caption,
            style: TextStyles.chip.copyWith(
              color: fontColor ?? ColorName.surfaceColorsOnSurface,
            ),
          ),
        ],
      ),
    );
  }
}
