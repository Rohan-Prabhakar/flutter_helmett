import 'package:flutter/material.dart';

import '../../widgets/text_column.dart';

class CommunityTextColumn extends StatelessWidget {
  const CommunityTextColumn();

  @override
  Widget build(BuildContext context) {
    return const TextColumn(

      title: 'Safety',

      text:
          'Follow rules and safety regulations to ensure better riding environment. ',
    );
  }
}
