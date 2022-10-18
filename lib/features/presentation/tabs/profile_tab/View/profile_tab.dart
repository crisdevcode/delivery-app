import 'package:flutter/material.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:delivery/colors/colors.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
              onTap: () => Navigator.pushNamed(context, 'profile-detail'),
              child: _header()),
          _contentProfile(context)
        ],
      ),
    );
  }
}

extension Widgets on _ProfileTabState {
  Widget _header() {
    return Container(
      height: 250,
      color: colorBgGray,
      padding: const EdgeInsets.all(45),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1598966739654-5e9a252d8c32?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
            radius: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    headerText(
                        text: 'Cameron Cook',
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                    IconButton(
                        icon: const Icon(Icons.chevron_right, color: colorGray),
                        onPressed: () {})
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: const EdgeInsets.only(left: 20.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: colorPink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Row(
                    children: [
                      const Image(
                          image: AssetImage('assets/crown.png'),
                          width: 16,
                          height: 16),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        child: headerText(
                            text: 'VIP Member',
                            color: colorWhite,
                            fontSize: 11),
                      )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _contentProfile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            leading: const Image(
              image: AssetImage('assets/noti.png'),
              width: 29,
              height: 29,
            ),
            title:
                headerText(text: 'Notifications', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/payicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(
                text: 'Payment methods', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/rewardicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(text: 'History', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/promoicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(text: 'Promo Code', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/settingicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(text: 'Settings', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/inviteicon.png'),
              width: 29,
              height: 29,
            ),
            title:
                headerText(text: 'Invite Friends', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/helpicon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(text: 'Help Center', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/abouticon.png'),
              width: 29,
              height: 29,
            ),
            title: headerText(text: 'About us', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
          ),
          ListTile(
            leading: const Image(
              image: AssetImage('assets/logout.png'),
              width: 29,
              height: 29,
            ),
            title:
                headerText(text: 'Cerrar sesión', fontWeight: FontWeight.w400),
            trailing: const Icon(Icons.chevron_right, color: colorGray),
            onTap: () => print('cerrando!'),
          )
        ],
      ),
    );
  }
}
