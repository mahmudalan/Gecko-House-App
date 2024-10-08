import 'package:firebase_database/firebase_database.dart';
final database = FirebaseDatabase.instance.ref();
final dataSuhu = database.child('dataSuhu');
final kelembaban = database.child('kelembaban');
final semprot = database.child('semprot');