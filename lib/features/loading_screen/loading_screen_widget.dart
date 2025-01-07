import 'package:flutter/material.dart';
import 'package:myday/features/loading_screen/widgets/widgets.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void push() {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/main');
      });
    }

    push();

    return Scaffold(
      body: Center(
        child: AnimatedText(
          text: 'MyDay',
          style: Theme.of(context).textTheme.titleLarge!,
        ),
      ),
    );
  }
}
