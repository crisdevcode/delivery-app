import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';

class PriceFilter extends StatefulWidget {
  const PriceFilter({super.key});

  @override
  State<PriceFilter> createState() => _PriceFilterState();
}

class _PriceFilterState extends State<PriceFilter> {
  RangeValues _values = const RangeValues(0.3, 1.0);
  int _minPrice = 0;
  int _maxPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('$_minPrice USD', style: const TextStyle(fontSize: 16)),
        Container(
          width: 250,
          child: RangeSlider(
            activeColor: colorOrange,
            inactiveColor: colorGray,
            values: _values,
            min: 0,
            max: 100.0,
            onChanged: (RangeValues newValues) {
              setState(() {
                _values = newValues;
                _minPrice = _values.start.round();
                _maxPrice = _values.end.round();
              });
            },
          ),
        ),
        Text(
          '$_maxPrice USD',
          style: const TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
