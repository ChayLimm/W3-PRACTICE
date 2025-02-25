import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/locations.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

class LocationTile extends StatelessWidget {
  // location to display in the list tile
  final Location location;
  // On trigger it will change the parent location to it's location
  final Function(Location) onPressed;
  const LocationTile({super.key,required this.location, required this.onPressed});

  String get title => location.name;
  String get subTitle =>location.country.name;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:()=> onPressed(location),
      // leading: Icon(Icons.history,size: 16, color: BlaColors.iconNormal,),  comment for later use
      title: Text(title, style: BlaTextStyles.body.copyWith(color: BlaColors.textNormal)),
      subtitle: Text(subTitle, style: BlaTextStyles.label.copyWith(color: BlaColors.textLight)),
      trailing: Icon(Icons.arrow_forward_ios, color: BlaColors.iconLight, size: 16,),
    );
  }
}
