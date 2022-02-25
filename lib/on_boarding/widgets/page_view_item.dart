import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant_app/general/general_constants.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({Key key, this.title, this.subtitle, this.image,@required this.dotIndex}) : super(key: key);
  final String title;
  final String subtitle;
  final String image;
  final double dotIndex;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(height: height*.4, child: Image.asset(image)),
        DotsIndicator(
          dotsCount: 3,
          position: dotIndex,
          decorator: DotsDecorator(
              color: Color(General.getColorHexFromStr('F0B48C')),
            activeColor: General.kSecondaryColor
          ),
        ),
        General.sizeBoxVerical(15.0),
        Text(
          title,
          style: TextStyle(
            fontFamily: 'SFProDisplay-Bold',
            fontSize: 25,
            color: const Color(0xff222b45),
            height: 1.0666666666666667,
          ),
          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        ),
        General.sizeBoxVerical(15.0),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: 'SFProDisplay-Regular',
            fontSize: 15,
            color: const Color(0xff8f9bb3),
            height: 1.4,
          ),
          textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
