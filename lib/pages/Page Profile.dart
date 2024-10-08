import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    Color UnguTua = const Color(0xff660066);
    Color UnguMuda = const Color(0xffd891ef);
    Color Pink = const Color(0xffe35bf9);
    Color Taro = const Color(0xffb181ff);
    Color TaroGelap = const Color(0xff6d33b4);

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
                color: TaroGelap, borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Flo-Flo',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Cheese'),
                ),
                ClipOval(
                  child: Image.asset(
                    'lib/assets/flo1.jpg',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 330,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: TaroGelap, width: 2)),
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '   About My Gecko',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white, fontFamily: 'Magnisa'),
                ),
                Text(
                  '   Type       : Snow Raptor',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa', fontWeight: FontWeight.bold),
                ),
                Text(
                  '   Birth       : 4 May 2024 (2 month y.o)',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa', fontWeight: FontWeight.bold),
                ),
                Text(
                  '   Gender   : Unsex',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa',fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: const Text(
              '      Flo-flo love to walk around its house and 24 hours smiling. Eat crickets (headless and no feet) probably 2 or 3 crickets in 2 or 3 days depends the size of the crickets.',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Magnisa'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: const Text(
              '      The color hasn’t show yet, but owner pretty sure it color will be beautiful when it old enough, but for current the color is mixed pink, orange, yellow and dominant white on the tail.',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Magnisa'),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15,),
            child: const Text(
              '      flo-flo still alone, because owner adopted only one hehe well expensive are the reason. maybe someday owner will adopt new one to be it friends! But still have to wait until the gender already showen.',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Magnisa'),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
            child: const Text(
              'Flo-flo’s owner',
              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Magnisa'),
            ),
          )
        ],
      ),
    );
  }
}
