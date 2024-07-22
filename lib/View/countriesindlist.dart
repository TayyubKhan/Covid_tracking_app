// ignore_for_file: must_be_immutable

import 'package:covidapp/URLs/Models/allcasesmodel.dart';
import 'package:covidapp/URLs/services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:shimmer/shimmer.dart';

class CountriesIndexList extends StatelessWidget {
  String countryname, iurl;
  int totalcases, recovered, deaths, activecases, criticalcases, Tests;

  CountriesIndexList({
    Key? key,
    required this.countryname,
    required this.totalcases,
    required this.recovered,
    required this.deaths,
    required this.activecases,
    required this.criticalcases,
    required this.Tests,
    required this.iurl,
  }) : super(key: key);

  final colour_list = <Color>[
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices ss = StatesServices();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(backgroundImage: NetworkImage(iurl)),
              Text(countryname.toString()),
            ],
          ),
          backgroundColor: Colors.white54,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                FutureBuilder(
                    future: ss.getcases(),
                    builder: (context, AsyncSnapshot<Allcasesmodel> snapshot) {
                      if (!snapshot.hasData) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: MediaQuery.of(context).size.width * 1,
                                color: Colors.white,
                              ),
                              SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1),
                              Card(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                    Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Column(
                          children: [
                            PieChart(
                                dataMap: {
                                  "Total": double.parse(totalcases.toString()),
                                  "Recovered":
                                      double.parse(recovered.toString()),
                                  "deaths": double.parse(deaths.toString())
                                },
                                chartRadius: 150,
                                chartValuesOptions: const ChartValuesOptions(
                                    showChartValuesInPercentage: true),
                                animationDuration:
                                    const Duration(milliseconds: 1200),
                                legendOptions: const LegendOptions(
                                    legendPosition: LegendPosition.left),
                                chartType: ChartType.ring,
                                colorList: colour_list),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1),
                            Card(
                              child: Column(
                                children: [
                                  ReuseableRow(
                                    title: "Total:",
                                    value: totalcases.toString(),
                                  ),
                                  ReuseableRow(
                                      title: "Recovered:",
                                      value: recovered.toString()),
                                  ReuseableRow(
                                      title: "Deaths:",
                                      value: deaths.toString()),
                                  ReuseableRow(
                                      title: "Active Cases:",
                                      value: activecases.toString()),
                                  ReuseableRow(
                                      title: "Critical Cases:",
                                      value: criticalcases.toString()),
                                  ReuseableRow(
                                      title: "Tests:", value: Tests.toString()),
                                ],
                              ),
                            ),
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
