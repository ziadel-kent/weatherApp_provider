import 'package:flutter/material.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0f172a),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(1),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 110,
              backgroundImage: AssetImage('assets/images/ziad_mohammed.jpeg'),
            ),
          ),
          Text(
            'Ziad mohamed',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: 'Pacifico',
            ),
          ),
          Text(
            'Flutter Developer',
            style: TextStyle(
              color: Colors.cyanAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(thickness: .5, indent: 40, endIndent: 40),
          CustomCard(
            text: Text('(+20) 13465431'),
            icon: Icons.mail,

            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(8),
            // ),
            // color: Colors.white,
            // margin: EdgeInsets.all(8),
            // child: ListTile(
            //   leading: Icon(Icons.phone, size: 34),
            //   title: Text('(+20) 13465431'),
            // ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
              ),
              height: 60,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19, right: 30.0),
                    child: Icon(
                      Icons.phone,
                      size: 35,
                      color: Color(0xff0f172a),
                    ),
                  ),
                  Text('(+20) 13465431', style: TextStyle(fontSize: 24)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.white,
              ),
              height: 60,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 19, right: 30.0),
                    child: Icon(Icons.mail, size: 35, color: Color(0xff0f172a)),
                  ),
                  Flexible(
                    //for overflowed error
                    child: Text(
                      'ziad@gmail.com',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final Text text;
  final IconData icon;
  const CustomCard({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.all(8),
      child: ListTile(leading: Icon(icon, size: 34), title: text),
    );
  }
}
