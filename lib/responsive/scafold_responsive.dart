import 'package:flutter/material.dart';

class ScafoldResponsive extends StatefulWidget {
  final AppBar? appBar;
  final Widget? body;
  final Widget? drawer;
  const ScafoldResponsive({super.key, this.appBar, this.body, this.drawer});

  @override
  State<ScafoldResponsive> createState() => _ScafoldResponsiveState();
}

class _ScafoldResponsiveState extends State<ScafoldResponsive> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      drawer: widget.drawer,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 786,
          ),
          child: widget.body,
        ),
      ),
    );
  }
}
