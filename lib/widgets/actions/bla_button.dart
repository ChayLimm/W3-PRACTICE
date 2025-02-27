import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

///
/// This enum is use to tell the BlaButton class what button do you want to use
///
enum ButtonType { primary, secondary, tertiary }

///
/// This is a custom button for Blablacar that contain (primary, secondary, tertiary) 
///
class BlaButton extends StatelessWidget {
  
  final ButtonType type; //type of button you want yo use (primary, secondary, tertiary)
  final IconData? icon; //icon to display in button
  final String text; // button label
  final VoidCallback onPressed; // event on click

  const BlaButton({
    super.key,
    required this.type,
    this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    // Define button styles based on type

    Color backgroundColor;
    BorderSide? borderSide;
    Color textColor = BlaColors.primary;
    Color iconColor = BlaColors.primary;
    double elevation = 0;

    // check the type of the button to return the correct ui

    switch (type) {
      case ButtonType.primary:
        backgroundColor = BlaColors.primary;
        textColor = BlaColors.white;
        iconColor = BlaColors.white;
        elevation = 2;
        break;
      case ButtonType.secondary:
        backgroundColor = Colors.transparent;
        borderSide = BorderSide(color: BlaColors.greyLight, width: 1);
        break;
      case ButtonType.tertiary:
        backgroundColor = Colors.transparent;
        break;
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        side: borderSide,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) Icon(icon, size: 16, color: iconColor),
          if (icon != null) const SizedBox(width: BlaSpacings.s),
          Text(text, style: BlaTextStyles.button.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
