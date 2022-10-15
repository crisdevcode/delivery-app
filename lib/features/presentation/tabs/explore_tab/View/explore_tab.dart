import 'package:flutter/material.dart';
// Colors
import 'package:delivery/colors/colors.dart';
// Swiper
//! FIX
// import 'package:flutter_swiper/flutter_swiper.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  // Search - Filter
                  _topBar(context),
                  // Discover restaurants
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    alignment: Alignment.centerLeft,
                    child: const Text('Descubre nuevos lugares',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 27.0)),
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

Widget _topBar(BuildContext context) {
  return Row(
    children: [
      // Search box
      Container(
        width: 320.0,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(left: 8.0, top: 15.0),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(234, 236, 239, 1.0)),
            borderRadius: BorderRadius.circular(20.0)),
        child: Row(
          children: <Widget>[
            const Icon(Icons.search, size: 20.0, color: colorGray),
            Container(
              margin: const EdgeInsets.only(left: 5.0),
              child: const Text(
                'Buscar',
                style: TextStyle(color: colorGray, fontSize: 17.0),
              ),
            )
          ],
        ),
      ),
      // Filter box-icon
      Container(
        width: 45.0,
        height: 45.0,
        margin: const EdgeInsets.only(left: 10, top: 15.0),
        decoration: BoxDecoration(
            color: const Color.fromRGBO(209, 209, 214, 1.0),
            borderRadius: BorderRadius.circular(30)),
        child: IconButton(
          icon: const Icon(Icons.filter_list, size: 30, color: Colors.white),
          onPressed: () {},
        ),
      ),
      // Slider Restaurants
      //! FIX
      // _sliderCards()
    ],
  );
}
//! FIX
/*
Widget _sliderCards() {
  return Container(
      height: 350.0,
      child: Swiper(
          itemCount: 4,
          layout: SwiperLayout.DEFAULT,
          itemBuilder: (BuildContext context, int index) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return _card(context);
              },
            );
          }));
}

Widget _card(BuildContext context) {
  return Container(
    child: Column(
      children: const <Widget>[
        ClipRRect(
          child: Image(
            width: 200.0,
            height: 250.0,
            fit: BoxFit.cover,
            image: NetworkImage('https://images.unsplash.com/photo-1619096252214-ef06c45683e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'),
          ),
        )
      ],
    ),
  );
}
*/