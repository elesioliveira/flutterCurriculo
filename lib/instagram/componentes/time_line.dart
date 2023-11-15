import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MeuController extends GetxController {
  static RxBool icon = true.obs;

  static RxInt curtida = 365.obs;
}

class TimeLine extends StatelessWidget {
  TimeLine({super.key});

  String usuario = 'LeagueOfBrasil';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25,
          child: Padding(
            padding: const EdgeInsets.only(left: 7),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/Capturar.PNG'),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 7),
                  child: Text(
                    'Elesio Oliveira',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child:
              SizedBox(width: 500, child: Image.asset('assets/Capturar.PNG')),
        ),
        Obx(() => Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      MeuController.icon.value = !MeuController.icon.value;
                      if (MeuController.icon.value) {
                        MeuController.curtida--;
                      } else {
                        MeuController.curtida++;
                      }
                    },
                    child: MeuController.icon.value
                        ? const Icon(
                            EvaIcons.heartOutline,
                            size: 25,
                          )
                        : const Icon(
                            Icons.favorite,
                            size: 25,
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    EvaIcons.messageCircleOutline,
                    size: 25,
                  ),
                ),
                const Icon(
                  EvaIcons.paperPlaneOutline,
                  size: 25,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 250),
                  child: Icon(EvaIcons.bookmarkOutline),
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 7),
                child: Text(
                  'Liked by ',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Text(
                "$usuario ",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text('and '),
              Obx(() => Text(
                    "others ${MeuController.curtida.value}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
