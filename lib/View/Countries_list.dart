import 'package:covidapp/URLs/services/states_services.dart';
import 'package:covidapp/View/countriesindlist.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({Key? key}) : super(key: key);

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  TextEditingController searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices ss = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchcontroller,
                decoration: InputDecoration(
                    hintText: 'Search with country Name',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: ss.getCountries(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: const Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    list_tile(),
                                    list_tile(),
                                    list_tile(),
                                    list_tile(),
                                    list_tile(),
                                    list_tile(),
                                  ],
                                ))
                          ],
                        ));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = snapshot.data![index]['country'];
                          if (searchcontroller.text.isEmpty) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountriesIndexList(
                                              countryname: snapshot.data![index]
                                                  ['country'],
                                              totalcases: snapshot.data![index]
                                                  ['cases'],
                                              recovered: snapshot.data![index]
                                                  ['recovered'],
                                              deaths: snapshot.data![index]
                                                  ['deaths'],
                                              activecases: snapshot.data![index]
                                                  ['active'],
                                              criticalcases: snapshot
                                                  .data![index]['critical'],
                                              Tests: snapshot.data![index]
                                                  ['tests'],
                                              iurl: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                            )));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(
                                        'Cases:\t${snapshot.data![index]['cases']}',
                                        style: const TextStyle(
                                            color: Colors.white60),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchcontroller.text.toLowerCase())) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 15,
                                  backgroundColor: Theme.of(context)
                                      .scaffoldBackgroundColor),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountriesIndexList(
                                              countryname: snapshot.data![index]
                                                  ['country'],
                                              totalcases: snapshot.data![index]
                                                  ['cases'],
                                              recovered: snapshot.data![index]
                                                  ['recovered'],
                                              deaths: snapshot.data![index]
                                                  ['deaths'],
                                              activecases: snapshot.data![index]
                                                  ['active'],
                                              criticalcases: snapshot
                                                  .data![index]['critical'],
                                              Tests: snapshot.data![index]
                                                  ['tests'],
                                              iurl: snapshot.data![index]
                                                  ['countryInfo']['flag'],
                                            )));
                              },
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(
                                        'Cases:\t${snapshot.data![index]['cases']}',
                                        style: const TextStyle(
                                            color: Colors.white60),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 15,
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CountriesIndexList(
                                            countryname: snapshot.data![index]
                                                ['country'],
                                            totalcases: snapshot.data![index]
                                                ['cases'],
                                            recovered: snapshot.data![index]
                                                ['recovered'],
                                            deaths: snapshot.data![index]
                                                ['deaths'],
                                            activecases: snapshot.data![index]
                                                ['active'],
                                            criticalcases: snapshot.data![index]
                                                ['critical'],
                                            Tests: snapshot.data![index]
                                                ['tests'],
                                            iurl: snapshot.data![index]
                                                ['countryInfo']['flag'],
                                          )));
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(snapshot
                                          .data![index]['countryInfo']['flag']),
                                    ),
                                    title:
                                        Text(snapshot.data![index]['country']),
                                    subtitle: Text(
                                      'Cases:\t${snapshot.data![index]['cases']}',
                                      style: const TextStyle(
                                          color: Colors.white60),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class list_tile extends StatelessWidget {
  const list_tile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.white,
        ),
      ),
      title: Container(
        width: 80,
        height: 10,
        color: Colors.white,
      ),
      subtitle: Container(
        width: 80,
        height: 10,
        color: Colors.white,
      ),
    );
  }
}
