import 'package:flutter/material.dart';
import 'package:uidesign/customs/border_icons.dart';
import 'package:uidesign/sample_data.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/custom_functions.dart';
import 'package:uidesign/utils/widgets_function.dart';

import '../customs/option_button.dart';
import 'DetailPage.dart';

class Landingpage extends StatelessWidget {
  const Landingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    double padding = 25;
    final sidepadding = EdgeInsets.symmetric(horizontal: padding);
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: Size.width,
        height: Size.height,
        child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              addverticalspace(padding),
              Padding(
                padding: sidepadding,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Bordericon(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.menu,
                          color: COLOR_BLACK,
                        ),
                      ),
                      Bordericon(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.settings,
                          color: COLOR_BLACK,
                        ),
                      ),
                    ]),
              ),
              addverticalspace(20),
              Padding(
                padding: sidepadding,
                child: Text(
                  'City',
                  style: themeData.textTheme.bodyText2,
                ),
              ),
              addverticalspace(20),
              Padding(
                padding: sidepadding,
                child: Text(
                  'San Fransico',
                  style: themeData.textTheme.headline1,
                ),
              ),
              Padding(
                padding: sidepadding,
                child: Divider(
                  height: 25,
                  color: COLOR_GREY,
                ),
              ),
              addverticalspace(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: ["<\$220,000", "For Sale", "3-4 Beds", ">1000 sqft"]
                      .map((filtre) => Choiceoption(text: filtre))
                      .toList(),
                ),
              ),
              addverticalspace(10),
              Expanded(
                child: Padding(
                  padding: sidepadding,
                  child: ListView.builder(
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return RealEstateItem(
                          itemdata: RE_DATA[index],
                        );
                      }),
                ),
              )
            ]),
            Positioned(
              bottom: 20,
              width: Size.width,
              child: Center(
                child: optionButton(
                  text: 'Map View',
                  icon: Icons.map_rounded,
                  width: Size.width * 0.35,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Choiceoption extends StatelessWidget {
  final String text;

  const Choiceoption({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: COLOR_GREY.withAlpha(25),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: const EdgeInsets.only(left: 20),
      child: Text(
        text,
        style: themeData.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemdata;

  const RealEstateItem({super.key, required this.itemdata});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailPage(
                  itemdata: itemdata,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.asset(itemdata['image']),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Bordericon(
                    //color: COLOR_BLACK,
                    child: Icon(
                  Icons.favorite_border,
                )),
              ),
            ],
          ),
          addverticalspace(20),
          Row(
            children: [
              Text(
                formatCurrency(itemdata['amount']),
                style: themeData.textTheme.headline1,
              ),
              addhorizontalspace(10),
              Text(
                '${itemdata['address']}',
                style: themeData.textTheme.bodyText2,
              ),
            ],
          ),
          addverticalspace(10),
          Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: Text(
              "${itemdata["bedrooms"]} bedrooms / ${itemdata["bathrooms"]} bathrooms / ${itemdata["area"]} sqft",
              style: themeData.textTheme.headline5,
            ),
          ),
        ]),
      ),
    );
  }
}
