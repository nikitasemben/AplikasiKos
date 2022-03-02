import 'package:aplikasikos/models/tips.dart';
import 'package:aplikasikos/provider/space_provider.dart';
import 'package:aplikasikos/widgets/btn_navbar.dart';
import 'package:provider/provider.dart';
import '../widgets/tips_cards.dart';
import 'package:aplikasikos/theme.dart';
import 'package:aplikasikos/widgets/city_card.dart';
import 'package:aplikasikos/widgets/space_card.dart';
import 'package:flutter/material.dart';

import '../models/city.dart';
import '../models/Space.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            SizedBox(
              height: edge,
            ),
            // NOTE: TITLE/HEADER
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Mencari kosan yang cozy',
                style: grayTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE: POPULAR CITIES
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 24,
                  ),
                 cityCard(
                    City(
                      id: 1,
                      name: 'Jakarta',
                      imageUrl: 'assets/images/city1.png',
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 2,
                      name: 'Bandung',
                      imageUrl: 'assets/images/city2.png',
                      isPopuler: true,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  cityCard(
                    City(
                      id: 3,
                      name: 'Surabaya',
                      imageUrl: 'assets/images/city3.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  cityCard(
                    City(
                      id: 4,
                      name: 'Palembang',
                      imageUrl: 'assets/images/city4.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  cityCard(
                    City(
                      id: 5,
                      name: 'Aceh',
                      imageUrl: 'assets/images/city5.png',
                      isPopuler: true,
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  cityCard(
                    City(
                      id: 6,
                      name: 'Bogor',
                      imageUrl: 'assets/images/city6.png',
                    ),
                  ),
                  SizedBox(
                    width: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // NOTE : RECOMMENDED SPACE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Rekomended Space',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;

                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(
                            top: index == 1 ? 0 : 30,
                           ),
                           child: SpaceCard(item),
                         );
                       }).toList(),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
            //NOTE: TIPS & GUIDANCE
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Tips & Guidance',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
              ),
              child: Column(
                children: [
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'City Guidelines',
                      imageurl: 'assets/images/tips1.png',
                      updateAt: '20 Apr',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TipsCard(
                    Tips(
                      id: 1,
                      title: 'Jakarta Fairship',
                      imageurl: 'assets/images/tips2.png',
                      updateAt: '11 Dec',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70 + edge,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BtnNavbar(
              imgUrl: 'assets/images/Icon_home.png',
              isActive: true,
            ),
            BtnNavbar(
              imgUrl: 'assets/images/icon_mail.png',
              isActive: false,
            ),
            BtnNavbar(
              imgUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BtnNavbar(
              imgUrl: 'assets/images/icon_wish.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}