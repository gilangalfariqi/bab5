class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, appProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Agro Tech",
              style: appProvider.whiteRoboto14Bold,
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            backgroundColor: appProvider.mainColor,
          ),
          body: Center(
            child: ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                // TEMPERATURE FIELD
                CustomReadField(
                  result: appProvider.field1model!.field1,
                  borderColor: appProvider.mainColor,
                  image: appProvider.thermoMeterImage,
                ),
                const SizedBox(height: 20),

                // HUMIDITY FIELD
                CustomReadField(
                  result: appProvider.field2model!.field2,
                  borderColor: appProvider.mainColor,
                  image: appProvider.humiditySensorImage,
                ),
                const SizedBox(height: 20),

                // SOIL MOISTURE FIELD
                CustomReadField(
                  result: appProvider.field3model!.field3,
                  borderColor: appProvider.mainColor,
                  image: appProvider.soilAnalysisImage,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
