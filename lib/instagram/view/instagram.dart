import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../componentes/time_line.dart';

class Instagram extends StatefulWidget {
  const Instagram({super.key});

  @override
  State<Instagram> createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(226, 246, 246, 246),
        title: const Padding(
          padding: EdgeInsets.only(left: 5),
          child: Text(
            'Instagram',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
                color: Colors.black),
          ),
        ),
        actions: const [
          Row(
            children: [
              Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              SizedBox(
                width: 20,
              ),
              Icon(EvaIcons.searchOutline, color: Colors.black),
              SizedBox(
                width: 20,
              ),
              Icon(EvaIcons.paperPlaneOutline, color: Colors.black),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Storys
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Container(
              alignment: Alignment.center,
              height: 90,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10), // Espaçamento entre os avatares
                itemCount: 10, // Número de avatares na lista
                itemBuilder: (context, index) {
                  return const Storys();
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                      height: 15,
                    ),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (_, index) {
                  return TimeLine();
                }),
          )
        ],
      ),
    );
  }
}

class Storys extends StatefulWidget {
  const Storys({super.key});

  @override
  State<Storys> createState() => _StorysState();
}

class _StorysState extends State<Storys> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: 2, color: const Color.fromARGB(255, 231, 164, 140)),
          ),
          child: const Padding(
            padding: EdgeInsets.all(2),
            child: CircleAvatar(
              radius: 28, // Tamanho do avatar
              backgroundImage: AssetImage('assets/Capturar.PNG'),
            ),
          ),
        ),
        const Text(
          'nome',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
