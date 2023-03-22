import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../utils/definitions/colors.dart';
import '../app_text/app_text.dart';

class HorizontalTimeline extends StatefulWidget {
  const HorizontalTimeline({
    super.key,
    required this.events,
    required this.currentIndex,
    required this.scrollController,
    this.onChanged,
  });

  final List<String> events;
  final int currentIndex;
  final ItemScrollController scrollController;
  final Function(int)? onChanged;

  @override
  State<HorizontalTimeline> createState() => _HorizontalTimelineState();
}

class _HorizontalTimelineState extends State<HorizontalTimeline> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 120),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ScrollablePositionedList.builder(
          itemScrollController: widget.scrollController,
          scrollDirection: Axis.horizontal,
          itemCount: widget.events.length,
          itemBuilder: (BuildContext context, int index) {
            return TimelineTile(
              axis: TimelineAxis.horizontal,
              alignment: TimelineAlign.center,
              isFirst: index == 0,
              isLast: index == widget.events.length - 1,
              beforeLineStyle: LineStyle(color: Colors.white.withOpacity(0.8)),
              indicatorStyle: IndicatorStyle(
                color: Colors.white,
                indicator: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: index == widget.currentIndex
                            ? AppColors.blue
                            : AppColors.whiteBackground.withOpacity(0.4),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                    shape: BoxShape.circle,
                    color: index == widget.currentIndex
                        ? AppColors.blue
                        : AppColors.whiteBackground,
                  ),
                ),
              ),
              endChild: Container(
                constraints: const BoxConstraints(minWidth: 100),
                child: Center(
                  child: AppText.reference(
                    widget.events[index],
                    textAlign: TextAlign.center,
                    textStyle: TextStyle(
                      color: index == widget.currentIndex
                          ? AppColors.whiteBackground
                          : AppColors.whiteBackground.withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
