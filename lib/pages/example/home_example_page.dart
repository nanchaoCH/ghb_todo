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
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const Text('Thai Flag'),
          Container(
            height: 200,
            color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.green,
                  height: 100,
                )
              ],
            ),
          )
        ],
      ),
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
