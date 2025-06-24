import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yumio/src/app/contants/app_colors.dart';
import 'package:yumio/src/app/contants/assets_path/png_assets.dart';
import 'package:yumio/src/app/routes/routes.dart';
import 'package:yumio/src/common/widgets/button/common_elevated_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool showDot = false;
  bool expandDot = false;
  bool showFullOrange = false;
  bool showBottomPanel = false;

  late AnimationController _dropController;
  late Animation<double> _dropScaleAnimation;
  late Animation<Offset> _dropSlideAnimation;

  late AnimationController _expandController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();
    _dropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _dropScaleAnimation = CurvedAnimation(
      parent: _dropController,
      curve: Curves.elasticOut,
    );

    _dropSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -10),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _dropController, curve: Curves.elasticInOut),
    );

    _expandController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _expandAnimation = CurvedAnimation(
      parent: _expandController,
      curve: Curves.elasticOut,
    );

    _startAnimations();
  }

  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      showDot = true;
    });

    _dropController.forward();

    await Future.delayed(const Duration(milliseconds: 2000));
    setState(() {
      expandDot = true;
    });
    _expandController.forward();

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      showFullOrange = true;
    });

    await Future.delayed(const Duration(milliseconds: 800));
    setState(() {
      showBottomPanel = true;
    });
  }

  @override
  void dispose() {
    _dropController.dispose();
    _expandController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoImage = Image.asset(PngAssets.splashLogo, width: 205, height: 60);
    final logoImage2 = Image.asset(
      PngAssets.splashLogo2,
      width: 205,
      height: 60,
    );

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 600),
            color: showFullOrange ? AppColors.primary : AppColors.white,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (showDot)
                    SlideTransition(
                      position: _dropSlideAnimation,
                      child: ScaleTransition(
                        scale: _dropScaleAnimation,
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  if (expandDot)
                    ScaleTransition(
                      scale: _expandAnimation,
                      child: Container(
                        width: 254,
                        height: 254,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: expandDot ? logoImage2 : logoImage,
                  ),
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
            bottom: showBottomPanel ? 0 : -220,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: TopCurveClipper(),
              child: Container(
                height: 220,
                color: AppColors.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 50),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: CommonElevatedButton(
                    borderRadius: 12,
                    buttonName: "Continue",
                    onPressed: () => Get.offNamed(BaseRoute.onboarding),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(size.width / 2, 60, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
