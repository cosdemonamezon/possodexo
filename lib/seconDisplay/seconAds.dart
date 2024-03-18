import 'dart:async';
import 'package:flutter/material.dart';

class SeconAds extends StatefulWidget {
  const SeconAds({Key? key});

  @override
  State<SeconAds> createState() => _SeconAdsState();
}

class _SeconAdsState extends State<SeconAds> {
  final PageController _controller = PageController(viewportFraction: 0.8, keepPage: true);

  final int _numberOfPages = 6;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _numberOfPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _controller.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = List.generate(
      12,
      (index) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.shade300,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                index % 6 == 0
                    ? 'assets/images/Promotion.png'
                    : index % 6 == 1
                        ? 'assets/images/imagelogin.png'
                        : index % 6 == 2
                            ? 'assets/images/Promotion.png'
                            : index % 6 == 3
                                ? 'assets/images/imagelogin.png'
                                : index % 6 == 4
                                    ? 'assets/images/Promotion.png'
                                    : 'assets/images/imagelogin.png',
                fit: BoxFit.cover,
                width: size.width * 0.5,
                height: size.height * 0.5,
              ),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: size.height * 0.52,
                child: PageView.builder(
                  controller: _controller,
                  itemBuilder: (_, index) {
                    return pages[index % pages.length];
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
