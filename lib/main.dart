import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

void main() {
  runApp(const SearchBarDemoApp());
}

class SearchBarDemoApp extends StatelessWidget {
  const SearchBarDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Search Bar Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const SearchBarDemoHome());
  }
}

class SearchBarDemoHome extends StatefulWidget {
  const SearchBarDemoHome({Key? key}) : super(key: key);

  @override
  _SearchBarDemoHomeState createState() => _SearchBarDemoHomeState();
}

class _SearchBarDemoHomeState extends State<SearchBarDemoHome> {
  late SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> listLastNames = [
    'Ronaldo',
    'Rashford',
    'Fernandesh',
    'Pogba',
    'Sancho',
    'De Hea',
    'Varan',
    'Ronaldo',
    'Rashford',
    'Fernandesh',
    'Pogba',
    'Sancho',
    'De Hea',
    'Varan'
  ];
  final List<String> listFirstNames = [
    'Cristiano',
    'Marcus',
    'Bruno',
    'Pole',
    'Jaidon',
    'David',
    'Raffael',
    'Cristiano',
    'Marcus',
    'Bruno',
    'Pole',
    'Jaidon',
    'David',
    'Raffael'
  ];

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        title: const Text('Search Bar'),
        actions: [searchBar.getSearchAction(context)]);
  }

  void onSubmitted(String value) {
    value == listFirstNames.firstWhere((element) => element == value)
        ? showDialog(
            context: context,
            builder: (_) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                padding: const EdgeInsets.all(24),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              );
            })
        : showDialog(
            context: context,
            builder: (_) {
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                padding: const EdgeInsets.all(24),
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: const Center(
                  child: Text(
                    'No match',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              );
            });
  }

  _SearchBarDemoHomeState() {
    searchBar = SearchBar(
        inBar: false,
        buildDefaultAppBar: buildAppBar,
        setState: setState,
        onSubmitted: onSubmitted,
        onCleared: () {
          print("cleared");
        },
        onClosed: () {
          print("closed");
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: ListView.separated(
        itemCount: listFirstNames.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 8);
        },
        itemBuilder: (BuildContext context, int index) {
          final nameList = listLastNames[index];
          final surnameList = listFirstNames[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Text(surnameList),
                Text(nameList),
                const Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}
