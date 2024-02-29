import "package:flutter/material.dart";

class IndicatorListView extends StatelessWidget {
  const IndicatorListView({
    super.key,
    required this.indicator,
    required this.current,
  });

  final int indicator;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [for (var i = 0; i < indicator; i++) i].map((e) {
        return Container(
          width: 5.0,
          height: 5.0,
          margin: const EdgeInsets.symmetric(
              vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.all(Radius.circular(100)),
              color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                  .withOpacity(current == e ? 0.9 : 0.4)),
        );
      }).toList(),
    );
  }
}
