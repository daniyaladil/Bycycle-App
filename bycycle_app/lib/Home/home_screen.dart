import 'package:bycycle_app/Components/bluish_button_component.dart';
import 'package:flutter/material.dart';

// Custom tilted container
class TiltedContainer extends StatelessWidget {
  final Widget child;
  const TiltedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TiltedClipper(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08), // 👈 slight transparent
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }
}

// Custom clipper for tilt effect
class TiltedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0); // top-left
    path.lineTo(size.width, 0); // top-right
    path.lineTo(size.width, size.height - 30); // bottom-right a bit higher
    path.lineTo(0, size.height); // bottom-left longer
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

// Rotatable + Zoomable Image widget
class RotatableImage extends StatefulWidget {
  const RotatableImage({super.key});

  @override
  State<RotatableImage> createState() => _RotatableImageState();
}

class _RotatableImageState extends State<RotatableImage> {
  double _rotation = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _rotation += details.delta.dx * 0.005; // smoother rotation
        });
      },
      child: InteractiveViewer(
        minScale: 0.8,
        maxScale: 3.0,
        child: Transform.rotate(
          angle: _rotation,
          child: Image.asset(
            "assets/bicycle1.png",
            width: 316,
            height: 153,
          ),
        ),
      ),
    );
  }
}

// Home screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252D3C), // 👈 darker base color
      appBar: AppBar(
        backgroundColor: const Color(0xff252D3C).withOpacity(.9),
        elevation: 0,
        title: const Text(
          "Choose Your Bike",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: const [
          BluishButtonComponent(Icon: Icons.search),
        ],
      ),
      body: Stack(
        children: [
          // 👇 Blue diagonal overlay
          Positioned.fill(
            child: ClipPath(
              clipper: DiagonalClipper(),
              child: Container(
                color: Colors.blue.withOpacity(0.6),
              ),
            ),
          ),

          // 👇 Content above background
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: TiltedContainer(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Center(child: RotatableImage()),
                        SizedBox(height: 12),
                        Text(
                          "30 % OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// 👇 Custom clipper for half-diagonal blue overlay
class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0); // top-left
    path.lineTo(size.width, 0); // top-right
    path.lineTo(size.width, size.height); // bottom-right
    path.lineTo(0, size.height * 0.5); // diagonal cut
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
