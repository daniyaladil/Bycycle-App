import 'package:flutter/material.dart';

class BluishButtonComponent extends StatefulWidget {
  final IconData Icon;
  const BluishButtonComponent({super.key, required this.Icon});

  @override
  State<BluishButtonComponent> createState() => _BluishButtonComponentState();
}

class _BluishButtonComponentState extends State<BluishButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff34C8E8),
              Color(0xff4E4AF2)
            ]
        ),
      ),
      child: Center(
        child: Icon(widget.Icon,color: Colors.white,size: 20,),
      ),
    );
  }
}
