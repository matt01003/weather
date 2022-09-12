import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/weather",
      debugShowCheckedModeBanner: false,
      // initialRoute: "/",
      routes: {
        '/': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
        '/page4': (context) => const Page4(),
        '/weather': ((context) => const Homepage())
      },
    ),
  );
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page2');
          },
          child: const Text('Go page 2'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page3');
          },
          child: const Text('Go page 3'),
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/page4',
                arguments: {"str": "test", "str2": "Back to page 2"});
          },
          child: const Text('Go page 4'),
        ),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).popUntil(ModalRoute.withName("/page2"));
          },
          child: Text(arguments["str2"]),
        ),
      ),
    );
  }
}
