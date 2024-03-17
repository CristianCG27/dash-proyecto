import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

import '../cards/white_card.dart';

class BlankView extends StatelessWidget {
  const BlankView({super.key});
  //min 12
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Text(
            'Blank View',
            style: CustomLabels.h1,
          ),
          const SizedBox(height: 10),
          const WhiteCard(
            title: 'Blank Page',
            child: Text('Holaaaaaaaaaaaaaaaaaaaaaaa'),
          )
        ],
      ),
    );
  }
}
