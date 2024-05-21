import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:family_fun_time/widgets/widgets.dart';

class RuletaView extends StatefulWidget {
  final List<String> playersName;
  final List<String> categories;
  final Map<String, String> playerActivities;

  const RuletaView({
    super.key,
    required this.playersName,
    required this.categories,
    required this.playerActivities,
  });

  @override
  // ignore: library_private_types_in_public_api
  _RuletaViewState createState() => _RuletaViewState();
}

class _RuletaViewState extends State<RuletaView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Future.delayed(const Duration(seconds: 5), () {
      _controller.stop();
      Navigator.pushNamed(context, 'resultados', arguments: {
        'playerActivities': widget.playerActivities,
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const AppBarWidget()),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _animation.value * 2 * pi,
                child: child,
              );
            },
            child: CustomPaint(
              size: const Size(300, 300),
              painter: RuletaPainter(widget.categories),
            ),
          ),
        ),
      ),
    );
  }
}

class RuletaPainter extends CustomPainter {
  final List<String> categories;

  RuletaPainter(this.categories);

  final Map<String, Color> categoryColors = {
    'Cocina': const Color.fromARGB(255, 167, 206, 238),
    'Aire Libre': const Color.fromARGB(255, 239, 184, 202),
    'Arte': const Color.fromARGB(255, 137, 227, 140),
    'Juegos de mesa': const Color.fromARGB(255, 215, 142, 228),
    'Entretenimiento': const Color.fromARGB(255, 242, 212, 166),
  };

  final Map<String, IconData> categoryIcons = {
    'Cocina': Icons.restaurant,
    'Aire Libre': Icons.park,
    'Arte': Icons.brush,
    'Juegos de mesa': Icons.videogame_asset,
    'Entretenimiento': Icons.movie,
  };

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    final numSections = categories.length;
    final sweepAngle = 2 * pi / numSections;
    final radius = size.width / 2;

    for (var i = 0; i < numSections; i++) {
      final startAngle = i * sweepAngle;
      paint.color = categoryColors[categories[i]] ?? Colors.grey;

      canvas.drawArc(
        Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
        startAngle,
        sweepAngle,
        true,
        paint,
      );

      final icon = categoryIcons[categories[i]];
      if (icon != null) {
        const iconSize = 40.0;
        final offsetAngle = startAngle + sweepAngle / 2;
        final iconOffset = Offset(
          (radius * 0.6)*cos(offsetAngle) + size.width / 2 - iconSize / 2,
          (radius* 0.6) * sin(offsetAngle) + size.height / 2 - iconSize / 2,
        );

        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: String.fromCharCode(icon.codePoint),
            style: TextStyle(
              fontSize: iconSize,
              fontFamily: icon.fontFamily,
              color: Colors.black,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(canvas, iconOffset);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
