import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
// Colors
import 'package:delivery/colors/colors.dart';
// Common Widgets
import 'package:delivery/features/presentation/common_widgets/header_text.dart';

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
                      child: headerText('Descubre nuevos lugares', Colors.black,
                          FontWeight.bold, 27.0)),

                  // Slider Restaurant cards
                  _sliderCards(context),
                  // Headers
                  _headers(context, "Populares esta semana", "Ver todo"),
                  // Popular List
                  _popularItem(context,
                      "https://images.unsplash.com/photo-1606502973842-f64bc2785fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
                  _popularItem(context,
                      "https://images.unsplash.com/photo-1467003909585-2f8a72700288?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                  _popularItem(context,
                      "https://images.unsplash.com/photo-1535473895227-bdecb20fb157?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                  const SizedBox(
                    height: 10.0,
                  ),
                  _headers(context, "Colecciones", "Ver todo"),
                  _sliderCollections(),
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
    ],
  );
}

Widget _sliderCards(BuildContext context) {
  // Responsive
  // final size = MediaQuery.of(context).size;

  return Container(
    width: double.infinity,
    height: 350.0,
    // color: Colors.red,
    child: ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, int index) {
        return _card(context);
      },
    ),
  );
}

Widget _card(BuildContext context) {
  return Container(
    // color: Colors.green,
    margin: const EdgeInsets.all(5.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () => {},
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              width: 210.0,
              height: 250.0,
              placeholder: NetworkImage(
                  'https://images.unsplash.com/photo-1619096252214-ef06c45683e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'),
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1619096252214-ef06c45683e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text("QBano",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0)),
            ),
            Container(
              child: const Text("Cl. 24 # 6-127, Ipiales",
                  style: TextStyle(
                      color: colorGray,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.0)),
            ),
            Row(
              children: <Widget>[
                const Icon(Icons.star, color: colorYellow, size: 16),
                const Text("4.8",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.0)),
                Container(
                  width: 85.0,
                  height: 18.0,
                  margin: const EdgeInsets.only(left: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, 'tabs');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor:
                          Theme.of(context).colorScheme.onPrimary, // text
                      backgroundColor: colorOrange, // bg
                      shape: const StadiumBorder(),
                    ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                    child: const Text('Domicilio',
                        style: TextStyle(color: Colors.white, fontSize: 11.0)),
                  ),
                )
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget _headers(BuildContext context, String textHeader, String textAction) {
  return Row(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(textHeader, Colors.black, FontWeight.bold, 20.0),
      ),
      const Spacer(),
      GestureDetector(
        child: Row(
          children: [
            Text(
              textAction,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.0),
            ),
            const Icon(Icons.play_arrow)
          ],
        ),
      )
    ],
  );
}

Widget _popularItem(BuildContext context, String photo) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  image: NetworkImage(photo)),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 7.0),
                    child: headerText(
                        "Broaster King", Colors.black, FontWeight.bold, 17.0),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 5.0),
                    child: const Text("Cr 7 # 12-13, Ipiales",
                        style: TextStyle(
                            color: colorGray,
                            fontWeight: FontWeight.w500,
                            fontSize: 13.0)),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: colorYellow, size: 16.0),
                      const Text("4.5",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0)),
                      Container(
                        margin: const EdgeInsets.only(left: 5.0),
                        child: const Text("230 Opiniones",
                            style: TextStyle(
                                color: colorGray,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.0)),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15.0),
                        width: 110.0,
                        height: 18.0,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, 'tabs');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onPrimary, // text
                            backgroundColor: colorOrange, // bg
                            shape: const StadiumBorder(),
                          ).copyWith(
                              elevation: ButtonStyleButton.allOrNull(0.0)),
                          child: const Text('Domicilio',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 11.0)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    ],
  );
}

Widget _sliderCollections() {
  return Container(
      height: 180.0,
      child: Swiper(
        itemCount: 4,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return _cardCollection(context);
            },
          );
        },
      ));
}

Widget _cardCollection(BuildContext context) {
  return Container(
    margin: const EdgeInsets.all(10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const Image(
            width: 300,
            height: 150,
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://images.unsplash.com/photo-1567620905732-2d1ec7ab7445?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=780&q=80"),
          ),
        )
      ],
    ),
  );
}
