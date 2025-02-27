import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/screens/location_picker/location_picker_screen.dart';
import 'package:week_3_blabla_project/screens/search_ride/search_ride_screen.dart';
import 'package:week_3_blabla_project/screens/seat_number_spinner/seat_number_spinnner_screen.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/utils/date_time_util.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

// UI Components
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
///
/// A Ride Preference From is a view to select:
///   - A depcarture location
///   - An arrival location
///   - A date
///   - A number of seats
///
/// The form can be created with an existing RidePref (optional).
///
class RidePrefForm extends StatefulWidget {
  // The form can be created with an optional initial RidePref.
  final RidePref? initRidePref;

  const RidePrefForm({super.key, this.initRidePref});

  @override
  State<RidePrefForm> createState() => _RidePrefFormState();
}

class _RidePrefFormState extends State<RidePrefForm> {
  Location? departure;
  late DateTime departureDate;
  Location? arrival;
  late int requestedSeats ;

  // ----------------------------------
  // Initialize the Form attributes
  // ----------------------------------

  @override
  void initState() {
    super.initState();
    // TODO
    bool isInitRidePref = widget.initRidePref != null;
    if (isInitRidePref) {
      departure = widget.initRidePref!.departure;
      arrival = widget.initRidePref!.arrival;
      requestedSeats = widget.initRidePref!.requestedSeats;
      departureDate = widget.initRidePref!.departureDate;
    }else{
      departure = null;
      arrival = null;
      requestedSeats = 1;
      departureDate = DateTime.now();
    }
  }

  // ----------------------------------
  // Handle events
  // ----------------------------------

// Swap location funtion
  void swapLocations() {
    final tempDeparture = departure;
    final tempArrival = arrival;
    setState(() {
      departure = tempArrival;
      arrival = tempDeparture;
    });
  }

  //Function to change each value

  void onSelectArrival() async{
    final Location? location = await Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPickerScreen()));
    if(location != null){
      setState(() {
          arrival = location;
      });
    }
  }

  void onSelectDeparture() async {
    final Location? location = await Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationPickerScreen()));
    if(location != null){
      setState(() {
        departure = location;      
        }
      );
    }
   
  }

  void onSelectDepartureDate() async{
     final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(Duration(days: 1)),
            lastDate: DateTime.now().add(Duration(days: 90)),
          );
          if(selectedDate != null){
              setState(() {
                departureDate = selectedDate;
                print("function trigger");
              });
          }
    }

  void onSelectSeats() async {
   final int? selectedSeats = await Navigator.of(context).push(AnimationUtils.createBottomToTopRoute(SeatNumberSpinnnerScreen(initSeats: requestedSeats )));
   if(selectedSeats != null){ setState(() {
      requestedSeats = selectedSeats;
    });}
  }
  // Search button and validor for the form

  void onSearch() async {
    //validate depature, if null show location picker;
    if (departure == null) {
      //show the full screen dialog of select location
      departure = await Navigator.of(context)
          .push(AnimationUtils.createBottomToTopRoute(LocationPickerScreen(
      )));
      //validate arrival, if null show location picker;
    } else if (arrival == null) {
      //show the full screen dialog of select location
      arrival = await Navigator.of(context)
          .push(AnimationUtils.createBottomToTopRoute(LocationPickerScreen(
      )));
    } else {
      RidePref ridePref = RidePref(
          departure: departure!,
          departureDate: departureDate,
          arrival: arrival!,
          requestedSeats: requestedSeats);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchRideScreen(
                    ridePref: ridePref,
                  )
                )
              );
    }
  }

  // ----------------------------------
  // Compute the widgets rendering
  // ----------------------------------

  String get initDepature => departure !=null ? "${departure!.name}, ${departure!.country.name}" : "Leaving From";
  String get initArrival => arrival !=null ? "${arrival!.name}, ${arrival!.country.name}" : "Leaving From";
  String get initDepartureDate =>DateTimeUtils.formatDateTime(departureDate);
  String get initSeats => requestedSeats.toString();
  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(onPressed: swapLocations, icon: Icon(Icons.swap_vert,color: BlaColors.primary,))
            ],
          ),
          // 1 - Leaving from Listtile
          PrefTile(initValue: initDepature, onPressed: onSelectDeparture, icon: Icons.circle_outlined),
          BlaDivider(),
          // 2 - Going to Listtile
          PrefTile(initValue: initArrival, onPressed: onSelectArrival, icon: Icons.circle_outlined),
          BlaDivider(),
          // 3 - Select date Listtile, default today
          PrefTile(initValue:  initDepartureDate,onPressed: onSelectDepartureDate, icon: Icons.calendar_today_rounded),
          BlaDivider(),
          // 4 - Select seats Listitle, default 1
         PrefTile(initValue: initSeats , onPressed: onSelectSeats, icon: Icons.person),

          BlaButton(
              type: ButtonType.primary,
              text: "Search",
              onPressed: onSearch)
        ]);
  }
}


class PrefTile extends StatelessWidget {
  // this field can be create with or without the initialize value
  final String initValue;
  final IconData icon;
  final VoidCallback onPressed;

  const PrefTile({super.key,required this.initValue , required this.onPressed,required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.calendar_today_rounded, size: 16, color: BlaColors.neutral,),
      title: Text(initValue,style: BlaTextStyles.button.copyWith(color:BlaColors.neutral, ),),
     onTap: onPressed
    );
  }
}