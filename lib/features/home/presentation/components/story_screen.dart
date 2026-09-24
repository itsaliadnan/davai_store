import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';

class StoryViewerScreen extends StatefulWidget {
  final List<String> images;

  final Duration segmentDuration;

  const StoryViewerScreen({
    super.key,
    required this.images,
    this.segmentDuration = const Duration(seconds: 4),
  });

  @override
  State<StoryViewerScreen> createState() => _StoryViewerScreenState();
}

class _StoryViewerScreenState extends State<StoryViewerScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: widget.segmentDuration)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _goTo(_currentIndex + 1);
            }
          });

    _startCurrent();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startCurrent() {
    _controller
      ..reset()
      ..forward();
  }

  void _goTo(int index) {
    if (index < 0) return;

    if (index >= widget.images.length) {
      Navigator.of(context).pop();
      return;
    }

    setState(() => _currentIndex = index);
    _startCurrent();
  }

  void _onTapUp(TapUpDetails details, double width) {
    final isRightSide = details.globalPosition.dx > width / 2;
    _goTo(_currentIndex + (isRightSide ? 1 : -1));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Scaffold(
        backgroundColor: context.colorScheme.onSurface,
        body: Center(
          child: Text(
            context.t.home.noImagesToDisplay,
            style: TextStyle(color: context.colorScheme.onPrimary),
          ),
        ),
      );
    }

    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: context.colorScheme.onSurface,
      body: GestureDetector(
        onTapUp: (details) => _onTapUp(details, width),
        onLongPressStart: (_) => _controller.stop(),
        onLongPressEnd: (_) => _controller.forward(),
        onVerticalDragEnd: (details) {
          if ((details.primaryVelocity ?? 0) > 250) {
            Navigator.of(context).pop();
          }
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            // الصورة الحالية
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Image.network(
                widget.images[_currentIndex],
                key: ValueKey(_currentIndex),
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Center(
                  child: Icon(
                    Icons.broken_image_outlined,
                    color: context.colorScheme.surfaceDim,
                    size: 60,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children: List.generate(widget.images.length, (index) {
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 3,
                              child: index < _currentIndex
                                  ? ColoredBox(
                                      color: context.colorScheme.onPrimary,
                                    )
                                  : index == _currentIndex
                                  ? AnimatedBuilder(
                                      animation: _controller,
                                      builder: (context, _) =>
                                          LinearProgressIndicator(
                                            value: _controller.value,
                                            backgroundColor: context
                                                .colorScheme
                                                .onPrimary
                                                .withValues(alpha: 0.3),
                                            valueColor: AlwaysStoppedAnimation(
                                              context.colorScheme.onPrimary,
                                            ),
                                          ),
                                    )
                                  : ColoredBox(
                                      color: context.colorScheme.onPrimary
                                          .withValues(alpha: 0.3),
                                    ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 8,
              right: 8,
              child: SafeArea(
                bottom: false,
                child: IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    color: context.colorScheme.onPrimary,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
