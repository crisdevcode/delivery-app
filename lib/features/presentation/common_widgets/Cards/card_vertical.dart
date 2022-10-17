import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';

Widget cardVertical({
  BuildContext? context,
  required double width,
  required double height,
  required ImageProvider<Object> image,
  required String title,
  required String subtitle,
}) {
  return Container(
    margin: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              width: width,
              height: height,
              placeholder: const NetworkImage(
                  'https://images.unsplash.com/photo-1632158929962-a929c9e87570?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: headerText(
                  text: title, fontWeight: FontWeight.w500, fontSize: 17.0),
            ),
            Container(
              margin: const EdgeInsets.only(top: 2.0),
              child: headerText(
                  text: subtitle,
                  color: colorGray,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.0),
            )
          ],
        )
      ],
    ),
  );
}
