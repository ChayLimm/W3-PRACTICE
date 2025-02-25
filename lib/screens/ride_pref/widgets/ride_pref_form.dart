import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/model/ride/ride.dart';
import 'package:week_3_blabla_project/screens/location_picker/location_picker_screen.dart';
import 'package:week_3_blabla_project/screens/search_ride/search_ride_screen.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import '../../../model/ride/locations.dart';
import '../../../model/ride_pref/ride_pref.dart';

// UI Components
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/button/bla_button.dart';
import 'package:week_3_blabla_project/widgets/display/bla_divider.dart';
import 'package:week_3_blabla_project/widgets/inputs/date_picker_field.dart';
import 'package:week_3_blabla_project/widgets/inputs/location_picker_field.dart';
import 'package:week_3_blabla_project/widgets/inputs/seats_picker_field.dart';

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
  DateTime departureDate = DateTime.now();
  Location? arrival;
  int requestedSeats = 1;

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

  void onSelectArrival(Location location) {
    setState(() {
      arrival = location;
    });
  }

  void onSelectDeparture(Location location) {
    setState(() {
      departure = location;
    });
  }

  void onSelectDepartureDate(DateTime dateTime) {
    setState(() {
      departureDate = dateTime;
      print("function trigger");
    });
  }

  void onSelectPassenger(int passenger) {
    setState(() {
      passenger = passenger;
    });
  }

  // Search button and validor for the form

  void onSearch() async {
    //validate depature, if null show location picker;
    if (departure == null) {
      //show the full screen dialog of select location
      Navigator.of(context)
          .push(AnimationUtils.createBottomToTopRoute(LocationPickerScreen(
        onSelectLocation: onSelectDeparture,
      )));
      //validate arrival, if null show location picker;
    } else if (arrival == null) {
      //show the full screen dialog of select location
      Navigator.of(context)
          .push(AnimationUtils.createBottomToTopRoute(LocationPickerScreen(
        onSelectLocation: onSelectArrival,
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

  // ----------------------------------
  // Build the widgets
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1 - Leaving from Listtile
          LocationPickerField(
            hint: "Leaving from",
            initLocation: departure,
            onSelectLocation: onSelectDeparture,
          ),
          BlaDivider(),
          // 2 - Going to Listtile
          LocationPickerField(
            hint: "Going to",
            initLocation: arrival,
            onSelectLocation: onSelectArrival,
          ),
          BlaDivider(),
          // 3 - Select date Listtile, default today
          DatePickerField(
            initDateTime: departureDate,
            onSelectDate: onSelectDepartureDate,
          ),
          BlaDivider(),
          // 4 - Select seats Listitle, default 1
          SeatPickerField(onSelectSeats: onSelectPassenger),
          const SizedBox(
            height: BlaSpacings.s,
          ),
          BlaButton(
              type: ButtonType.primary,
              title: "Search",
              onButtonClick: onSearch)
        ]);
  }
}
