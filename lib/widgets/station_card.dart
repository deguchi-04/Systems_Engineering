import 'package:app_sys_eng/colors.dart';
import 'package:app_sys_eng/screens/data_screen.dart';
import 'package:flutter/material.dart';

import 'package:app_sys_eng/models/measurement_unit.dart';
import 'package:app_sys_eng/models/station.dart';

class StationCard extends StatelessWidget {
  final Station station;
  final Function requestRefresh;
  final MeasurementUnit unit;

  const StationCard(
      {super.key,
      required this.station,
      required this.requestRefresh,
      required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.cardBG,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1),
            ]),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: InkWell(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(station.name, textAlign: TextAlign.left),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ValueIndicator(
                      icon: Icons.thermostat,
                      value: station.reading
                          .temperatureWithUnit(unit, round: true),
                    ),
                    ValueIndicator(
                      icon: Icons.air,
                      value: station.reading.windWithUnit(unit, round: true),
                    ),
                    ValueIndicator(
                      icon: Icons.water_drop_outlined,
                      value:
                          station.reading.humidityWithUnit(unit, round: true),
                    ),
                  ],
                )
              ]),
          onTap: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DataScreen(
                    id: station.id,
                  ),
                ));
            requestRefresh();
          }, // Handle your callback
        ));
  }
}

class ValueIndicator extends StatelessWidget {
  final IconData icon;
  final String value;

  const ValueIndicator({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Icon(icon), Text(value)],
    );
  }
}
