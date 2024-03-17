import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  //const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: Colors.black,
      height: (size.width > 650) ? size.height * 0.09 : null,
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          LinkText(text: 'About', onPress: () => print('About')),
          const LinkText(text: 'Help Center'),
          const LinkText(text: 'Privacy Policy'),
          const LinkText(text: 'Terms of Service'),
          const LinkText(text: 'Cookie Policy'),
          const LinkText(text: 'Ads Info'),
          const LinkText(text: 'Blogs'),
          const LinkText(text: 'Status '),
          const LinkText(text: 'Careers'),
          const LinkText(text: 'Brand Resources'),
          const LinkText(text: 'Advertising'),
          const LinkText(text: 'Marketing'),
        ],
      ),
    );
  }
}
