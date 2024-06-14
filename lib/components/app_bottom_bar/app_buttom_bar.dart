part of '../components.dart';

const double kActiveFontSize = 14;
const double kBottomMargin = 8;

enum AppBottomBarFabLocation { end, center }

class AppBottomBar extends StatefulHookWidget {
  AppBottomBar({
    required this.items,
    required this.opacity,
    super.key,
    this.onTap,
    this.currentIndex = 0,
    // ignore: tighten_type_of_initializing_formals
    this.iconSize = 24.0,
    this.borderRadius,
    this.elevation,
    this.backgroundColor,
    this.hasNotch = false,
    this.hasInk = false,
    this.inkColor,
    this.colorTween,
    this.fabLocation,
    this.tilesPadding = EdgeInsets.zero,
    // ignore: prefer_asserts_with_message
  })  : assert(items.length >= 2),
        assert(
          items.every((AppBottomBarItem item) => item.title != null) == true,
          'Every item must have a non-null title',
        ),
        // ignore: prefer_asserts_with_message
        assert(0 <= currentIndex! && currentIndex < items.length),
        // ignore: prefer_asserts_with_message
        assert(iconSize != null);

  final List<AppBottomBarItem> items;
  final ValueChanged<int?>? onTap;
  final int? currentIndex;
  final double? iconSize;
  final double opacity;
  final BorderRadius? borderRadius;
  final double? elevation;
  final Color? backgroundColor;
  final bool hasNotch;
  final bool hasInk;
  final AppBottomBarFabLocation? fabLocation;
  final Color? inkColor;
  final ColorTween? colorTween;
  final EdgeInsets tilesPadding;

  @override
  BottomNavigationBarState createState() => BottomNavigationBarState();
}

class BottomNavigationBarState extends State<AppBottomBar>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers = <AnimationController>[];

  late List<CurvedAnimation> _animations;
  Color? _backgroundColor;
  ValueListenable<ScaffoldGeometry>? geometryListenable;
  bool fabExists = false;
  AppBottomBar? holder;
  Animatable<double>? _flexTween;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   
    geometryListenable = Scaffold.geometryOf(context);
    _flexTween = widget.hasNotch
        ? Tween<double>(begin: 1.15, end: 2)
        : Tween<double>(begin: 1.15, end: 1.75);
  }

// ignore: lines_longer_than_80_chars
//  Animatable<double> _flexTween = widget.hasNotch ? Tween<double>(begin: 1.15, end: 2.0) : Tween<double>(begin: 1.15, end: 1.75);

  void _resetState() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    _controllers =
        List<AnimationController>.generate(widget.items.length, (int index) {
      return AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this,
      )..addListener(_rebuild);
    });

    _animations =
        List<CurvedAnimation>.generate(widget.items.length, (int index) {
      return CurvedAnimation(
        parent: _controllers[index],
        curve: Curves.fastOutSlowIn,
        reverseCurve: Curves.fastOutSlowIn.flipped,
      );
    });

    _controllers[widget.currentIndex!].value = 1.0;
    _backgroundColor = widget.items[widget.currentIndex!].backgroundColor;
  }

  @override
  void initState() {
    super.initState();
    _resetState();
  }

  void _rebuild() {
    setState(() {});
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  double _evaluateFlex(Animation<double> animation) =>
      _flexTween!.evaluate(animation);

  @override
  void didUpdateWidget(AppBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.items.length != oldWidget.items.length) {
      _resetState();
      return;
    }

    if (widget.currentIndex != oldWidget.currentIndex) {
      _controllers[oldWidget.currentIndex!].reverse();
      _controllers[widget.currentIndex!].forward();

      if (widget.fabLocation == AppBottomBarFabLocation.center) {
        final currentItem = widget.items[oldWidget.currentIndex!];
        final nextItem = widget.items[widget.currentIndex!];

        widget.items[0] = nextItem;
        widget.items[widget.currentIndex!] = currentItem;
        _controllers[oldWidget.currentIndex!].reverse();
        _controllers[widget.currentIndex!].forward();
        // widget.currentIndex = 0;
        _resetState();
      }
    } else {
      if (_backgroundColor !=
          widget.items[widget.currentIndex!].backgroundColor) {
        _backgroundColor = widget.items[widget.currentIndex!].backgroundColor;
      }
    }
  }

  List<Widget> _createTiles() {
    final localizations = MaterialLocalizations.of(context);
    final children = <Widget>[];
    for (var i = 0; i < widget.items.length; i += 1) {
      children.add(
        BottomNavigationTile(
          widget.items[i],
          widget.opacity,
          _animations[i],
          widget.iconSize!,
          colorTween: widget.colorTween,
          onTap: () {
            // ignore: prefer_null_aware_method_calls
            if (widget.onTap != null) widget.onTap!(i);
          },
          flex: _evaluateFlex(_animations[i]),
          selected: i == widget.currentIndex,
          indexLabel: localizations.tabLabel(
            tabIndex: i + 1,
            tabCount: widget.items.length,
          ),
          ink: widget.hasInk,
          inkColor: widget.inkColor,
          padding: widget.tilesPadding,
        ),
      );
    }
    if (widget.fabLocation == AppBottomBarFabLocation.center) {
      children.insert(1, const Spacer(flex: 1500));
    }
    return children;
  }

  Widget _createContainer(List<Widget> tiles) {
    return DefaultTextStyle.merge(
      overflow: TextOverflow.ellipsis,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tiles,
      ),
    );
  }

  Widget _inner(double additionalBottomPadding) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: kBottomNavigationBarHeight + additionalBottomPadding,
        ),
        child: Material(
          type: MaterialType.transparency,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: additionalBottomPadding,
              right: widget.fabLocation == AppBottomBarFabLocation.end ? 72 : 0,
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeBottom: true,
              child: _createContainer(_createTiles()),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    // ignore: prefer_asserts_with_message
    assert(debugCheckHasDirectionality(context));
    // ignore: prefer_asserts_with_message
    assert(debugCheckHasMaterialLocalizations(context));
    // ignore: lines_longer_than_80_chars
    final double additionalBottomPadding =
        math.max(MediaQuery.of(context).padding.bottom - kBottomMargin, 0);
    return Semantics(
      explicitChildNodes: true,
      child: widget.hasNotch
          ? PhysicalShape(
              elevation: widget.elevation ?? 8.0,
              color: widget.backgroundColor ?? Colors.white,
              clipper: BubbleBottomBarClipper(
                shape: const CircularNotchedRectangle(),
                geometry: geometryListenable!,
                notchMargin: 8,
              ),
              child: _inner(additionalBottomPadding),
            )
          : Material(
              elevation: widget.elevation ?? 8.0,
              color: widget.backgroundColor ?? Colors.white,
              borderRadius: widget.borderRadius ?? BorderRadius.zero,
              child: _inner(additionalBottomPadding),
            ),
    );
  }
}
