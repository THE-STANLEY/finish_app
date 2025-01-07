import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  final String text;
  final TextStyle style;

  const AnimatedText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  late String _displayedText;

  @override
  void initState() {
    super.initState();
    _displayedText = '';
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      for (int i = 0; i < widget.text.length; i++) {
        Future.delayed(Duration(milliseconds: 250 * i), () {
          setState(() {
            _displayedText = widget.text.substring(0, i + 1);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayedText,
      style: widget.style,
    );
  }
}
