import 'package:flutter/material.dart';
import '../core/constants/enums.dart';
import '../widgets/controls_panel.dart';
import '../widgets/live_preview.dart';
import '../widgets/measurements_panel.dart';
import '../widgets/lab_app_bar.dart';
import '../core/constants/colors.dart';

class LayoutExplanationScreen extends StatefulWidget {
  const LayoutExplanationScreen({super.key});

  @override
  State<LayoutExplanationScreen> createState() => _LayoutExplanationScreenState();
}

class _LayoutExplanationScreenState extends State<LayoutExplanationScreen> {
  ParentType _selectedParent = ParentType.tight;
  ChildType _selectedChild = ChildType.small;
  Size _childSize = Size.zero;
  BoxConstraints _incomingConstraints = const BoxConstraints();
  final GlobalKey _childKey = GlobalKey();

  void _updateMeasurements() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      
      final RenderBox? renderBox = _childKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null && renderBox.hasSize) {
        if (_childSize != renderBox.size) {
          setState(() {
            _childSize = renderBox.size;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateMeasurements();

    return Scaffold(
      appBar: const LabAppBar(),
      body: Column(
        children: [
          ControlsPanel(
            selectedParent: _selectedParent,
            selectedChild: _selectedChild,
            onParentChanged: (val) => setState(() => _selectedParent = val!),
            onChildChanged: (val) => setState(() => _selectedChild = val!),
          ),
          const Divider(height: 1, thickness: 2),
          Expanded(
            child: LivePreview(
              selectedParent: _selectedParent,
              demoWidget: _buildDemoWidget(),
              childSize: _childSize,
            ),
          ),
          MeasurementsPanel(
            incomingConstraints: _incomingConstraints,
            childSize: _childSize,
          ),
        ],
      ),
    );
  }

  Widget _buildDemoWidget() {
    Widget child;
    switch (_selectedChild) {
      case ChildType.small:
        child = Container(key: _childKey, width: 100, height: 100, color: AppColors.nelYellow.withOpacity(0.7));
        break;
      case ChildType.large:
        child = Container(key: _childKey, width: 300, height: 300, color: AppColors.nelYellow.withOpacity(0.7));
        break;
      case ChildType.text:
        child = Container(key: _childKey, color: AppColors.nelYellow.withOpacity(0.7), child: const Text('Hello Flutter', style: TextStyle(fontSize: 18)));
        break;
      case ChildType.logo:
        child = Image.asset('assets/images/logo.png', key: _childKey, width: 50, height: 50);
        break;
    }

    Widget wrappedChild = LayoutBuilder(
      builder: (context, constraints) {
        _incomingConstraints = constraints;
        return child;
      },
    );

    switch (_selectedParent) {
      case ParentType.tight:
        return ConstrainedBox(constraints: BoxConstraints.tight(const Size(200, 200)), child: wrappedChild);
      case ParentType.loose:
        return ConstrainedBox(constraints: const BoxConstraints(maxWidth: 200, maxHeight: 200), child: wrappedChild);
      case ParentType.center:
        return Center(child: wrappedChild);
      case ParentType.unconstrained:
        return UnconstrainedBox(child: wrappedChild);
      case ParentType.column:
        return Column(mainAxisSize: MainAxisSize.min, children: [wrappedChild]);
      case ParentType.row:
        return Row(mainAxisSize: MainAxisSize.min, children: [wrappedChild]);
      case ParentType.container:
        return Container(child: wrappedChild);
    }
  }
}
