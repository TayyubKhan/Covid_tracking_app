import 'package:covidapp/URLs/Models/allcasesmodel.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:covidapp/URLs/services/states_services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Countries_list.dart';
class World_screen extends StatefulWidget {
  const World_screen({Key? key}) : super(key: key);

  @override
  State<World_screen> createState() => _World_screenState();
}

class _World_screenState extends State<World_screen>
    with TickerProviderStateMixin {
  late final AnimationController controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  final colour_list = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];
  @override
  Widget build(BuildContext context) {
    StatesServices ss = StatesServices();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            FutureBuilder(
                future: ss.getcases(),
                builder: (context, AsyncSnapshot<Allcasesmodel> snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                      flex: 1,
                      child: SpinKitFadingCircle(
                        color: Colors.white,
                        controller: controller,
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        PieChart(
                            dataMap: {
                              "Total": double.parse(
                                  snapshot.data!.cases!.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered!.toString()),
                              "deaths": double.parse(
                                  snapshot.data!.deaths!.toString())
                            },
                            chartRadius: 150,
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValueBackground: true,
                                showChartValuesInPercentage: true),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            chartType: ChartType.ring,
                            colorList: colour_list),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1),
                        Card(
                          child: Column(
                            children: [
                              ReuseableRow(
                                  title: "Total:",
                                  value: snapshot.data!.cases!.toString()),
                              ReuseableRow(
                                  title: "Recovered:",
                                  value: snapshot.data!.recovered!.toString()),
                              ReuseableRow(
                                  title: "Deaths:",
                                  value: snapshot.data!.deaths!.toString()),
                              ReuseableRow(
                                  title: "Active Cases:",
                                  value: snapshot.data!.active!.toString()),
                              ReuseableRow(
                                  title: "Critical Cases:",
                                  value: snapshot.data!.critical!.toString()),
                              ReuseableRow(
                                  title: "Tests:",
                                  value: snapshot.data!.tests!.toString()),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 15,
                            backgroundColor: Color(0xff1aa260),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> countries_list()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100)),
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: const Center(
                              child: Text('Track Countries',style: TextStyle(fontSize: 19),),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        ),
      ),
    ));
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
          child: Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.62,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 19),
                  )),
              Text(value, style: const TextStyle(fontSize: 19))
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
