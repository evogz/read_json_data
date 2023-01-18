import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:read_json_data/models/country.dart';

class Countries extends StatefulWidget {
  const Countries({Key? key}) : super(key: key);

  @override
  State<Countries> createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  late List<Country> list;

  Future<List<Country>> readFromJson() async {
    final file = await DefaultAssetBundle.of(context).loadString('assets/json/countries.json');
    final json = jsonDecode(file);
    //var league = json["leagues"];
    return (json as List).map((e) => Country.fromJson(e)).toList();
  }

  Future<List<Country>> getJsonData() async {
    list = await readFromJson();
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
      ),
      body: FutureBuilder(
        future: getJsonData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Waiting..");
          } else {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        maxRadius: 15,
                        minRadius: 15,
                        child: Text(
                          list[index].iso2.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      title: Text(
                        list[index].name.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  );
                }),
              );
            } else {
              return const Text("Something went wrong..");
            }
          }
        },
      ),
    );
  }
}
