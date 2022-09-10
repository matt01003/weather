import 'package:flutter/material.dart';

import '../constants.dart';

class LocalWeatherDialog extends StatefulWidget {
  final dynamic data;
  const LocalWeatherDialog(this.data, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LocalWeatherDialogState();
}

class LocalWeatherDialogState extends State<LocalWeatherDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeOutCirc);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
            decoration: greyBox,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    widget.data.forecastPeriod,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.data.generalSituation,
                  style: whiteText18,
                ),
                const SizedBox(height: 15),
                Text(
                  widget.data.forecastDesc,
                  style: whiteText18,
                ),
                const SizedBox(height: 15),
                Text(
                  widget.data.outlook,
                  style: whiteText18,
                ),
              ],
            )),
      ),
    );
  }
}
