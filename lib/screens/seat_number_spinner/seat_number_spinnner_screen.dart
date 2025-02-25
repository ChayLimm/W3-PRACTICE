import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/widgets/button/bla_button.dart';

class SeatNumberSpinnnerScreen extends StatefulWidget {
  // this is onchange function that will call when the number change
  final Function(int) onChange;
  final int? initSeats;
  const SeatNumberSpinnnerScreen(
      {super.key, this.initSeats = 1, required this.onChange});

  @override
  State<SeatNumberSpinnnerScreen> createState() =>
      _SeatNumberSpinnnerScreenState();
}

class _SeatNumberSpinnnerScreenState extends State<SeatNumberSpinnnerScreen> {
  int currentIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = widget.initSeats ?? 1;
  }

  ///
  /// Handle all event

// increase the seat by 1
  void increase() {
    if (currentIndex < 9) {
      setState(() {
        currentIndex++;
      });
    }
  }

// decrease the seat by 1
  void decrease() {
    if (currentIndex > 1) {
      setState(() {
        currentIndex--;
      });
    }
  }

// confirm the change
  void confirm() {
    widget.onChange(currentIndex);
    Navigator.pop(context);
  }

  ///
  /// Build the seats number spinner ui
  /// 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 70, left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Close icon
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      size: 24,
                      color: BlaColors.primary,
                    )),
                //Header
                Text(
                  "Number of seats to book",
                  style:
                      BlaTextStyles.heading.copyWith(color: BlaColors.neutral),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    disabledColor: BlaColors.iconLight,
                    onPressed: currentIndex > 1 ? decrease : null,
                    icon: Icon(
                      Icons.do_not_disturb_on_outlined,
                      size: BlaSpacings.xxl,
                      color: BlaColors.primary,
                    )),
                SizedBox(
                  width: BlaSpacings.s,
                ),
                Text(currentIndex.toString(),
                    style: BlaTextStyles.heading
                        .copyWith(color: BlaColors.neutral, fontSize: 64)),
                SizedBox(
                  width: BlaSpacings.s,
                ),
                IconButton(
                    disabledColor: BlaColors.iconLight,
                    onPressed: currentIndex < 8 ? increase : null,
                    icon: Icon(
                      Icons.add_circle_outline,
                      size: BlaSpacings.xxl,
                      color: BlaColors.primary,
                    )),
              ],
            ),
            Center(
              child: SizedBox(
                  width: 100,
                  height: 44,
                  child: BlaButton(
                      type: ButtonType.primary,
                      title: "Confirm",
                      onButtonClick: confirm)),
            )
          ],
        ),
      ),
    );
  }
}
