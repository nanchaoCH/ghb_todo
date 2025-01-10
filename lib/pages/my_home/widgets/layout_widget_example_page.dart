import 'package:flutter/material.dart';

class LayoutWidgetExamplePage extends StatelessWidget {
  const LayoutWidgetExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 20);

    return SingleChildScrollView(
      child: Container(
        color: Colors.black,
        child: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ThailandFlagWidget(),
              spacer,
              SwedenFlagWidget(),
              spacer,
              JapanFlagWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class CodeDescriptionWidget extends StatelessWidget {
  final String description;
  const CodeDescriptionWidget({
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.green,
        fontSize: 15,
      ),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ThailandFlagWidget extends StatelessWidget {
  const ThailandFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CodeDescriptionWidget(
          description: 'use Column and Container',
        ),
        Container(
          color: Colors.red,
          height: 35,
        ),
        Container(
          color: Colors.white,
          height: 35,
        ),
        Container(
          color: Colors.blue,
          height: 60,
        ),
        Container(
          color: Colors.white,
          height: 35,
        ),
        Container(
          color: Colors.red,
          height: 35,
        ),
      ],
    );
  }
}

class SwedenFlagWidget extends StatelessWidget {
  const SwedenFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const yellowWidth = 35.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CodeDescriptionWidget(
          description: 'use Column, Container and Row',
        ),
        blueAndYellow(yellowWidth),
        Container(
          color: Colors.yellow,
          height: yellowWidth,
        ),
        blueAndYellow(yellowWidth),
      ],
    );
  }

  Container blueAndYellow(double yellowWidth) {
    return Container(
        height: 80,
        color: Colors.blueAccent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100),
              child: Container(
                color: Colors.yellow,
                width: yellowWidth,
              ),
            )
          ],
        ),
      );
  }
}

class JapanFlagWidget extends StatelessWidget {
  const JapanFlagWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CodeDescriptionWidget(
          description: 'use Stack and Container (with BoxDecoration)',
        ),
        Stack(
          children: [
            Container(
              height: 200,
              color: Colors.white,
            ),
            Positioned.fill(
              child: Center(
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
