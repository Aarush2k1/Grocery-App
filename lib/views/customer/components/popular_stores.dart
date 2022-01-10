// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:product_io/constants.dart';
import 'package:product_io/models/stores.dart';

class PopularStores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      padding: EdgeInsets.symmetric(vertical: 9),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Text(
                  "Popular Stores",
                  style: TextStyle(
                    color: kBlackColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 4),
            height: 500,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemCount: demoStores.length,
              itemBuilder: (context, index) {
                return StoreCard(
                  store: demoStores[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StoreCard extends StatelessWidget {
  const StoreCard({
    Key? key,
    required this.store,
  }) : super(key: key);

  final Stores store;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            width: double.infinity,
            child: Image.asset(
              store.images[0],
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(
              children: [
                Text(
                  store.title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Positioned(
                  bottom: 2,
                  left: 2,
                  child: Text(
                    store.description,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: 320,
                  child: Text(
                    store.rating.toString(),
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
