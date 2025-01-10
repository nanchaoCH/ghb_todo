import 'package:flutter/material.dart';

class HomeExamplePage extends StatefulWidget {
  const HomeExamplePage({super.key});

  @override
  State<HomeExamplePage> createState() => _HomeExamplePageState();
}

class _HomeExamplePageState extends State<HomeExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Layout Widget Example'),
      ),
      body: const ThaiFlag(),
    );
  }
}

class ThaiFlag extends StatelessWidget {
  const ThaiFlag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Thai Flag'),
        Column(
          children: [
            Container(
              color: Colors.red,
              height: 50,
            ),
            Container(
              color: Colors.white,
              height: 50,
            ),
            Container(
              color: Colors.blue,
              height: 80,
            ),
            Container(
              color: Colors.white,
              height: 50,
            ),
            Container(
              color: Colors.red,
              height: 50,
            ),
          ],
        )
      ],
    );

    // const yellowWidth = 30.0;

    // return Container(
    //   color: Colors.white,
    //   child: Column(
    //     children: [
    //       const Text('Sweden Flag'),
    //       Container(
    //           height: 100,
    //           color: Colors.blueAccent,
    //           child: Row(
    //             children: [
    //               Container(
    //                 color: Colors.blueAccent,
    //                 width: 100,
    //               ),
    //               Container(
    //                 color: Colors.yellow,
    //                 width: yellowWidth,
    //               )
    //             ],
    //           )),
    //       Container(
    //         color: Colors.yellow,
    //         height: yellowWidth,
    //       ),
    //       Container(
    //         height: 100,
    //         color: Colors.blueAccent,
    //         child: Row(
    //           children: [
    //             Container(
    //               color: Colors.blueAccent,
    //               width: 100,
    //             ),
    //             Container(
    //               color: Colors.yellow,
    //               width: yellowWidth,
    //             )
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // return Container(
    //   color: Colors.grey,
    //   padding: const EdgeInsets.all(30),
    //   child: Stack(
    //     children: [
    //       Container(
    //         height: 200,
    //         color: Colors.white,
    //       ),
    //       Positioned.fill(
    //         child: Center(
    //           child: Container(
    //             width: 100,
    //             height: 100,
    //             decoration: const BoxDecoration(
    //               color: Colors.red,
    //               shape: BoxShape.circle,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    // return Column(
    //   children: [
    //     Expanded(
    //       child: Container(
    //         color: Colors.red,
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         color: Colors.white,
    //       ),
    //     ),
    //     Expanded(
    //       flex: 2,
    //       child: Container(
    //         color: Colors.blue,
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         color: Colors.white,
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         color: Colors.red,
    //       ),
    //     ),
    //   ],
    // );
  }
}
