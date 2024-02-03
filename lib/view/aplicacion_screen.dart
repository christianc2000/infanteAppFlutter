import 'package:flutter/material.dart';
import 'package:infanteapp/themes/app_colors.dart';
import 'package:infanteapp/themes/app_font.dart';
import 'package:infanteapp/view/app_usage_details_screen.dart';
import 'package:infanteapp/widget/button_custom.dart';
import 'package:device_apps/device_apps.dart';

class AplicacionScreen extends StatefulWidget {
  const AplicacionScreen({super.key});

  @override
  State<AplicacionScreen> createState() => _AplicacionScreenState();
}

class _AplicacionScreenState extends State<AplicacionScreen> {
  @override
  void initState() {
    super.initState();
    getAllTheInstalledApps();
  }

  getAllTheInstalledApps() async {
    List<Application> apps = await DeviceApps.getInstalledApplications(
        includeSystemApps: true,
        onlyAppsWithLaunchIntent: true,
        includeAppIcons: true);
    print('Length Of The Apps ${apps.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: const Text('Aplicaciones'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text('Mis aplicaciones', style: AppFonts.subtitle),
            const SizedBox(
              height: 10.0,
            ),
            FutureBuilder(
                future: DeviceApps.getInstalledApplications(
                    includeSystemApps: true,
                    onlyAppsWithLaunchIntent: true,
                    includeAppIcons: true),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Application> apps = snapshot.data as List<Application>;

                    return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemCount: apps.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return AppUsageDetailScreen(application: apps[index]);
                                  }));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 4.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.yellow,
                                    ),
                                    child: Center(
                                      child: ListTile(
                                        leading: Image.memory(
                                            (apps[index] as ApplicationWithIcon)
                                                .icon),
                                        title: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                          child: Text(
                                            '${apps[index].appName}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        trailing: IconButton(
                                            onPressed: () {
                                              apps[index].openApp();
                                            },
                                            icon: Icon(Icons.open_in_new)),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })); // Aquí puedes retornar la lista de aplicaciones
                  }
                })
          ],
        ),
      ),
    );
  }
}
