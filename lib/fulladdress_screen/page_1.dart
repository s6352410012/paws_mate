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

  @override
  Widget build(BuildContext context) {
    final pages = [
      FullAddressUI(),
      ConfirmAddressUI(),
      InprocessUI(),
      PaidUI(),
      Calendar_UI(),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 216, 231, 255),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Container(
          width: 205,
          height: 57,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pawsMate logo resize.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              controller.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: () {
              controller.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    return pages[index];
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  'Customizable Effect',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              Container(
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
                    ),
                    dotDecoration: DotDecoration(
                      width: 24,
                      height: 12,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      verticalOffset: 0,
                    ),
                    spacing: 6.0,
                    inActiveColorOverride: (i) => colors[i],
                  ),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
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

final colors = const [
  Colors.red,
  Colors.green,
  Colors.greenAccent,
  Colors.amberAccent,
  Colors.blue,
  Colors.amber,
];
