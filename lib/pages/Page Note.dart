import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Note extends StatefulWidget {
  const Note({super.key});

  @override
  State<Note> createState() => _NoteState();
}

class _NoteState extends State<Note> {
  final List<Map<String, dynamic>> _toDoList = List.generate(6, (index) => {'date': null, 'count': ''});
  final List<DateTime?> _wateringSchedule = List.generate(6, (index) => null);

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 6; i++) {
      String? date = prefs.getString('date_$i');
      String? count = prefs.getString('count_$i');
      if (date != null && count != null) {
        setState(() {
          _toDoList[i]['date'] = DateTime.parse(date);
          _toDoList[i]['count'] = count;
        });
      }

      String? wateringDate = prefs.getString('watering_$i');
      if (wateringDate != null) {
        setState(() {
          _wateringSchedule[i] = DateTime.parse(wateringDate);
        });
      }
    }
  }

  Future<void> _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 6; i++) {
      if (_toDoList[i]['date'] != null && _toDoList[i]['count'] != '') {
        prefs.setString('date_$i', (_toDoList[i]['date'] as DateTime).toIso8601String());
        prefs.setString('count_$i', _toDoList[i]['count']);
      }
      if (_wateringSchedule[i] != null) {
        prefs.setString('watering_$i', (_wateringSchedule[i] as DateTime).toIso8601String());
      }
    }
  }

  Future<void> _resetData() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 6; i++) {
      prefs.remove('date_$i');
      prefs.remove('count_$i');
      prefs.remove('watering_$i');
    }
    setState(() {
      for (int i = 0; i < 6; i++) {
        _toDoList[i] = {'date': null, 'count': ''};
        _wateringSchedule[i] = null;
      }
    });
  }

  Future<void> _clearWateringHistory() async {
    final prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 6; i++) {
      prefs.remove('watering_$i');
    }
    setState(() {
      for (int i = 0; i < 6; i++) {
        _wateringSchedule[i] = null;
      }
    });
  }

  void _recordWateringTime(int index) {
    setState(() {
      _wateringSchedule[index] = DateTime.now();
    });
    _saveData();
  }

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
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: TaroGelap,
              border: Border.all(color: TaroGelap,width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: UnguMuda,
                    border: Border.all(color: UnguMuda, width: 2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'To Do List',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              fontFamily: 'Magnisa',
                            ),
                          ),
                          Text(
                            'Jadwal Makan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: 'Magnisa',
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset(
                        'lib/assets/food.json',
                        height: 80,
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < 6; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2101),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _toDoList[i]['date'] = pickedDate;
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Taro,
                                border: Border.all(color: UnguMuda),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                _toDoList[i]['date'] == null
                                    ? 'Atur Tanggal'
                                    : '${_toDoList[i]['date'].day}/${_toDoList[i]['date'].month}/${_toDoList[i]['date'].year}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'Cheese'
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Taro,
                              border: Border.all(color: UnguMuda),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Jumlah Jangkrik',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                    fontFamily: 'Cheese'
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  _toDoList[i]['count'] = value;
                                });
                              },
                              controller: TextEditingController(text: _toDoList[i]['count']),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                  fontFamily: 'Cheese'
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: _saveData,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Taro, width: 2),
                        backgroundColor: UnguTua,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Magnisa'),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: _resetData,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Taro, width: 2),
                        backgroundColor: UnguTua,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Magnisa'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: TaroGelap,
              border: Border.all(color: TaroGelap, width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: UnguMuda,
                    border: Border.all(color: UnguMuda, width: 3),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'To Do List',
                            style: TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                                fontFamily: 'Magnisa'
                            ),
                          ),
                          Text(
                            'Jadwal Siram',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                                fontFamily: 'Magnisa'
                            ),
                          ),
                        ],
                      ),
                      Lottie.asset(
                        'lib/assets/water.json',
                        height: 80,
                      ),
                    ],
                  ),
                ),
                for (int i = 0; i < 6; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Taro,
                              border: Border.all(color: UnguMuda),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              _wateringSchedule[i] == null
                                  ? 'Belum Disiram'
                                  : '${_wateringSchedule[i]!.day.toString().padLeft(2, '0')}/${_wateringSchedule[i]!.month.toString().padLeft(2, '0')}/${_wateringSchedule[i]!.year.toString().padLeft(4, '0')} ${_wateringSchedule[i]!.hour.toString().padLeft(2, '0')}:${_wateringSchedule[i]!.minute.toString().padLeft(2, '0')}:${_wateringSchedule[i]!.second.toString().padLeft(2, '0')}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                  fontFamily: 'Cheese'
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.water_drop, color: UnguMuda),
                          onPressed: () => _recordWateringTime(i),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: _clearWateringHistory,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Taro, width: 2),
                    backgroundColor: UnguTua,
                    padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 20),
                  ),
                  child: const Text(
                    'Clear',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Magnisa'),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}