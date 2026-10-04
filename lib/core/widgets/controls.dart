import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class ChipGroup extends StatefulWidget {
  final List<String> items;
  final int on;
  const ChipGroup(this.items, {super.key, this.on = 0});
  @override
  State<ChipGroup> createState() => _ChipGroupState();
}

class _ChipGroupState extends State<ChipGroup> {
  late int s = widget.on;
  @override
  Widget build(BuildContext c) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Wrap(spacing: 6, runSpacing: 6, children: [
          for (var i = 0; i < widget.items.length; i++)
            GestureDetector(
              onTap: () => setState(() => s = i),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                decoration: BoxDecoration(
                    color: s == i ? AppColors.red : const Color(0xFFF6E6CF),
                    borderRadius: BorderRadius.circular(99)),
                child: appText(widget.items[i],
                    sz: 12,
                    w: FontWeight.w600,
                    col: s == i ? Colors.white : AppColors.ink),
              ),
            ),
        ]),
      );
}

class SegmentedTabs extends StatefulWidget {
  final List<String> items;
  const SegmentedTabs(this.items, {super.key});
  @override
  State<SegmentedTabs> createState() => _SegmentedTabsState();
}

class _SegmentedTabsState extends State<SegmentedTabs> {
  int s = 0;
  @override
  Widget build(BuildContext c) => Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
            color: const Color(0xFFF6E6CF),
            borderRadius: BorderRadius.circular(99)),
        child: Row(children: [
          for (var i = 0; i < widget.items.length; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => s = i),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 9),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: s == i ? AppColors.red : Colors.transparent,
                      borderRadius: BorderRadius.circular(99)),
                  child: appText(widget.items[i],
                      w: FontWeight.w700,
                      col: s == i ? Colors.white : AppColors.ink),
                ),
              ),
            ),
        ]),
      );
}

class ToggleTile extends StatefulWidget {
  final String t;
  final String? s;
  final bool on;
  const ToggleTile(this.t, {super.key, this.s, this.on = true});
  @override
  State<ToggleTile> createState() => _ToggleTileState();
}

class _ToggleTileState extends State<ToggleTile> {
  late bool v = widget.on;
  @override
  Widget build(BuildContext c) => AppCard(Row(children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText(widget.t, w: FontWeight.w700),
          if (widget.s != null) appText(widget.s!, sz: 11, col: AppColors.mute)
        ])),
        Switch(
            value: v,
            activeThumbColor: AppColors.green,
            onChanged: (x) => setState(() => v = x)),
      ]));
}
