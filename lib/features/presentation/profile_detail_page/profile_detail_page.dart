import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';
import 'package:delivery/utils/Styles/BoxShadowDecoration.dart';
import 'package:delivery/utils/Helpers/ScreenSize/ScreenSizeHelper.dart';
import 'package:delivery/features/presentation/profile_detail_page/components/fields_profile_view.dart';
import 'package:delivery/features/presentation/profile_detail_page/components/avatar_view.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/BackButtons/back_button.dart';

class ProfileDetailPage extends StatefulWidget {
  const ProfileDetailPage({super.key});

  @override
  State<ProfileDetailPage> createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  var backgroundImage =
      'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXZhdGFyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This avoid bottom overflowed keyboard error withot scrollview
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: headerText(text: 'Edit Profile', fontSize: 17),
        backgroundColor: colorWhite,
        elevation: 0.4,
        leading: Builder(
          builder: (BuildContext context) {
            return backButton(context, colorBlack);
          },
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding: const EdgeInsets.only(top: 20, right: 15.0),
                child: headerText(
                    text: 'Done',
                    color: colorOrange,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.0)),
          )
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
                margin: EdgeInsets.only(
                    top: getScreenHeight(context: context, multiplier: 0.1),
                    left: 15,
                    right: 15),
                decoration: getBoxDecorationWithShadows(),
                width: getScreenWidth(context: context),
                //! FIX: delivery Address
                //height: getScreenHeight(context: context, multiplier: 0.66),
                child: Column(
                  children: [
                    Transform.translate(
                        offset: const Offset(0, -60),
                        child: AvatarView(backgroundImage: backgroundImage)),
                    const FieldsProfileView()
                  ],
                ))
          ]))
        ],
      ),
    );
  }
}
