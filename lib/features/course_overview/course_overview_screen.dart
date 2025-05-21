import 'package:flutter/material.dart';
import 'package:flutter_test_app/features/course_overview/widgets/company_header.dart';
import 'package:flutter_test_app/features/course_overview/widgets/course_card.dart';
import 'package:flutter_test_app/features/course_overview/widgets/course_card_small.dart';
import 'package:flutter_test_app/features/course_overview/widgets/course_scroll_container.dart';
import 'package:flutter_test_app/features/course_overview/widgets/course_tab_bar.dart';
import 'package:flutter_test_app/features/shared/footer_menu/footer_menu.dart';
import 'package:flutter_test_app/features/shared/footer_menu/widgets/chip_mobile.dart';

class CourseOverviewScreen extends StatelessWidget {
  const CourseOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: FooterMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 32, 12, 32),
          child: Column(
            spacing: 24,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CompanyHeader(),
              const CourseTabBar(),
              const CourseCard(),
              CourseScrollContainer(
                header: "Kurse mit Terminen",
                children: [
                  CourseCardSmall(
                    chips: [
                      ChipMobile.person(name: "Peter Müller"),
                      ChipMobile.date(date: "12.05. 12:00 Uhr"),
                    ],
                  ),
                  CourseCardSmall(
                    chips: [
                      ChipMobile.person(name: "Peter Müller"),
                      ChipMobile.date(date: "12.05. 12:00 Uhr"),
                    ],
                  ),
                ],
              ),
              CourseScrollContainer(
                header: "Kurse mit Frist",
                children: [
                  CourseCardSmall(
                    chips: [
                      ChipMobile.calenderDue(text: "3 Tage überfällig"),
                      ChipMobile.plain(text: "90 min"),
                    ],
                  ),
                  CourseCardSmall(
                    chips: [
                      ChipMobile.calender(text: "Noch 5 Tage"),
                      ChipMobile.plain(text: "90 min"),
                    ],
                  ),
                ],
              ),
              CourseScrollContainer(
                header: "Kurse fortsetzen",
                link: "Alle anzeigen",
                children: [
                  CourseCardSmall(chips: [ChipMobile.plain(text: "90 min")]),
                  CourseCardSmall(chips: [ChipMobile.plain(text: "90 min")]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
