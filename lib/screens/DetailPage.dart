import 'package:flutter/material.dart';
import 'package:uidesign/customs/border_icons.dart';
import 'package:uidesign/customs/option_button.dart';
import 'package:uidesign/utils/constants.dart';
import 'package:uidesign/utils/custom_functions.dart';

import '../utils/widgets_function.dart';

class DetailPage extends StatelessWidget {
  final dynamic itemdata;

  const DetailPage({super.key, required this.itemdata});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    final double padding = 25;
    final sidepadding = EdgeInsets.symmetric(horizontal: padding);

    return SafeArea(
        child: Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Image.asset(itemdata['image']),
                  Positioned(
                    width: size.width,
                    top: padding,
                    child: Padding(
                      padding: sidepadding,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Bordericon(
                                  width: 50,
                                  height: 50,
                                  child: Icon(
                                    Icons.keyboard_backspace,
                                    color: COLOR_BLACK,
                                  ))),
                          Bordericon(
                              width: 50,
                              height: 50,
                              child: Icon(
                                Icons.favorite_border_outlined,
                                color: COLOR_BLACK,
                              ))
                        ],
                      ),
                    ),
                  ),
                ]),
                addverticalspace(20),
                Padding(
                  padding: sidepadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatCurrency(itemdata['amount']),
                            style: themeData.textTheme.headline1,
                          ),
                          addverticalspace(5),
                          Padding(
                            padding: sidepadding,
                            child: Text(
                              "\$${itemdata["address"]}",
                              style: themeData.textTheme.subtitle2,
                            ),
                          ),
                        ],
                      ),
                      Bordericon(
                        child: Text(
                          '20 Hours Ago',
                          style: themeData.textTheme.headline5,
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                      ),
                    ],
                  ),
                ),
                addverticalspace(padding),
                Padding(
                  padding: sidepadding,
                  child: Text(
                    'House Information',
                    style: themeData.textTheme.headline4,
                  ),
                ),
                addverticalspace(padding),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      InformativeTitle(
                        content: '${itemdata['area']}',
                        name: 'Square Foot',
                      ),
                      InformativeTitle(
                        content: "${itemdata["bedrooms"]}",
                        name: "Bedrooms",
                      ),
                      InformativeTitle(
                        content: "${itemdata["bathrooms"]}",
                        name: "Bathrooms",
                      ),
                      InformativeTitle(
                        content: "${itemdata["garage"]}",
                        name: "Garage",
                      )
                    ],
                  ),
                ),
                addverticalspace(padding),
                Padding(
                  padding: sidepadding,
                  child: Text(
                    itemdata['description'],
                    textAlign: TextAlign.justify,
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
                addverticalspace(100),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            width: size.width,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              optionButton(
                text: "Message",
                icon: Icons.message,
                width: size.width * 0.35,
              ),
              addhorizontalspace(10),
              optionButton(
                text: "Call",
                icon: Icons.call,
                width: size.width * 0.35,
              ),
            ]),
          ),
        ]),
      ),
    ));
  }
}

class InformativeTitle extends StatelessWidget {
  final String content;
  final String name;

  const InformativeTitle(
      {super.key, required this.content, required this.name});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    final double tileSize = size.width * 0.20;
    return Container(
      margin: const EdgeInsets.only(left: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Bordericon(
            width: tileSize,
            height: tileSize,
            child: Text(
              content,
              style: themeData.textTheme.headline3,
            )),
        addverticalspace(15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: themeData.textTheme.headline6,
          ),
        ),
      ]),
    );
  }
}
