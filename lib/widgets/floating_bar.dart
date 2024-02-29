import "package:flutter/material.dart";
import "package:banana_clone/constructor/dimension.dart";

class FloatingButtonBar extends StatelessWidget {
  const FloatingButtonBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: Dimensions.height45(context) * 1.5,
      width: Dimensions.height45(context) * 1.5,
      child: FloatingActionButton(
        backgroundColor: Colors.amber.withOpacity(0.8),
        elevation: 0,
        onPressed: () {},
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(
          Icons.notifications_none_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
}
