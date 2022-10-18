import 'package:delivery/colors/colors.dart';
import 'package:delivery/utils/Styles/BoxShadowDecoration.dart';
import 'package:flutter/material.dart';
//Colors

@immutable
class AvatarView extends StatelessWidget {
  final String backgroundImage;

  const AvatarView({super.key, required this.backgroundImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          width: 142,
          height: 142,
          decoration: getBoxDecorationWithShadows(
              borderRadius: BorderRadius.circular(65)),
          child: CircleAvatar(backgroundImage: NetworkImage(backgroundImage)),
        ),
        Transform.translate(
          offset: const Offset(0, -35),
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: colorPink, borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.camera_alt,
                color: colorWhite,
                size: 20,
              )),
        )
      ],
    );
  }
}
