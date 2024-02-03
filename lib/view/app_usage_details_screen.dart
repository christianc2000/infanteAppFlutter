import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';
import 'package:infanteapp/themes/app_font.dart';
import 'package:usage_stats/usage_stats.dart';

class AppUsageDetailScreen extends StatefulWidget {
  final Application application;
  const AppUsageDetailScreen({super.key, required this.application});

  @override
  State<AppUsageDetailScreen> createState() => _AppUsageDetailScreenState();
}

class _AppUsageDetailScreenState extends State<AppUsageDetailScreen> {
  UsageInfo? appUsageInfo;

  getUsage() async {
    DateTime endDate = new DateTime.now();
    DateTime startDate =
        DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

    // grant usage permission - opens Usage Settings
    UsageStats.grantUsagePermission();

    // check if permission is granted
    bool? isPermission = await UsageStats.checkUsagePermission();

    // query events
    // List<EventUsageInfo> events =
    //     await UsageStats.queryEvents(startDate, endDate);

    // query usage stats
    List<UsageInfo> usageStats =
        await UsageStats.queryUsageStats(startDate, endDate);//brinda la información de los datos estadísticos de uso de la aplicación

if(usageStats.isNotEmpty){
usageStats.forEach((element) {
  if(element.packageName == widget.application.packageName){
    setState((){
      appUsageInfo = element;
    });
  }
});
}
print('VALUE INSIDE APP USAGE INFO ${appUsageInfo!.packageName}');
    // query eventStats API Level 28
    // List<EventInfo> eventStats =
    //     await UsageStats.queryEventStats(startDate, endDate);

    // query configurations
    // List<ConfigurationInfo> configurations =
    //     await UsageStats.queryConfiguration(startDate, endDate);

    // query aggregated usage statistics
    // Map<String, UsageInfo> queryAndAggregateUsageStats =
    //     await UsageStats.queryAndAggregateUsageStats(startDate, endDate);

    // query network usage statistics
    // List<NetworkInfo> networkInfos = await UsageStats.queryNetworkUsageStats(
    //     startDate, endDate,
    //     networkType: NetworkType.all);
  }

@override
void initState(){
  super.initState();
  getUsage();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          title: Text(widget.application.appName),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text('Detalle de aplicación', style: AppFonts.subtitle),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ));
  }
}
