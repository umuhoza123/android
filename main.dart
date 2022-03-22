import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "APP on boarding",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          children: [
            buildPage(
                color: Colors.white,
                urlImaage: "assets/image1.png",
                title: 'Be the first to get award!!',
                subtitle: "just asking yourself how to get it? what you have to do?, it’s simple you already started it since you started using this app"),
            buildPage(
                color: Colors.white,
                urlImaage: "assets/image2.png",
                title: 'Biodiversity resource in a location',
                subtitle: "Lorem ipsum dolor sit amet consectetur adipiscing elit nisl rhoncus, sociosqu porttitor odio suscipit arcu purus mattis ac nullam pretium, "),
                buildPage(
                color: Colors.white,
                urlImaage: "assets/image3.png",
                title: 'Share your picture!',
                subtitle: "Take a picture of an animal from your location and send it through animal registration form."),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () => controller.jumpToPage(2), child: Text('SKIP')),
            Center(
                child: SmoothPageIndicator(
                    controller: controller, // PageController
                    count: 3,
                    effect: WormEffect(
                        spacing: 16,
                        dotColor: Colors.grey,
                        activeDotColor: Colors.greenAccent), // your preferred effect
                    onDotClicked: (index) => controller.animateToPage(index,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn))),
            TextButton(
                onPressed: () => controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut),
                child: Text('NEXT')),
          ],
        ),
      ),
    );
  }

  buildPage(
          {required Color color,
          required String urlImaage,
          required String title,
          required String subtitle}) =>
      Container(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              urlImaage,
              fit: BoxFit.cover,
              width:400,
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(),
              child: Text(
                subtitle,
                style: const TextStyle(color: Colors.black, fontSize: 18, ),
                
              ),
            )
          ],
        ),
      );
}
