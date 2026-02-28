import 'dart:async';
import 'package:flutter/material.dart';

class AutoScrollHorizontal extends StatefulWidget {
  final int itemCount;
  final double itemWidth;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final EdgeInsets padding;
  final double height;
  final Duration interval;

  const AutoScrollHorizontal({
    super.key,
    required this.itemCount,
    required this.itemWidth,
    required this.itemBuilder,
    this.padding = EdgeInsets.zero,
    this.height = 170,
    this.interval = const Duration(seconds: 5),
  });

  @override
  State<AutoScrollHorizontal> createState() => _AutoScrollHorizontalState();
}

class _AutoScrollHorizontalState extends State<AutoScrollHorizontal>
    with WidgetsBindingObserver {
  final ScrollController _controller = ScrollController();
  Timer? _timer;
  int _currentIndex = 0;

  // ▶ بدء التحريك
  void _start() {
    _timer?.cancel();
    if (widget.itemCount <= 1) return;

    _timer = Timer.periodic(widget.interval, (_) {
      if (!_controller.hasClients) return;

      _currentIndex++;

      // 🔁 Loop: الرجوع للبداية
      if (_currentIndex >= widget.itemCount) {
        _currentIndex = 0;
        _controller.jumpTo(0);
      } else {
        _controller.animateTo(
          _currentIndex * widget.itemWidth,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  // ⏸ إيقاف التحريك
  void _stop() => _timer?.cancel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _start();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stop();
    _controller.dispose();
    super.dispose();
  }

  // ⏸ التوقف عند خروج الصفحة / الخلفية
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      _stop();
    } else if (state == AppLifecycleState.resumed) {
      _start();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (_) => _stop(), // ✋ توقف عند اللمس
      onPanCancel: _start,
      onPanEnd: (_) => _start(), // ▶ أكمل بعد اللمس
      child: SizedBox(
        height: widget.height,
        child: ListView.builder(
          controller: _controller,
          padding: widget.padding,
          scrollDirection: Axis.horizontal,
          physics: const PageScrollPhysics(), // ⭐ مهم للسناب
          itemCount: widget.itemCount,
          itemBuilder: widget.itemBuilder,
        ),
      ),
    );
  }
}
