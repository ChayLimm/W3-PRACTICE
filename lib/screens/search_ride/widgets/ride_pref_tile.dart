import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride_pref/ride_pref.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';

class RidePrefTile extends StatelessWidget {
  final RidePref ridePref;
  const RidePrefTile({super.key, required this.ridePref});

  ///
  /// prepare the format of the title and subtitle 
  /// 
  String get title => "${ridePref.departure.name} → ${ridePref.arrival.name}";
  String get subTitle =>"${DateTimeUtils.formatDateTime(ridePref.departureDate)},  ${ridePref.requestedSeats} passenger${ridePref.requestedSeats > 1 ? "s" : ""}";


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: BlaColors.neutralLighter,
        ),
        borderRadius: BorderRadius.circular(BlaSpacings.radius)
      ),
      child: ListTile(
          leading: IconButton(icon: Icon( Icons.arrow_back_ios,size: 16,color: BlaColors.iconNormal,),
          onPressed:() {
            Navigator.pop(context);
            }
          ),
          title: Text(title,style: BlaTextStyles.button.copyWith(color: BlaColors.neutral,)),
          subtitle: Text(subTitle,style: BlaTextStyles.button.copyWith(color: BlaColors.neutralLight,),),
          trailing: Text("Filter",style: BlaTextStyles.button.copyWith(color: BlaColors.primary,fontWeight: FontWeight.bold),)
      ),
    );
  }
}