import 'dart:async';

import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';

class TopCardSlider extends StatefulWidget {
  TopCardSlider({super.key});

  @override
  _TopCardSliderState createState() => _TopCardSliderState();
}

class _TopCardSliderState extends State<TopCardSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;
  Timer? _timer;

  final List<Color> cardColors = [
    const Color(0xff468286),
    const Color(0xffE98B44),
    const Color(0xff936B49),
  ];
  final List<String> images = [
    "assets/images/top chair.png",
    "assets/images/top lamp.png",
    "assets/images/top table.png",
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % cardColors.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Stop the timer when widget is removed
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            itemCount: cardColors.length,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return TopCard(
                color: cardColors[index],
                image: images[index],
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        buildIndicator(),
      ],
    );
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        cardColors.length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 30,
          height: 4,
          decoration: BoxDecoration(
            color: _currentPage == index ? cardColors[index] : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final Color color;
  final String image;

  const TopCard({super.key, required this.color, required this.image});

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 360,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Stack(
          children: [
            Positioned(
              top: -32,
              left: 301,
              child: CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 152,
              left: 97,
              child: CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: -52,
              left: -3,
              child: CircleAvatar(
                radius: 51,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 169),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 63, left: 40),
              child: Text(
                lang?.top ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 89, left: 40),
              child: Text(
                lang?.related ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 115, left: 40),
              child: Text(
                lang?.thisWeek ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
