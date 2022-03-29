import 'package:flutter/material.dart';
import 'package:butler_chef/utils/app_colors.dart';

class StarRate extends StatefulWidget {
  final double _size;
  final double? rate;

  final Color background = AppColors.white;
  final Color fill = AppColors.star;

  @override
  StarRateState createState() => StarRateState();

  const StarRate({Key? key, required double size, required this.rate})
      : _size = size,
        super(key: key);
}

class StarRateState extends State<StarRate> {
  late List<Color> gradient = [
    widget.background,
    widget.background,
    widget.fill,
    widget.fill,
  ];
  late double fillPercent;
  late double fillStop;
  late List<double> stops = [];
  late List<double> fillPercents = [];

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      fillPercents = getFillPercent(widget.rate!);
    });
    super.initState();
  }

  List<double> getStop(double fillPercent) {
    double fillStop = 1 - fillPercent;
    return [0.0, fillStop, fillStop, 1.0];
  }

  List<double> getFillPercent(double rate) {
    double temp;
    double lastValue = rate % rate.floor();
    int emptyStars = 5 - rate.ceil();

    if (rate < 1) {
      fillPercents.add(rate);
      fillPercents.add(0);
      fillPercents.add(0);
      fillPercents.add(0);
      fillPercents.add(0);
      return fillPercents;
    }
    for (int i = rate.ceil(); i > 0; i--) {
      temp = rate % rate.floor();
      rate = rate - temp;
      if (temp == 0) {
        fillPercents.add(1);
      }
    }
    fillPercents.add(lastValue);
    if (emptyStars != 0) {
      for (int i = 0; i < emptyStars; i++) {
        fillPercents.add(0);
      }
    }

    return fillPercents; //[1,1,0.3]
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
      ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ShaderMask(
            shaderCallback: (bounds) {
              return RadialGradient(
                center: Alignment.centerRight,
                radius: 1,
                colors: gradient,
                stops: getStop(fillPercents[index]),
              ).createShader(bounds);
            },
            child: Icon(
              Icons.star_rounded,
              size: widget._size,
              color: Colors.white,
            ),
          );
        },
      ),
    ]);
  }
}
