import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstScreenWidget extends StatelessWidget {
  const FirstScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void push() {
      Future.delayed(Duration(seconds: 1), () {
        Navigator.of(context).pushReplacementNamed('/main');
      });
    }

    push();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SvgPicture.asset(
          './assets/svg/Logo.svg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
