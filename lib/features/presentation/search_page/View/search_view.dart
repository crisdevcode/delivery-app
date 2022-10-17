import 'package:flutter/material.dart';
import 'package:delivery/colors/colors.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_text.dart';
import 'package:delivery/features/presentation/common_widgets/Headers/header_double.dart';
import 'package:delivery/features/presentation/common_widgets/Cards/populares_card.dart';
import 'package:delivery/features/presentation/common_widgets/Cards/card_vertical.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.black,
                size: 40.0,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20.0),
                      alignment: Alignment.centerLeft,
                      child: headerText(
                          text: 'Buscar', color: Colors.black, fontSize: 30.0),
                    ),
                    _searchInput(context),
                    const SizedBox(height: 40.0),
                    headerDoubleText(
                        textHeader: 'Busquedas recientes',
                        textAction: "Borrar todo"),
                    _sliderRecentSearch(),
                    const SizedBox(height: 20.0),
                    headerDoubleText(
                        textHeader: "Recomendado para ti", textAction: ""),
                    const SizedBox(height: 20.0),
                    popularesCard(
                        context: context,
                        image: const NetworkImage(
                            "https://images.unsplash.com/photo-1606502973842-f64bc2785fe5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80"),
                        title: "Broaster King",
                        subtitle: "Cr 7 #12-13, Ipiales",
                        review: "4.8",
                        rating: "(233 opiniones)",
                        buttonText: "Domicilio",
                        hasActionButton: false),
                  ],
                ))
          ]))
        ],
      ),
    );
  }
}

Widget _searchInput(BuildContext context) {
  return Container(
    height: 42.0,
    margin: const EdgeInsets.only(top: 20.0),
    padding: const EdgeInsets.only(left: 5.0),
    decoration: BoxDecoration(
        color: const Color.fromRGBO(142, 142, 147, 1.2),
        borderRadius: BorderRadius.circular(20.0)),
    child: const TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 5.0),
          prefixIcon: Icon(Icons.search, color: colorGray),
          hintText: 'Buscar',
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    ),
  );
}

Widget _sliderRecentSearch() {
  return Container(
    margin: const EdgeInsets.only(top: 5.0),
    width: double.infinity,
    height: 190.0,
    // color: Colors.red,
    child: ListView.builder(
      itemCount: 4,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return cardVertical(
            context: context,
            width: 160.0,
            height: 120.0,
            image: const NetworkImage(
                'https://images.unsplash.com/photo-1632158929962-a929c9e87570?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80'),
            title: "Press Burger",
            subtitle: "Carrera 6 #1632");
      },
    ),
  );
}
