import 'package:flutter/material.dart';
import 'package:flutter_test_app/assets/gen/assets.gen.dart';

class CompanyHeader extends StatelessWidget {
  const CompanyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.lib.assets.images.companyLogoWide.image(
      fit: BoxFit.contain,
      height: 40,
    );
  }
}
