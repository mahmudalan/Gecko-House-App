import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_database/firebase_database.dart';

import '../services/realtime_db.dart';

class Watering extends StatefulWidget {
  const Watering({super.key});

  @override
  State<Watering> createState() => _WateringState();
}

class _WateringState extends State<Watering> {
  dynamic nilaiSuhu;

  @override
  void initState() {
    super.initState();

    dataSuhu.onValue.listen((event) {
      final getdataSuhu = event.snapshot;
      setState(() {
        nilaiSuhu = getdataSuhu.value;
      });
    });
  }

  Color UnguTua = const Color(0xff660066);
  Color UnguMuda = const Color(0xffd891ef);
  Color Pink = const Color(0xffe35bf9);
  Color Taro = const Color(0xffb181ff);
  Color TaroGelap = const Color(0xff6d33b4);

  bool isManual = false;
  bool isPumpOn = false;
  final DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

  void togglePump() {
    setState(() {
      isPumpOn = !isPumpOn;
      String status = isPumpOn ? 'on' : 'off';
      databaseReference.child('semprot').set(status);
    });
  }

  @override
  Widget build(BuildContext context) {
    String statusSuhu;

    if (nilaiSuhu != null) {
      if (nilaiSuhu <= 34) {
        statusSuhu = 'Berhenti Menyiram';
      } else {
        statusSuhu = 'Menyiram Otomatis';
      }
    } else {
      statusSuhu = 'Loading';
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: TaroGelap,
                border: Border.all(color: TaroGelap, width: 2),
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Taro,
                      border: Border.all(color: TaroGelap, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Penyiraman',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Cheese'),
                          ),
                          Text(
                            'Otomatis',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Cheese'),
                          )
                        ],
                      ),
                      Lottie.asset('lib/assets/watering.json', height: 100)
                    ],
                  ),
                ),
                const Text(
                  'Automatic Mode',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Magnisa'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Mode ini menyiram otomatis jika suhu diatas 34°C',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa'),
                ),
                const SizedBox(height: 20,),
                Text('$nilaiSuhu° C',
                    style: const TextStyle(fontSize: 50, color: Colors.white, fontFamily: 'Cheese')),
                const SizedBox(height: 20,),
                Text('Status : $statusSuhu',style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa'),),
                const SizedBox(height: 10,),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: TaroGelap,
                border: Border.all(color: TaroGelap, width: 2),
                borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Taro,
                      border: Border.all(color: TaroGelap, width: 2),
                      borderRadius: BorderRadius.circular(15)),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        children: [
                          Text(
                            'Penyiraman',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, fontFamily: 'Cheese'),
                          ),
                          Text(
                            'Manual',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, fontFamily: 'Cheese'),
                          )
                        ],
                      ),
                      Lottie.asset('lib/assets/watering.json', height: 100)
                    ],
                  ),
                ),
                const Text(
                  'Manual Mode',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Magnisa'),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Click untuk mengaktifkan pompa secara manual',
                  style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa'),
                ),
                SwitchListTile(
                  title: Text(
                    isManual ? 'Manual Mode' : 'Automatic Mode',
                    style: const TextStyle(color: Colors.white, fontFamily: 'Magnisa', fontWeight: FontWeight.bold),
                  ),
                  value: isManual,
                  onChanged: (value) {
                    setState(() {
                      isManual = value;
                      if (!isManual) {
                        isPumpOn = false;
                        databaseReference.child('semprot').set('off');
                      }
                    });
                  },
                  activeColor: Pink,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[700],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: isManual ? togglePump : null,
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(280, 50),
                    backgroundColor: isPumpOn ? Colors.red : Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    isPumpOn ? 'Turn Off Pump' : 'Turn On Pump',
                    style: const TextStyle(color: Colors.white, fontFamily: 'Magnisa', fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
    );
  }
}
