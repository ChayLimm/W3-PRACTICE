import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';

class DatePickerField extends StatelessWidget {
  // this field can be create with or without the initialize value
  final DateTime? initDateTime;
  final Function(DateTime) onSelectDate;

  const DatePickerField({super.key, required this.initDateTime, required this.onSelectDate, Location? location});

  // check if there is initialize value
  bool get isInit => initDateTime != null;
  // if have, use the initialize data, else it use current day
  String get dateTime => isInit ? DateTimeUtils.formatDateTime(initDateTime!) : DateTimeUtils.formatDateTime(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_today_rounded, size: 16, color: BlaColors.neutral,),
      title: Text(dateTime,style: BlaTextStyles.button.copyWith(color:BlaColors.neutral, ),),
     onTap: () async {
          // call the date picker dialog 
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 1)),
            lastDate: DateTime.now().add(Duration(days: 90)),
          );
          if(selectedDate != null){
            onSelectDate(selectedDate);
            print("select date succesfully $selectedDate");
          }
        },
    );
  }
}