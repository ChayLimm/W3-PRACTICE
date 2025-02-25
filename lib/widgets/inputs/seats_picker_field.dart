import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/seat_number_spinner/seat_number_spinnner_screen.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';

class SeatPickerField extends StatelessWidget {
  //this field can be build with or without initialize value, by defualt it is 1
  final int? initSeats ;
  final Function(int) onSelectSeats; // function to change the parent value
  const SeatPickerField({super.key,this.initSeats = 1, required this.onSelectSeats});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.person, size: 16, color: BlaColors.neutral,),
      title: Text(initSeats.toString(),style: BlaTextStyles.button.copyWith(color:BlaColors.neutral, ),),
      onTap:(){
        //implement the logic of full screen dialog seats number spinner
        Navigator.of(context).push(AnimationUtils.createBottomToTopRoute(
            SeatNumberSpinnnerScreen(onChange: onSelectSeats,initSeats: initSeats )
          )
        );
      },
    );
  }
}