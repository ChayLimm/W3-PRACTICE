import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          BlaButton(onPressed: () {print("object");},text: "Contact Volodia",icon: Icons.chat_bubble_outline,type: ButtonType.primary,),
          const SizedBox(height: 16,),
          BlaButton(onPressed: () {print("object");},text: "Contact Volodia",icon: Icons.chat_bubble_outline,type: ButtonType.secondary,),
          const SizedBox(height: 16,), 
          BlaButton(onPressed: () {print("object");},text: "Contact Volodia",icon: Icons.chat_bubble_outline,type: ButtonType.tertiary,),
          const SizedBox(height: 16,),     
        ],
      ),
    );
  }
}