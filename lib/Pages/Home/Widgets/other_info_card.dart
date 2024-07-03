import 'package:flutter/material.dart';
import 'package:weather_app/Utils/themes.dart';

class OtherInfoCard extends StatefulWidget {
  const OtherInfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title; // Title of the information card
  final String value; // Value displayed in the card
  final IconData icon; // Icon associated with the information

  @override
  State<OtherInfoCard> createState() => _OtherInfoCardState();
}

class _OtherInfoCardState extends State<OtherInfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115,
      decoration: BoxDecoration(
        // Gradient background
        gradient: const LinearGradient(
          colors: [
            CustomTheme.primaryColor,
            CustomTheme.secondaryColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, top: 25, bottom: 25, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon with white color
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            // Title of the information card
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            // Value displayed in the card
            Text(
              widget.value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
