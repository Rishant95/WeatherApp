// Rishant
// Flutter code for a loading screen with shimmer effect
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_app/Utils/themes.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Uses famous shimmer animation which was developed by facebook
    return Shimmer.fromColors(
      baseColor: CustomTheme.backgroundColor,
      highlightColor: CustomTheme.primaryColor,
      child: SingleChildScrollView(
        child: Column(children: [
          //Each container and widget are placeholder that will be used to by shimmer to show animation
          Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const SearchBar(), // Placeholder for a search bar widget
          const SizedBox(height: 20),
          SizedBox(
            height: 130,
            child: ListView.separated(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    height: 130,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
