import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(FullPageviewUI());
}

class FullPageviewUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smooth Page Indicator Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  final List<Map<String, Widget>> pages = [
    {'page': FullAddressUI()},
    {'page': ConfirmAddressUI()},
    {'page': InprocessUI()},
    {'page': PaidUI()},
    {'page': Calendar_UI()},
  ];

  final List<Color> colors = const [
    Colors.red,
    Colors.green,
    Colors.greenAccent,
    Colors.amberAccent,
    Colors.blue,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 16),
            SizedBox(
              height: 240,
              child: PageView.builder(
                controller: controller,
                itemCount: pages.length,
                itemBuilder: (_, index) {
                  return pages[index]['page']!;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 12),
              child: SmoothPageIndicator(
                controller: controller,
                count: pages.length,
                effect: CustomizableEffect(
                  activeDotDecoration: DotDecoration(
                    width: 32,
                    height: 12,
                    color: Colors.indigo,
                    rotationAngle: 180,
                    verticalOffset: -10,
                    borderRadius: BorderRadius.circular(24),
                    dotBorder: DotBorder(
                      padding: 2,
                      width: 2,
                      color: Colors.indigo,
                    ),
                  ),
                  dotDecoration: DotDecoration(
                    width: 24,
                    height: 12,
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  spacing: 6.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullAddressUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Full Address UI"));
  }
}

class ConfirmAddressUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Confirm Address UI"));
  }
}

class InprocessUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Inprocess UI"));
  }
}

class PaidUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Paid UI"));
  }
}

class Calendar_UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Calendar UI"));
  }
}
