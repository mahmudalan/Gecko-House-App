import 'package:flutter/material.dart';

import 'homepage.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    Color UnguTua = const Color(0xff660066);
    Color UnguMuda = const Color(0xffd891ef);
    Color Pink = const Color(0xffe35bf9);
    Color Taro = const Color(0xffb181ff);
    Color TaroGelap = const Color(0xff6d33b4);

    return Drawer(
      backgroundColor: Taro,
      width: 280,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                color: UnguTua,
                image: const DecorationImage(
                    image: AssetImage('lib/assets/wallpaper.jpg'),fit: BoxFit.cover)
            ),
            accountName: const Text('Ajizul Anwa Rizki',style: TextStyle(fontWeight: FontWeight.bold),),
            accountEmail: const Text('ajizul11995@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset('lib/assets/profil.jpg',),
              ),
            ),
          ),
          ListTile(
            leading: Image.asset('lib/assets/dashboard.png',height: 25, color: UnguTua,),
            title: const Text('Dashboard',
              style: TextStyle(
                  fontFamily: 'Magnisa',
                  color: Colors.white,
                  fontSize: 18
              ),),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyHomePage()));
            },
          ),
          ListTile(
            leading: Image.asset('lib/assets/user.png',height: 25,color: UnguTua),
            title: const Text('Profile',
              style: TextStyle(
                  fontFamily: 'Magnisa',
                  color: Colors.white,
                  fontSize: 18
              ),),
            onTap: (){},
          ),
          const Divider(
            //color: Color(0xff747264),
            height: 10,
            endIndent: 20,
            indent: 10,
          ),
          ListTile(
            leading: Image.asset('lib/assets/settings.png',height: 25,color: UnguTua),
            title: const Text('Settings',
              style: TextStyle(
                  fontFamily: 'Magnisa',
                  color: Colors.white,
                  fontSize: 18
              ),),
            onTap: (){},
          ),
          ListTile(
            leading: Image.asset('lib/assets/message.png',height: 25,color: UnguTua),
            title: const Text('Contact Us',
              style: TextStyle(
                  fontFamily: 'Magnisa',
                  color: Colors.white,
                  fontSize: 18
              ),),
            onTap: (){},
          ),
          ListTile(
            leading: Image.asset('lib/assets/help.png',height: 25,color: UnguTua),
            title: const Text('Help',
              style: TextStyle(
                  fontFamily: 'Magnisa',
                  color: Colors.white,
                  fontSize: 18
              ),),
            onTap: (){},
          ),
          ListTile(
            leading: Image.asset('lib/assets/logout.png',height: 25,color: UnguTua),
            title: const Text('Sign Out',
              style: TextStyle(
                  fontFamily: 'Magnisa',
                  color: Colors.white,
                  fontSize: 18
              ),),
            onTap: (){},
          ),
          const Divider(
            height: 10,
            endIndent: 20,
            indent: 10,
          ),
          const Center(
            child: Text('©Ajizul Anwa Rizki | 2024 | v1.0.0', style: TextStyle(color: Colors.white, fontFamily: 'Cheese', fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}

