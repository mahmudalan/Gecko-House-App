import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../services/realtime_db.dart';

class Suhu extends StatefulWidget {
  const Suhu({super.key});

  @override
  State<Suhu> createState() => _SuhuState();
}

class _SuhuState extends State<Suhu> {
  dynamic nilaiSuhu;
  dynamic nilaiKelembaban;
  bool isLoading = true;

  Color UnguTua = const Color(0xff660066);
  Color UnguMuda = const Color(0xffd891ef);
  Color Pink = const Color(0xffe35bf9);
  Color Taro = const Color(0xffb181ff);
  Color TaroGelap = const Color(0xff6d33b4);

  @override
  void initState() {
    super.initState();

    dataSuhu.onValue.listen((event) {
      final getdataSuhu = event.snapshot;
      setState(() {
        nilaiSuhu = getdataSuhu.value;
        isLoading = false;
      });
    });

    kelembaban.onValue.listen((event) {
      final getkelembaban = event.snapshot;
      setState(() {
        nilaiKelembaban = getkelembaban.value;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String statusSuhu;
    String statusKelembaban;
    String animationFileKelembaban;
    String animationFileSuhu;

    if (nilaiSuhu != null) {
      if (nilaiSuhu <= 34) {
        statusSuhu = 'Sejuk';
        animationFileSuhu = 'lib/assets/dingin.json';
      } else {
        statusSuhu = 'Panas';
        animationFileSuhu = 'lib/assets/panas.json';
      }
    } else {
      statusSuhu = 'Loading';
      animationFileSuhu = 'lib/assets/loading.json';
    }

    if (nilaiKelembaban != null) {
      if (nilaiKelembaban <= 60) {
        statusKelembaban = 'Kering';
        animationFileKelembaban = 'lib/assets/kering.json';
      } else {
        statusKelembaban = 'Lembab';
        animationFileKelembaban = 'lib/assets/lembab.json';
      }
    } else {
      statusKelembaban = 'Loading';
      animationFileKelembaban = 'lib/assets/loading.json';
    }

    return Scaffold(
      backgroundColor: Taro,
      body: isLoading
          ? Center(
        child: Lottie.asset('lib/assets/loading.json'),
      )
          : Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: TaroGelap,
                border: Border.all(color: TaroGelap, width: 2),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Taro,
                          border: Border.all(color: TaroGelap, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Monitoring',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            fontFamily: 'Magnisa'),
                          ),
                          Text(
                            'Suhu',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, fontFamily: 'Magnisa'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 145,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Taro,
                          border: Border.all(color: TaroGelap, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 15, right: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SleekCircularSlider(
                            appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(),
                              animationEnabled: true,
                              size: 130,
                              startAngle: 150,
                              angleRange: 240,
                              customColors: CustomSliderColors(
                                  progressBarColor: UnguTua,
                                  dotColor: Pink,
                                  trackColor: TaroGelap,
                                  shadowColor: Pink),
                              infoProperties: InfoProperties(
                                topLabelStyle:
                                const TextStyle(color: Colors.white),
                                topLabelText: 'Suhu',
                                mainLabelStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontFamily: 'Magnisa'),
                                modifier: (double value) {
                                  nilaiSuhu = value;
                                  return '$value C';
                                },
                              ),
                            ),
                            min: 0,
                            max: 50,
                            initialValue: nilaiSuhu.toDouble(),
                            onChange: null,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  height: 205,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Taro,
                      border: Border.all(color: TaroGelap, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(
                      top: 10, right: 15, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Lottie.asset(animationFileSuhu, height: 130),
                      const Text(
                        'Status :',
                        style: TextStyle(color: Colors.white, fontFamily: 'Magnisa', fontWeight: FontWeight.bold),
                      ),
                      Text(
                        statusSuhu,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white, fontFamily: 'Magnisa'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 130,
            decoration: BoxDecoration(
                border: Border.all(color: TaroGelap, width: 2),
                borderRadius: BorderRadius.circular(20)),
            margin:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Make Your Pet',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold, fontFamily: 'Cheese'),
                    ),
                    Text(
                      'Stay Comfy!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold, fontFamily: 'Cheese'),
                    ),
                  ],
                ),
                Image.asset(
                  'lib/assets/gecko.png',
                  height: 100,
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: TaroGelap,
                border: Border.all(color: TaroGelap, width: 2),
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Container(
                  height: 205,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Taro,
                      border: Border.all(color: TaroGelap, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.only(
                      left: 15, top: 10, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Lottie.asset(animationFileKelembaban, height: 130),
                      const Text(
                        'Status :',
                        style: TextStyle(color: Colors.white, fontFamily: 'Magnisa'),
                      ),
                      Text(
                        statusKelembaban,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white, fontFamily: 'Magnisa'),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 50,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Taro,
                          border: Border.all(color: TaroGelap, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Monitoring',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, fontFamily: 'Magnisa'),
                          ),
                          Text(
                            'Kelembaban',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, fontFamily: 'Magnisa'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 145,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Taro,
                          border: Border.all(color: TaroGelap, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 15, right: 15),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          SleekCircularSlider(
                            appearance: CircularSliderAppearance(
                              customWidths: CustomSliderWidths(),
                              animationEnabled: true,
                              size: 130,
                              startAngle: 150,
                              angleRange: 240,
                              customColors: CustomSliderColors(
                                  progressBarColor: UnguTua,
                                  dotColor: Pink,
                                  trackColor: TaroGelap,
                                  shadowColor: Pink),
                              infoProperties: InfoProperties(
                                topLabelStyle:
                                TextStyle(color: Colors.white),
                                topLabelText: 'Kelembaban',
                                mainLabelStyle: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white, fontFamily: 'Magnisa'),
                                modifier: (double value) {
                                  nilaiKelembaban = value;
                                  return '$value %';
                                },
                              ),
                            ),
                            min: 0,
                            max: 100,
                            initialValue: nilaiKelembaban.toDouble(),
                            onChange: null,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
