import 'package:davai_store/core/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  static const _logoAsset = 'assets/images/logo.png';
  static const _nextRoute = '/home';
  static const _totalDuration = Duration(milliseconds: 2200);

  late final AnimationController _entryController;
  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _textOpacity;
  late final Animation<Offset> _textSlide;

  late final AnimationController _twinkleController;

  @override
  void initState() {
    super.initState();

    _entryController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoScale = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween(
          begin: 0.7,
          end: 1.08,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 65,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 1.08,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 35,
      ),
    ]).animate(_entryController);

    _logoOpacity = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0, 0.6, curve: Curves.easeOut),
    );

    _textOpacity = CurvedAnimation(
      parent: _entryController,
      curve: const Interval(0.45, 1, curve: Curves.easeOut),
    );

    _textSlide = Tween<Offset>(begin: const Offset(0, 0.25), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _entryController,
            curve: const Interval(0.45, 1, curve: Curves.easeOut),
          ),
        );

    _twinkleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1100),
    )..repeat(reverse: true);

    _entryController.forward();

    Future.delayed(_totalDuration, () {
      if (mounted) context.go(_nextRoute);
    });
  }

  @override
  void dispose() {
    _entryController.dispose();
    _twinkleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.onPrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                ScaleTransition(
                  scale: _logoScale,
                  child: FadeTransition(
                    opacity: _logoOpacity,
                    child: Image.asset(
                      _logoAsset,
                      width: 160,
                      errorBuilder: (_, _, _) => Container(
                        width: 160,
                        height: 160,
                        decoration: BoxDecoration(
                          color: context.colorScheme.onSurface,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            'Davai',
                            style: context.text.titleLarge?.copyWith(
                              color: context.colorScheme.onPrimary,
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                  top: 10,
                  right: 30,
                  child: FadeTransition(
                    opacity: Tween(
                      begin: 0.25,
                      end: 1.0,
                    ).animate(_twinkleController),
                    child: Icon(
                      Icons.auto_awesome_rounded,
                      size: 16,
                      color: context.colorScheme.secondary,
                    ),
                  ),
                ),

                Positioned(
                  top: 34,
                  right: 8,
                  child: FadeTransition(
                    opacity: Tween(
                      begin: 1.0,
                      end: 0.25,
                    ).animate(_twinkleController),
                    child: Icon(
                      Icons.auto_awesome_rounded,
                      size: 10,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            SlideTransition(
              position: _textSlide,
              child: FadeTransition(
                opacity: _textOpacity,
                child: Text(
                  'Davai Store',
                  style: context.text.titleLarge?.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.3,
                    color: context.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
