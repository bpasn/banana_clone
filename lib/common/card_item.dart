import 'package:flutter/material.dart';
import 'package:banana_clone/constructor/dimension.dart';
import 'package:banana_clone/utils/format_number.dart';

// ignore: must_be_immutable
class CardItem extends StatelessWidget {
  CardItem(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      this.textFooter,
      this.textFooterDecoration});

  String image;
  String title;
  int price;
  String? textFooter;
  TextDecoration? textFooterDecoration = TextDecoration.lineThrough;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: EdgeInsets.all(Dimensions.height3(context) * 2),
      width: Dimensions.height220(context),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage(image),
              ),
            ),
          ),
        ),
        SizedBox(height: Dimensions.height10(context)),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.font16(context) * 1.3,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  Utils.formatNumberToString(price),
                  style: TextStyle(
                      fontSize: Dimensions.font12(context) * 1.3,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
              Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: textFooter != null
                      ? Text(
                          textFooter!,
                          style: TextStyle(
                            fontSize: Dimensions.font10(context) * 1.15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[500],
                            decoration: textFooterDecoration,
                          ),
                        )
                      : null),
            ],
          ),
        ),
      ]),
    );
  }
}
