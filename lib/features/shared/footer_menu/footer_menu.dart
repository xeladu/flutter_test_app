import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/assets.gen.dart';
import 'package:flutter_test_app/assets/gen/colors.gen.dart';
import 'package:flutter_test_app/styles/text_styles.dart';

class FooterMenu extends StatelessWidget {
  const FooterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: EdgeInsets.fromLTRB(0, 15, 0, 30),
      color: ColorName.surfaceColorsSurface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(width: 30),
          _FooterMenuNavButton(
            label: "Home",
            icon: Assets.lib.assets.icons.home.svg(
              colorFilter: ColorFilter.mode(
                ColorName.surfaceColorsOutlineVariant,
                BlendMode.srcIn,
              ),
            ),
          ),
          Spacer(),
          _FooterMenuNavButton(
            label: "Kurse",
            icon: Assets.lib.assets.icons.school.svg(
              colorFilter: ColorFilter.mode(
                ColorName.surfaceColorsOnSurface,
                BlendMode.srcIn,
              ),
            ),
          ),
          Spacer(),
          _FooterMenuNavButton(
            label: "Wissen",
            icon: Assets.lib.assets.icons.noteStack.svg(
              colorFilter: ColorFilter.mode(
                ColorName.surfaceColorsOutlineVariant,
                BlendMode.srcIn,
              ),
            ),
          ),
          Spacer(),
          _FooterMenuNavButton(
            label: "Search",
            icon: Assets.lib.assets.icons.search.svg(
              colorFilter: ColorFilter.mode(
                ColorName.surfaceColorsOutlineVariant,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 30),
        ],
      ),
    );
  }
}

class _FooterMenuNavButton extends StatelessWidget {
  final String label;
  final Widget icon;

  const _FooterMenuNavButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 67,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(width: 28, height: 28, child: Center(child: icon)),
          Expanded(
            child: Center(
              child: Text(
                label,
                style: TextStyles.navItem,
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
