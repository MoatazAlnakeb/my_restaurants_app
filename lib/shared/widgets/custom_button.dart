import 'package:flutter/material.dart';
import 'package:my_restaurant_app/general/general_constants.dart';

class CustomGeneralButton extends StatelessWidget {
  final String? text;
  final Color? backgroungColor;
  final Color? borderColor;
  final double? borderwidth;
  final VoidCallback? onTap;
  final double width;

  const CustomGeneralButton({Key? key, this.text,this.backgroungColor,this.borderColor,this.borderwidth,this.onTap,required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          // color: Colors.grey,
          color: backgroungColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor==null?Colors.transparent:borderColor!,
            style: BorderStyle.solid,
            width: borderwidth==null?0:borderwidth!,
          ),
        ),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 17,
              // color: const Color(0xffffffff),
            ),
            textAlign: TextAlign.right,
            softWrap: false,
          ),
        ),),
    );
  }
}



class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {Key? key, required this.text, this.onTap, this.iconData, this.color})
      : super(key: key);
  final String text;
  final IconData? iconData;
  final VoidCallback? onTap;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        // width: SizeConfig.screenWidth,
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFF707070),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: color,
            ),
            General.sizeBoxHorizintal(15.0),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
                fontSize: 12,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}