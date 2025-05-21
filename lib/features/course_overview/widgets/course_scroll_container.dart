import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/styles/text_styles.dart';

class CourseScrollContainer extends StatelessWidget {
  final String header;
  final String? link;
  final List<Widget> children;

  const CourseScrollContainer({
    super.key,
    required this.header,
    required this.children,
    this.link,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(header, style: TextStyles.sectionHeader),
            Spacer(),
            if (link != null) Text(link!, style: TextStyles.link),
            const SizedBox(width: 16), 
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(spacing: 8, children: children),
        ),
      ],
    );
  }
}
