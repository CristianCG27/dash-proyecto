import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_background.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  //const AuthLayout({super.key});
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController controller = ScrollController();

    return Scaffold(
      body: Scrollbar(
        controller: controller,
        thumbVisibility: true,
        child: ListView(
          controller: controller,
          physics: const ClampingScrollPhysics(),
          children: [
            (size.width > 650) ? _DesktopBody(child: child) : _MobileBody(child: child),

            //LinksBar
            LinksBar(),
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  //const _DesktopBody({super.key});

  final Widget child;

  const _DesktopBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.95,
      color: Colors.black,
      child: Row(
        children: [
          //Background
          const Expanded(child: BackgroundZ()),
          //BackgroundZ(),

          //Form ViewContainer
          //

          Container(
            width: 550,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(height: 20),
                const CustomTitle(),
                const SizedBox(height: 50),
                //Campos para formulario
                Expanded(child: child)
              ],
            ),

            //TODO: Form
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  //const _MobileBody({super.key});

  final Widget child;

  const _MobileBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackgroundZ(),
          ),
        ],
      ),
    );
  }
}
