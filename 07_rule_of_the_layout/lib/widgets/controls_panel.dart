import 'package:flutter/material.dart';
import '../core/constants/enums.dart';
import '../core/constants/strings.dart';
import 'labeled_dropdown.dart';

class ControlsPanel extends StatelessWidget {
  final ParentType selectedParent;
  final ChildType selectedChild;
  final ValueChanged<ParentType?> onParentChanged;
  final ValueChanged<ChildType?> onChildChanged;

  const ControlsPanel({
    super.key,
    required this.selectedParent,
    required this.selectedChild,
    required this.onParentChanged,
    required this.onChildChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.grey[100],
      child: Column(
        children: [
          LabeledDropdown<ParentType>(
            label: AppStrings.parentSelection,
            value: selectedParent,
            items: const [
              DropdownMenuItem(value: ParentType.tight, child: Text(AppStrings.parentTight)),
              DropdownMenuItem(value: ParentType.loose, child: Text(AppStrings.parentLoose)),
              DropdownMenuItem(value: ParentType.center, child: Text(AppStrings.parentCenter)),
              DropdownMenuItem(value: ParentType.unconstrained, child: Text(AppStrings.parentUnconstrained)),
              DropdownMenuItem(value: ParentType.column, child: Text(AppStrings.parentColumn)),
              DropdownMenuItem(value: ParentType.row, child: Text(AppStrings.parentRow)),
              DropdownMenuItem(value: ParentType.container, child: Text(AppStrings.parentContainer)),
            ],
            onChanged: onParentChanged,
          ),
          const SizedBox(height: 12),
          LabeledDropdown<ChildType>(
            label: AppStrings.childSelection,
            value: selectedChild,
            items: const [
              DropdownMenuItem(value: ChildType.small, child: Text(AppStrings.childSmall)),
              DropdownMenuItem(value: ChildType.large, child: Text(AppStrings.childLarge)),
              DropdownMenuItem(value: ChildType.text, child: Text(AppStrings.childText)),
              DropdownMenuItem(value: ChildType.logo, child: Text(AppStrings.childLogo)),
            ],
            onChanged: onChildChanged,
          ),
        ],
      ),
    );
  }
}
