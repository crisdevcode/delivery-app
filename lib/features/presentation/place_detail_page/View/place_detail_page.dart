import 'package:flutter/material.dart';
// Colors
import 'package:delivery/colors/colors.dart';
//Commons
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_double.dart';
import 'package:delivery/features/presentation/common_widgets/BackButtons/back_button.dart';

class PlaceDetailPage extends StatelessWidget {
  const PlaceDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          backgroundColor: colorOrange,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          label: headerText(
              text: 'Añadir a la Cesta  95.40 €',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 17)),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: colorOrange,
            expandedHeight: 312,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  const Image(
                      width: double.infinity,
                      height: 350,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
                  Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 1.5)),
                      width: double.infinity,
                      height: 350),
                  Wrap(
                    children: [
                      _promoButton(),
                      _infoPlace(),
                      _infoPlaceStats(),
                      // _offerBanner()
                    ],
                  )
                ],
              ),
            ),
            leading: Builder(builder: (BuildContext context) {
              return backButton(context, Colors.white);
            }),
            actions: [
              Container(
                margin: const EdgeInsets.all(10),
                child: const Image(
                    width: 28,
                    height: 28,
                    image: AssetImage('assets/share.png')),
              ),
              IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {})
            ],
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            _headers(text: 'Populars'),
            _sliderCards(),
            _headers(text: 'Full Menu'),
            _menuList(context),
            _headers(text: 'Reviews'),
            _reviews(),
            _headers(text: 'Your Rating'),
            _yourRating(),
            const SizedBox(height: 150.0),
          ]))
        ],
      ),
    );
  }
}

Widget _promoButton() {
  return Container(
    margin: const EdgeInsets.only(top: 121.0, left: 30.0, right: 15.0),
    width: double.infinity,
    height: 25,
    // child: Row(children: [
    // createElevatedButton(color: colorOrange, labelButton: 'Free Delivery')
    // ]),
  );
}

Widget _infoPlace() {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        margin: const EdgeInsets.symmetric(vertical: 7.0),
        child: headerText(
            text: "Boon Lay Ho Huat Fried Prawn Noodle",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30.0),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: colorGray),
            headerText(
                text: "03 Jameson Manors Apt. 177",
                color: colorGray,
                fontWeight: FontWeight.w500,
                fontSize: 15.0),
          ],
        ),
      )
    ],
  );
}

Widget _infoPlaceStats() {
  return Container(
    margin: const EdgeInsets.only(top: 26.0),
    padding: const EdgeInsets.symmetric(horizontal: 40.0),
    height: 70.0,
    decoration: const BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.white),
            bottom: BorderSide(color: Colors.white))),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.star,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  text: '4.5',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                text: "351 Ratings",
                color: colorGray,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.bookmark,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  text: '137k',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                text: "Favourites",
                color: colorGray,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        ),
        Container(
          height: 40,
          decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.white))),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(
                Icons.photo,
                color: Colors.white,
                size: 19.0,
              ),
              headerText(
                  text: '345',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)
            ]),
            headerText(
                text: "Photos",
                color: colorGray,
                fontWeight: FontWeight.w500,
                fontSize: 15.0)
          ],
        )
      ],
    ),
  );
}

Widget _headers({required String text}) {
  return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: headerDoubleText(textHeader: text, textAction: ''));
}

Widget _sliderCards() {
  return Container(
      height: 210.0,
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return _cards();
          }));
}

Widget _cards() {
  return Container(
    margin: const EdgeInsets.all(8.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: const Image(
            width: 200.0,
            height: 100.0,
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60')),
      ),
      Container(
        margin: const EdgeInsets.only(top: 10),
        child: headerText(
            text: "Peanut Chaat with Dahi",
            fontWeight: FontWeight.bold,
            fontSize: 15.0),
      ),
      Container(
        alignment: Alignment.centerLeft,
        child: headerText(
            text: "9.50 €",
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: colorGray),
      ),
      Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: headerText(
                text: "Selecciona",
                fontWeight: FontWeight.w500,
                fontSize: 15.0,
                color: colorOrange),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 90),
            child: const Image(
                width: 20.0,
                height: 20.0,
                fit: BoxFit.cover,
                image: AssetImage('assets/plus_order.png')),
          )
        ],
      )
    ]),
  );
}

Widget _menuList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 10.0),
    child: Column(
      children: [
        _menuItem(context, 'Salads', '2'),
        _menuItem(context, 'Chicken', '5'),
        _menuItem(context, 'Soups', '6'),
        _menuItem(context, 'Vegetables', '7')
      ],
    ),
  );
}

Widget _menuItem(BuildContext context, String text, String itemCount) {
  return Container(
    decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: colorGray))),
    child: Column(
      children: [
        ListTile(
          title: headerText(
              text: text, fontWeight: FontWeight.w300, fontSize: 17.0),
          trailing: headerText(
              text: itemCount, fontWeight: FontWeight.w300, fontSize: 17.0),
        ),
        _sliderCards()
      ],
    ),
  );
}

Widget _reviews() {
  return Container(
    height: 135,
    padding: const EdgeInsets.only(left: 10),
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _cardReviews();
        }),
  );
}

Widget _cardReviews() {
  var lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";

  return Container(
    margin: const EdgeInsets.only(top: 4),
    padding: const EdgeInsets.only(left: 10, right: 10),
    width: 350,
    child: Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: const Image(
                  width: 49.0,
                  height: 43.0,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1614746713986-0afbec40881f?ixid=MXwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNDN8fHxlbnwwfHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerText(
                      text: 'Mike Smithson',
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                  headerText(
                      text: '45 Reviews',
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: colorGray)
                ],
              ),
            ),
            const Spacer(),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: colorOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          text: '4',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              text: lorem,
              color: colorGray,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: headerText(
              text: 'See full review',
              color: colorOrange,
              fontSize: 15,
              fontWeight: FontWeight.w500),
        )
      ],
    ),
  );
}

Widget _yourRating() {
  var lorem =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua";

  return Container(
    margin: const EdgeInsets.only(top: 10),
    padding: const EdgeInsets.only(left: 10, right: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: colorOrangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          text: '1',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: colorOrangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          text: '2',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: colorOrangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          text: '3',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: colorOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          text: '4',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: 60,
                  height: 30,
                  color: colorOrangeWithHalfOpacity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      headerText(
                          text: '5',
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12),
                      const Icon(Icons.star, color: Colors.white, size: 14)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: headerText(
              text: lorem,
              color: colorGray,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.left),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, left: 20),
          child: headerText(
              text: "+ Edit your review", // Esto cuando ya tenga review
              fontWeight: FontWeight.w500,
              fontSize: 15.0,
              color: colorOrange),
        )
      ],
    ),
  );
}
