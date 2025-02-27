import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class BlaSearchBar extends StatelessWidget {
  // Trigger on change so the parent can rebuild while user typing
  final Function(String) onChange;
  const BlaSearchBar({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ListTile(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
                size: 16, color: BlaColors.iconNormal),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.close,size: 16, color: BlaColors.iconNormal),
            onPressed: (){
              //clear the input logic
            },
            ),
          title: TextFormField(
            style: BlaTextStyles.button.copyWith(color: BlaColors.neutral),
            decoration: InputDecoration(
              // static hint for now.
              hintText: "Station Road or The Bridge Cafe",
              hintStyle:BlaTextStyles.button.copyWith(color: BlaColors.neutralLight),
              border: InputBorder.none, // Removed underline border
            ),
            onChanged: (value) {
              onChange(value);
            },
          )
          ),
    );
  }
}