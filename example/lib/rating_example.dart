/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-04-29 17:06:50
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-12 23:09:17
 * @FilePath: /phoenix_rating/example/lib/rating_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AEap
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';
import 'package:phoenix_rating/extension/rating_assets.dart';
import 'package:phoenix_rating/phoenix_rating.dart';

/// 星级评分条
class RatingExample extends StatefulWidget {
  @override
  _RatingExampleState createState() => _RatingExampleState();
}

class _RatingExampleState extends State<RatingExample> {
  var num = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('星级评分控件Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            // 只接受整数，外界
            const Text("支持半颗"),
            const RatingStar(),
            const RatingStar(
              selectedCount: 0.5,
            ),
            const RatingStar(
              selectedCount: 3.1,
            ),
            const RatingStar(
              selectedCount: 3.6,
              count: 10,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              child: const Text("支持点击选中，第一个支持反选"),
              onTap: () {
                // BrnToast.show("haha", context);
                setState(() {
                  num = 4;
                });
              },
            ),
            RatingStar(
              selectedCount: num.toDouble(),
              space: 5,
              canRatingZero: true,
              onSelected: (count) {
                // BrnToast.show("选中了$count个", context);
              },
            ),
            const SizedBox(height: 20),
            const Text("自定义图片，颜色，大小"),
            RatingStar(
              selectedCount: 3,
              space: 1,
              canRatingZero: true,
              onSelected: (count) {
                // BrnToast.show("选中了$count个", context);
              },
              starBuilder: _buildRating,
            )
          ],
        ),
      ),
    );
  }

  // 自定义图片，大小，颜色
  Widget _buildRating(RatingState state) {
    switch (state) {
      case RatingState.select:
        return PhoenixTools.getAssetSizeImage(RatingAssets.iconStar, 16, 16,
            color: const Color(0xFF3571DC), package: 'phoenix_rating');
      case RatingState.half:
        return PhoenixTools.getAssetSizeImage(RatingAssets.iconStarHalf, 16, 16,
            package: 'phoenix_rating');
      case RatingState.unselect:
      default:
        return PhoenixTools.getAssetSizeImage(RatingAssets.iconStar, 16, 16,
            color: const Color(0xFFF0F0F0), package: 'phoenix_rating');
    }
  }
}
