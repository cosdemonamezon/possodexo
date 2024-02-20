import 'package:flutter/material.dart';

class GridProMotion extends StatefulWidget {
  const GridProMotion({super.key});

  @override
  State<GridProMotion> createState() => _GridProMotionState();
}

class _GridProMotionState extends State<GridProMotion> {
  final List<Map<String, dynamic>> GridProMotion = [
    {
      'image': 'assets/images/figure.png',
      'Tiltle': 'BUY 2 PAY 2  ฿ 165.00',
      'Order1': 'Matcha Latte',
      'Order2': 'Americano'
    },
    {
      'image': 'assets/images/figure.png',
      'Tiltle': 'BUY 2 PAY 2  ฿ 165.00',
      'Order1': 'Matcha Latte',
      'Order2': 'Americano'
    },
    {
      'image': 'assets/images/figure.png',
      'Tiltle': 'BUY 2 PAY 2  ฿ 165.00',
      'Order1': 'Matcha Latte',
      'Order2': 'Americano'
    },
    {
      'image': 'assets/images/figure.png',
      'Tiltle': 'BUY 2 PAY 2  ฿ 165.00',
      'Order1': 'Matcha Latte',
      'Order2': 'Americano'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: Color(0xFF37474F)),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisExtent: 75,
              mainAxisSpacing: 10,
            ),
            itemCount: GridProMotion.length,
            itemBuilder: (_, index) {
              return Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        GridProMotion[index]['image'],
                        width: 55,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashedVerticalLine(),
                    ),
                    // FishboneLine(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GridProMotion[index]['Tiltle'],
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          GridProMotion[index]['Order1'],
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          GridProMotion[index]['Order2'],
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class DashedVerticalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 5, // กว้างของเส้นประ
      height: 120, // ความสูงของเส้นประ
      child: CustomPaint(
        painter: DashedLinePainter(),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF90A4AE)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final double dashWidth = 5;
    final double dashSpace = 5;

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += (dashWidth + dashSpace);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
