import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/Buttons/rounded_button.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:flutter/material.dart';

class ListOrderView extends StatelessWidget {
  const ListOrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorGray,
      appBar: AppBar(
        elevation: 0.5,
        leading: const Text(''),
        backgroundColor: colorWhite,
        title: headerText(
            text: 'Orders',
            color: colorPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate(const <Widget>[
            ListOrderCard(),
            ListOrderCard(),
            ListOrderCard()
          ]))
        ],
      ),
    );
  }
}

class ListOrderCard extends StatelessWidget {
  const ListOrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromRGBO(248, 248, 248, 1.0),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(210, 211, 215, 1.0),
                spreadRadius: 1.0,
                blurRadius: 4.0)
          ]),
      child: Column(
        children: <Widget>[
          const ListCardOrderHeader(),
          const ListCardOrderItem(),
          const SizedBox(height: 10),
          headerText(
              text: 'Ver pedido',
              fontSize: 17,
              color: colorPink,
              fontWeight: FontWeight.w400),
          roundedButton(
            labelButton: 'Pedir de nuevo',
            color: colorOrange,
            func: () {},
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ListCardOrderHeader extends StatelessWidget {
  const ListCardOrderHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                            top: 7.0, bottom: 7.0, right: 20.0),
                        child: headerText(
                            text: "Little Creatures - Club Street",
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, color: colorGray, size: 16.0),
                          headerText(
                              text: "87 Botsford Circle Apt",
                              color: colorGray,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0)
                        ],
                      )),
                    ],
                  ),
                  roundedButton(
                      width: 160,
                      height: 28,
                      // labelColor: Colors.white,
                      labelButton: "Entregado",
                      // labelFontSize: 12,
                      color: Colors.green,
                      // shape: StadiumBorder(),
                      func: () {})
                ],
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    width: 65,
                    height: 74,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1529417305485-480f579e7578?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ListCardOrderItem extends StatelessWidget {
  const ListCardOrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Theme.of(context).dividerColor))),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerText(
                text: '2 products',
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15.0)
          ],
        ),
        trailing: headerText(
            text: '17.20 €',
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0),
      ),
    );
  }
}
