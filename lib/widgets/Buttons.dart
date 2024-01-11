import 'package:flutter/material.dart';
import 'package:matz/constants.dart';

class _CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final double width;
  final double height;
  final Color color;
  final String buttonText;
  final TextStyle buttonTextStyle;

  const _CustomButton({
    required this.onTap,
    required this.width,
    required this.height,
    required this.color,
    required this.buttonText,
    required this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: color,
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                blurRadius: 2.0,
                spreadRadius: 2.0,
              ),
            ]),
        child: Center(
          child: Text(
            buttonText,
            style: buttonTextStyle,
          ),
        ),
      ),
    );
  }
}

class PlayNowButton extends StatelessWidget {
  final VoidCallback onTap;

  const PlayNowButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _CustomButton(
      width: 194.0,
      height: 50.0,
      buttonText: 'Start',
      buttonTextStyle: kPlayNowButtonTextStyle,
      color: kGreenColor,
      onTap: onTap,
    );
  }
}

class PlayNowButtonBack extends StatelessWidget {
  final VoidCallback onTap;

  const PlayNowButtonBack({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return _CustomButton(
      width: 194.0,
      height: 50.0,
      buttonText: 'Back Menu',
      buttonTextStyle: kPlayNowButtonTextStyle,
      color: kGreenColor,
      onTap: onTap,
    );
  }
}

class RetryButton extends StatelessWidget {
  final VoidCallback onTap;

  const RetryButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _CustomButton(
        width: 125.0,
        height: 49.0,
        buttonText: 'Retry',
        buttonTextStyle: kPlayNowButtonTextStyle,
        color: kGreenColor,
        onTap: onTap,
      ),
    );
  }
}

class YesNoButton extends StatelessWidget {
  final void Function(bool) onTap;

  const YesNoButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    List<Color> color = [kGreenColor, const Color.fromARGB(255, 246, 113, 104)];
    color.shuffle();

    List<_CustomButton> buttons = [
      _CustomButton(
        width: 125,
        height: 50,
        buttonText: 'True',
        buttonTextStyle: kYesNoButtonTextStyle,
        onTap: () {
          onTap(true);
        },
        color: color[0],
      ),
      _CustomButton(
        width: 125,
        height: 50,
        buttonText: 'False',
        buttonTextStyle: kYesNoButtonTextStyle,
        onTap: () {
          onTap(false);
        },
        color: color[1],
      ),
  

    ];
    buttons.shuffle();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buttons[0],
        const SizedBox(
          width: 25,
        ),
        buttons[1],
      ],
    );
  }
}
