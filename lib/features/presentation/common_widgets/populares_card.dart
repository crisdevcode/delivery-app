import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';

Widget popularesCard(
    {required BuildContext context,
    double marginTop = 0.0,
    double marginRight = 0.0,
    double marginBotton = 0.0,
    double marginLeft = 10.0,
    required ImageProvider<Object> image,
    required String title,
    required String subtitle,
    required String review,
    required String rating,
    String buttonText = "",
    required bool hasActionButton}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(
            top: marginTop,
            bottom: marginBotton,
            right: marginRight,
            left: marginLeft),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:
                  Image(width: 80, height: 80, fit: BoxFit.cover, image: image),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: Text(title,
                        style: const TextStyle(
                            color: colorPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0)),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: Text(subtitle,
                        style: const TextStyle(
                            color: colorGray,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: colorYellow, size: 16.0),
                      Text(review,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0)),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: Text(rating,
                            style: const TextStyle(
                                color: colorGray,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0)),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        width: 90.0,
                        height: 18.0,
                        child: hasActionButton
                            ? ElevatedButton(
                                onPressed: () {
                                  // Navigator.pushNamed(context, 'tabs');
                                },
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimary, // text
                                  backgroundColor: colorOrange, // bg
                                  shape: const StadiumBorder(),
                                ).copyWith(
                                    elevation:
                                        ButtonStyleButton.allOrNull(0.0)),
                                child: Text(buttonText,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 11.0)),
                              )
                            : const Text(""),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ],
  );
}
