import 'package:clima_meteoroligico/ui/utils/responsive.dart';
import 'package:clima_meteoroligico/ui/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmedDialog extends StatelessWidget {
  final VoidCallback onPressed;
  final String? titleText;
  final String? subTitleText;

  const ConfirmedDialog({
    Key? key,
    required this.onPressed,
    this.titleText,
    this.subTitleText = 'Will be added to the list of cities',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: SizedBox(
        width: responsive.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(titleText!),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              subTitleText!,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
              textAlign: TextAlign.center,
            ),
            const Divider(),
          ],
        ),
      ),
      actions: [
        SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefaultButton(
                text: 'Cancel',
                icon: FontAwesomeIcons.ban,
                function: () => Navigator.pop(context),
                widthSize: responsive.width / 2 - 52,
                color: Colors.redAccent,
              ),
              DefaultButton(
                text: 'Continue',
                icon: FontAwesomeIcons.check,
                function: onPressed,
                widthSize: responsive.width / 2 - 52,
                color: Colors.indigo,
              )
            ],
          ),
        )
      ],
    );
  }
}
