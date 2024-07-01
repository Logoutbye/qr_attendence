import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:provider/provider.dart';
import 'package:qr_attendence/config/theme/theme.dart';
import 'package:qr_attendence/provider/theme_provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  late ValueNotifier<bool> _controller;

  @override
  void initState() {
    super.initState();
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    _controller =
        ValueNotifier<bool>(themeProvider.themeMode == ThemeModeEnum.dark);
    _controller.addListener(_onControllerChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final themeProvider = Provider.of<ThemeProvider>(context);
    _controller.value = themeProvider.themeMode == ThemeModeEnum.dark;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onControllerChanged() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final newMode =
        _controller.value ? ThemeModeEnum.dark : ThemeModeEnum.light;
    themeProvider.setThemeMode(newMode);
  }

  @override
  Widget build(BuildContext context) {
    return CustomAdvanceSwitch(
      radius: 20,
      thumbRadius: 20,
      activeChild: const Text('Dark'),
      inactiveChild: const Text('Light'),
      controller: _controller,
    );
  }
}

class CustomAdvanceSwitch extends StatefulWidget {
  final double radius;
  final double thumbRadius;
  final Widget? activeChild;
  final Widget? inactiveChild;
  final ValueNotifier<bool> controller;

  const CustomAdvanceSwitch({
    super.key,
    this.radius = 40,
    this.thumbRadius = 100,
    this.activeChild,
    this.inactiveChild,
    required this.controller,
  });

  @override
  State<CustomAdvanceSwitch> createState() => _CustomAdvanceSwitchState();
}

class _CustomAdvanceSwitchState extends State<CustomAdvanceSwitch> {
  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      activeColor: AppColors.primary,
      inactiveColor: const Color(0xFF292929),
      activeChild: widget.activeChild ?? const Text('ON'),
      inactiveChild: widget.inactiveChild ?? const Text('OFF'),
      borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
      width: 80,
      height: 36,
      thumb: Container(
        margin: const EdgeInsets.all(5),
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(widget.thumbRadius),
        ),
      ),
      controller: widget.controller,
    );
  }
}
