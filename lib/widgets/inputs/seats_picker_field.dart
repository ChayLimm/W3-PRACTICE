import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class SeatPickerField extends StatelessWidget {
  //this field can be build with or without initialize value, by defualt it is 1
  final int? initSeats ;
  final Function(int) onSelectSeats;
  const SeatPickerField({super.key,this.initSeats = 1, required this.onSelectSeats});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person, size: 16, color: BlaColors.neutral,),
      title: Text(initSeats.toString(),style: BlaTextStyles.button.copyWith(color:BlaColors.neutral, ),),
      onTap:(){
        //implement the logic of full screen dialog seats picker
      },
    );
  }
}