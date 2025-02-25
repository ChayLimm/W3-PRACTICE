import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/screens/location_picker/location_picker_screen.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';

class LocationPickerField extends StatelessWidget {
  // this field can be create with or without initialize value
  final Location? initLocation;
  final String hint;// hint to put in the field when there is no value
  final Function(Location) onSelectLocation;
  const LocationPickerField({super.key, required this.initLocation,required this.hint, required this.onSelectLocation, Location? location});

  //check if it has initialize value to assign else, give user a hint
  String get selectedLocation => initLocation != null ? "${initLocation!.name}, ${initLocation!.country.name}" : hint;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.circle_outlined, size: 16, color: BlaColors.neutral,),
      title: Text(selectedLocation,style: BlaTextStyles.button.copyWith(color:BlaColors.neutral, ),),
      onTap:() {
        // open a full screen dialog of location picker
       Navigator.of(context).push(AnimationUtils.createBottomToTopRoute(
          LocationPickerScreen(
            onSelectLocation: onSelectLocation,
            )
          )
        );
      },
    );
  }
}