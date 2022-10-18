import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/Cards/favorites_card.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';

class FavoriteTab extends StatefulWidget {
  const FavoriteTab({super.key});

  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgGray,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: const Text(''),
            backgroundColor: colorWhite,
            centerTitle: true,
            title: headerText(
                text: 'Mis favoritos',
                color: colorPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  favoritesCard(
                      marginBotton: 10.0,
                      context: context,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      title: "Andy & Cindy's",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      rating: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavorite: true),
                  favoritesCard(
                      context: context,
                      image: const NetworkImage(
                          'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                      title: "Andy & Cindy's",
                      subtitle: "87 Botsford Circle Apt",
                      review: "4.8",
                      rating: "(233 ratings)",
                      buttonText: 'Delivery',
                      hasActionButton: true,
                      isFavorite: false)
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
