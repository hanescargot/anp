import 'package:anp/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class ListItem extends StatelessWidget {
  final DateTime startTime;
  final DateTime endTime;
  final String content;
  final Color color;

  const ListItem({
    required this.startTime,
    required this.endTime,
    required this.content,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: FontWeight.w700,
      color: PRIMARY_COLOR,
      fontSize: 16.0,
    );
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 16.0,
          ),
          Container(
            width: 40.0,
            height: 48.0,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                fit: BoxFit.fill,
                image: new NetworkImage(
                    "https://mblogthumb-phinf.pstatic.net/MjAyMDAyMDdfMTYw/MDAxNTgxMDg1NzUxMTUy.eV1iEw2gk2wt_YqPWe5F7SroOCkXJy2KFwmTDNzM0GQg.Z3Kd5MrDh07j86Vlb2OhAtcw0oVmGCMXtTDjoHyem9og.JPEG.7wayjeju/%EB%B0%B0%EC%9A%B0%ED%94%84%EB%A1%9C%ED%95%84%EC%82%AC%EC%A7%84_IMG7117.jpg?type=w800"),
              ),
            ),
          ),
          SizedBox(
            width: 32.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "별피치",
                style: textStyle,
              ),
              Text(
                  "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')} ~ ${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2,'0')}"),
            ],
          ),
          SizedBox(
            width: 16.0,
          ),
          Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: svg_provider.Svg("images/boundary_line.svg"),
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("벚꽃놀이 피크닉세트A"),
              Text("피크닉세트B"),
              Text("피크닉세트C"),
            ],
          ),
        ],
      ),
    );
  }
}
