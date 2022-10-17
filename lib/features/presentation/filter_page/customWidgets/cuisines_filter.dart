import 'package:delivery/colors/colors.dart';
import 'package:flutter/material.dart';

class CuisinesFilter extends StatefulWidget {
  const CuisinesFilter({super.key});

  @override
  State<CuisinesFilter> createState() => _CuisinesFilterState();
}

class _CuisinesFilterState extends State<CuisinesFilter> {
  bool btnAmerican = false;
  bool btnAsia = false;
  bool btnSushi = false;
  bool btnPizza = false;

  bool btnDesserts = false;
  bool btnFastFood = false;
  bool btnVietnamese = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => btnAmerican = !btnAmerican);
            }, btnAmerican, "American"),
            _roundedButtonFilter(() {
              setState(() => btnAsia = !btnAsia);
            }, btnAsia, "Asia"),
            _roundedButtonFilter(() {
              setState(() => btnSushi = !btnSushi);
            }, btnSushi, "Sushi"),
            _roundedButtonFilter(() {
              setState(() => btnPizza = !btnPizza);
            }, btnPizza, "Pizza"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _roundedButtonFilter(() {
              setState(() => btnDesserts = !btnDesserts);
            }, btnDesserts, "Desserts"),
            _roundedButtonFilter(() {
              setState(() => btnFastFood = !btnFastFood);
            }, btnFastFood, "FastFood"),
            _roundedButtonFilter(() {
              setState(() => btnVietnamese = !btnVietnamese);
            }, btnVietnamese, "Vietnamese")
          ],
        )
      ],
    );
  }
}

Widget _roundedButtonFilter(Function func, bool isActive, String labelText) {
  return Container(
    //width: 120.0,
    //height: 30.0,
    child: ElevatedButton(
      onPressed: () {
        func();
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, // text
        backgroundColor: Colors.white, // bg
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: BorderSide(color: isActive ? colorOrange : colorGray)),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      child: Text(labelText,
          style: TextStyle(color: isActive ? colorOrange : colorGray)),
    ),
  );
}
