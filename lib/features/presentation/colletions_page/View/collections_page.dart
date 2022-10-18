import 'package:delivery/features/presentation/common_widgets/BackButtons/back_button.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';

class CollectionsPages extends StatelessWidget {
  const CollectionsPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            title: headerText(text: 'Categorías', fontSize: 17),
            centerTitle: true,
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.black);
            }),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20.0),
            sliver: SliverGrid.count(
              // Amount of Items (cantidad)
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              // Items
              children: <Widget>[
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
                _cardCollectionItem(context),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _cardCollectionItem(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'collections-detail');
    },
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: const Image(
            width: 165,
            height: 190,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
          ),
        ),
        // Shadow on the image
        Container(
          width: 165,
          height: 190,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(0, 0, 0, 1.4),
              borderRadius: BorderRadius.circular(10)),
        ),
        Container(
          alignment: Alignment.center, // div
          margin: const EdgeInsets.only(right: 35.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end, // flex
            children: [
              headerText(
                  text: 'Asia',
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
              headerText(
                  text: '128 restaurantes',
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300)
            ],
          ),
        )
      ],
    ),
  );
}
