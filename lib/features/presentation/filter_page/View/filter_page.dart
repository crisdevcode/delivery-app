import 'package:delivery/features/presentation/filter_page/customWidgets/price_filter.dart';
import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/header_text.dart';
import 'package:delivery/features/presentation/filter_page/customWidgets/list_tile_checked.dart';
import 'package:delivery/features/presentation/filter_page/customWidgets/cuisines_filter.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  // SORT BY BOOLEANS
  bool topRated = false;
  bool nearMe = false;
  bool costHighToLow = false;
  bool costLowToHigh = false;
  bool mostPopular = false;
  // FILTER
  bool openNow = false;
  bool creditCards = false;
  bool alcoholServed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
              child: headerText(
                  text: "Cocinas",
                  color: colorGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: const CuisinesFilter()),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 15.0),
              child: headerText(
                  text: "Ordenar por",
                  color: colorGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            _sortByContainer(),
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
              child: headerText(
                  text: "Filtrar por",
                  color: colorGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            _filterContainer(),
            Container(
              alignment: Alignment.centerLeft,
              margin:
                  const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
              child: headerText(
                  text: "Precio",
                  color: colorGray,
                  fontWeight: FontWeight.w600,
                  fontSize: 17.0),
            ),
            const PriceFilter()
          ])),
        ],
      ),
    );
  }

  Widget _sortByContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
              text: 'Mejores valorados',
              isActive: topRated,
              func: () {
                setState(() {
                  topRated = !topRated;
                });
              },
            ),
            ListTileCheck(
              text: 'Cercanos a mí',
              isActive: nearMe,
              func: () {
                setState(() => nearMe = !nearMe);
              },
            ),
            ListTileCheck(
              text: 'Precio: mayor a menor',
              isActive: costHighToLow,
              func: () {
                setState(() => costHighToLow = !costHighToLow);
              },
            ),
            ListTileCheck(
              text: 'Precio: menor a mayor',
              isActive: costLowToHigh,
              func: () {
                setState(() => costLowToHigh = !costLowToHigh);
              },
            ),
            ListTileCheck(
              text: 'Más popular',
              isActive: mostPopular,
              func: () {
                setState(() => mostPopular = !mostPopular);
              },
            ),
          ],
        ));
  }

  Widget _filterContainer() {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            ListTileCheck(
              text: 'Abierto ahora',
              isActive: openNow,
              func: () {
                setState(() {
                  openNow = !openNow;
                });
              },
            ),
            ListTileCheck(
              text: 'Tarjetas de crédito',
              isActive: creditCards,
              func: () {
                setState(() => creditCards = !creditCards);
              },
            ),
            ListTileCheck(
              text: 'Alcohol servido',
              isActive: alcoholServed,
              func: () {
                setState(() => alcoholServed = !alcoholServed);
              },
            ),
          ],
        ));
  }
}

PreferredSizeWidget _appBar(BuildContext context) {
  return AppBar(
    elevation: 0.5,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: headerText(text: 'Filtros', fontWeight: FontWeight.w600),
    leading: Container(
        padding: const EdgeInsets.only(top: 20.0, left: 7.0),
        child: headerText(
            text: 'Reset', fontWeight: FontWeight.w600, fontSize: 16.0)),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: const EdgeInsets.only(top: 20.0, right: 10.0),
          child: headerText(
              text: 'Listo',
              color: colorOrange,
              fontWeight: FontWeight.w500,
              fontSize: 16.0),
        ),
      )
    ],
  );
}
