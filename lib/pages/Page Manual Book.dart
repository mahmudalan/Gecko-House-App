import 'package:flutter/material.dart';

class ManualBook extends StatefulWidget {
  const ManualBook({super.key});

  @override
  State<ManualBook> createState() => _ManualBookState();
}

class _ManualBookState extends State<ManualBook> {
  @override
  Widget build(BuildContext context) {
    Color unguTua = const Color(0xff660066);
    Color unguMuda = const Color(0xffd891ef);
    Color pink = const Color(0xffe35bf9);
    Color taro = const Color(0xffb181ff);
    Color taroGelap = const Color(0xff6d33b4);

    return Container(
      color: taro,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          Container(
            height: 120,
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage('lib/assets/floflo.jpg'), // Replace with your background image path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                      colors: [taroGelap.withOpacity(1), taroGelap.withOpacity(0.7)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Manual Book',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Cheese'),
                      ),
                      Text(
                        'Gecko House',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Cheese'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ManualBookSection(
            title: 'Bagaimana cara memakai kandang',
            description:
            'Pada kandang sudah terdapat sensor DHT11, ESP32Cam, penyemprot, microcontroller Node MCU ESP8266, relay, dan stepdown. '
                'Untuk cara pakai alat hanya berfokus pada stepdown karena terdapat colokan untuk adaptor 12V, jadi cara pakai pada alat ini cukup '
                'menghubungkan adaptor 12V ke stepdown dan semua komponen pada kandang akan berjalan.',
            borderColor: unguTua,
          ),
          ManualBookSection(
            title: 'Cara cara membersihkan kandang',
            description:
            'Kandang dibuat menggunakan 100% plastik akrilik, sehingga alas pada kandang cukup menggunakan tissue atau kertas, saat kondisi '
                'tissue atau kertas sudah kotor atau kondisi kandang sudah memiliki bau maka cukup mengganti kertas atau tissue dengan yang baru dan '
                'jangan lupa untuk membasahi sedikit karena gecko hidup ditempat lembab, selanjutnya untuk dinding dan atap cukup di lap saja karena '
                'kemungkinan kotor karena terkena sentuhan tangan atau embun dari air yang membuat akrilik menjadi sedikit buram.',
            borderColor: unguTua,
          ),
          ManualBookSection(
            title: 'Bagaimana cara merawat gecko',
            description:
            'Perawatan gecko tidak terlalu sulit, cukup mengatur pola makan gecko dan menjaga kebersihan kandang, serta menjaga kelembaban dan '
                'suhu kandang.\n\n• Pola makan gecko\nPola makan pada gecko bergantung pada usia gecko. Ketika kondisi gecko masih anakan (6-12 bulan '
                'kebawah) penggunaan pakan cukup jangkrik ukuran kecil/sedang 2 atau 3 ekor setiap 2 atau 3 hari sekali.\nUntuk pola makan gecko dewasa '
                '(12 bulan keatas) penggunaan pakan 3 atau 4 jangkrik besar setiap 2 atau 3 hari sekali.\nPenggunaan nutrisi juga penting untuk mendukung '
                'tumbuh kembang dan daya tahan gecko berupa kalsium dan vitamin D3 untuk mencegah penyakit tulang metabolik.',
            borderColor: unguTua,
          ),
          ManualBookSection(
            title: 'Bagaimana cara alat bekerja',
            description:
            'Pada kandang sudah terdapat sensor DHT11, ESP32Cam, penyemprot, microcontroller Node MCU ESP8266, relay, dan stepdown. Disaat adaptor '
                'sudah terhubung maka secara otomatis ESP32Cam akan memotret kondisi sekitar kandang dan mengirimkannya melalui aplikasi telegram dan '
                'proses ini akan terus mengulang setiap 3 menit sekali, sehingga pengguna bisa memantau kondisi gecko lebih cepat. Sensor DHT11 akan '
                'terus menerus mengupdate kondisi suhu dan kelembaban kandang dan mengirimkannya ke database dan aplikasi android (flutter), disaat '
                'kondisi suhu diatas 34 derajat Celsius maka penyemprot kan otomatis aktif selama 5 detik untuk membuat suhu kembali lembab. Selain '
                'penyemprotan otomatis, penyemprotan bisa dilakukan secara manual Dimana cukup click tombol yang sudah tersedia pada aplikasi flutter. '
                'Selain untuk update suhu dan penyemprotan, aplikasi flutter terdapat to do list untuk mencatat kapan pengguna memberi makan dan jumlah '
                'jangkrik serta to do list untuk mencatat kapan penyemprotan manual dilakukan.',
            borderColor: unguTua,
          ),
          ManualBookSection(
            title: 'Bagaimana menjaga kelembaban dan suhu pada kandang',
            description:
            'Untuk memantau apakah suhu kandang lembab atau kering pengguna cukup melihat pada aplikasi flutter, jika kondisi cukup kering antara '
                '25-30 derajat Celsius maka kondisi ini sudah terbilang aman untuk gecko. Jika kondisi kandang >34 derajat Celsius maka penyemprot akan '
                'otomatis menyiramkan air, dan jika pengguna ingin menyemprot secara manual bisa dilakukan melalui aplikasi android.',
            borderColor: unguTua,
          ),
        ],
      ),
    );
  }
}

class ManualBookSection extends StatelessWidget {
  final String title;
  final String description;
  final Color borderColor;

  const ManualBookSection({
    required this.title,
    required this.description,
    required this.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: borderColor,
              fontFamily: 'Magnisa'
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Magnisa', fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
