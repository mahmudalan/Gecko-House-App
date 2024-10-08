
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geckohouse/pages/Page%20Manual%20Book.dart';
import 'package:geckohouse/pages/Page%20Watering.dart';
import 'NavBar.dart';
import 'Page Note.dart';
import 'Page Profile.dart';
import 'Page Suhu.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = [
    Image.asset('lib/assets/celsius.png', color: const Color(0xffd891ef), height: 25),
    Image.asset('lib/assets/write.png', color: const Color(0xffd891ef), height: 25),
    Image.asset('lib/assets/drops.png', color: const Color(0xffd891ef), height: 25),
    Image.asset('lib/assets/lizard.png', color: const Color(0xffd891ef), height: 25),
    Image.asset('lib/assets/book.png', color: const Color(0xffd891ef), height: 25),
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {

    Color UnguMuda = const Color(0xffd891ef);
    Color Pink = const Color(0xffe35bf9);
    Color Taro = const Color(0xffb181ff);
    Color TaroGelap = const Color(0xff6d33b4);

    return Scaffold(
      backgroundColor: Taro,
      drawer: const NavBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: UnguMuda),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.search_outlined))],
        title: Center(
            child: Text('Monitoring Gecko House',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Cheese',
                color: UnguMuda,

              ),
            )
        ),
        backgroundColor: TaroGelap,
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.transparent,
          color: TaroGelap,
          animationDuration: const Duration(milliseconds: 300),
          height: 60,
          buttonBackgroundColor: TaroGelap,
          items: items,
          index: index,
          onTap: (selectedIndex){
            setState(() {
              index = selectedIndex;
            });
          }
      ),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: getSelectedWidget(index: index),
      ),
    );

  }
  Widget getSelectedWidget({required int index}){
    Widget widget;
    switch(index){
      case 0:
        widget = const Suhu();
        break;
      case 1:
        widget = const Note();
        break;
      case 2:
        widget = const Watering ();
        break;
      case 3:
        widget = const Profile();
        break;
      case 4:
        widget = const ManualBook();
      default:
        widget = const Suhu();
        break;
    }
    return widget;
    }
}
