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
    Timer.periodic(Duration(seconds: 3), (timer) {
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 16),
              SizedBox(
                height: 600,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _numberOfPages,
                  itemBuilder: (_, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.shade300,
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: FractionallySizedBox(
                              widthFactor: 1,
                              child: Image.asset(
                                'assets/images/Promotion.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
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
