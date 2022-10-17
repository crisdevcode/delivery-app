import 'package:delivery/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/Cards/favorites_card.dart';
import 'package:delivery/features/presentation/common_widgets/BackButtons/back_button.dart';

class CollectionDetailPage extends StatelessWidget {
  const CollectionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 230.0,
            backgroundColor: colorOrange,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 0, 0, 1.3),
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Center(
                    child: headerText(
                        text: 'Restaurantes \n Asiáticos',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        textAlign: TextAlign.center),
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    child: headerText(
                        text: '128 restaurantes',
                        color: const Color.fromRGBO(51, 58, 77, 1.0),
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                  Column(
                    children: [
                      favoritesCard(
                          marginBotton: 10.0,
                          context: context,
                          image: const NetworkImage(
                              "https://images.unsplash.com/photo-1606502973842-f64bc2785fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
                          title: "Broaster King",
                          subtitle: "Cr 7 #12-13, Ipiales",
                          review: "4.8",
                          rating: "(233 ratings)",
                          buttonText: "Delivery",
                          hasActionButton: true,
                          isFavorite: true),
                      favoritesCard(
                          context: context,
                          image: const NetworkImage(
                              "https://images.unsplash.com/photo-1606502973842-f64bc2785fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
                          title: "Broaster King",
                          subtitle: "Cr 7 #12-13, Ipiales",
                          review: "4.8",
                          rating: "(233 ratings)",
                          buttonText: "Delivery",
                          hasActionButton: true,
                          isFavorite: false),
                    ],
                  )
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }
}
