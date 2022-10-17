import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';

Widget favoritesCard(
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
    required bool hasActionButton,
    bool isFavorite = true}) {
  return Container(
    margin: EdgeInsets.only(
        top: marginTop,
        right: marginRight,
        bottom: marginBotton,
        left: marginLeft),
    padding: const EdgeInsets.only(left: 10, top: 20.0, bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: const <BoxShadow>[
          BoxShadow(
              color: Color.fromRGBO(210, 211, 215, 1.0),
              offset: Offset(0, 5),
              blurRadius: 10.0)
        ]),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child:
              Image(width: 90.0, height: 90.0, fit: BoxFit.cover, image: image),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: headerText(
                        text: title,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      size: 35.0,
                      color: isFavorite ? colorPink : Colors.grey[300],
                    ),
                  )
                ],
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 5.0),
                  child: headerText(
                      text: subtitle,
                      color: colorGray,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
              Row(
                children: [
                  const Icon(Icons.star, color: colorYellow, size: 16.0),
                  headerText(
                      text: review,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
                  headerText(
                      text: rating,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0),
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
                                elevation: ButtonStyleButton.allOrNull(0.0)),
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
  );
}
