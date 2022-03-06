import 'package:deep_rooted_test/src/constants/currency_constants.dart';
import 'package:deep_rooted_test/src/data_provider/api_data_provider.dart';
import 'package:deep_rooted_test/src/reusable_widgets/prior_search_widget.dart';
import 'package:deep_rooted_test/src/reusable_widgets/search_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController currencyController = TextEditingController();
  List<String>? currency;
  List<String>? _filteredList;
  String? filter;
  final ApiDataProvider _apiDataProvider = ApiDataProvider();
  bool dataFetched = false;
  @override
  void initState() {
    currency = currencyList;

    List<String>? tmpList = <String>[];
    for (int i = 0; i < currencyList.length; i++) {
      tmpList.add(currencyList[i]);
    }
    setState(() {
      currency = tmpList;
      _filteredList = currency;
    });
    currencyController.addListener(() {
      if (currencyController.text.isEmpty) {
        setState(() {
          filter = "";
          _filteredList = currency;
        });
      } else {
        setState(() {
          filter = currencyController.text;
        });
      }
    });
    // _filteredList = currencyList;
    currencyController.clear();
    super.initState();
  }

  @override
  void dispose() {
    currencyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ListTile currencyListTile(String currentCurrency) => ListTile(
          title: Text(
            currentCurrency,
            style: const TextStyle(
                color: Colors.black45, fontWeight: FontWeight.bold),
          ),
        );

    Card currencyCard(String s) => Card(
          child: InkWell(
            onTap: () {
              _filteredList = [];
              setState(() {
                currencyController.text = s;
              });
            },
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 238, 238)),
              child: currencyListTile(s),
            ),
          ),
        );

    if (filter!.isNotEmpty) {
      List<String> tmpList = <String>[];
      for (int i = 0; i < _filteredList!.length; i++) {
        if (_filteredList![i].toLowerCase().contains(filter!.toLowerCase())) {
          tmpList.add(_filteredList![i]);
        }
      }
      _filteredList = tmpList;
    }

    final appBody = ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: filter!.isEmpty ? 1 : _filteredList!.length,
      itemBuilder: (BuildContext context, int index) {
        return filter!.isNotEmpty
            ? currencyCard(_filteredList![index])
            : const PriorSearchWidget();
      },
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListTile(
                  tileColor: const Color(0xFFF1F1F1),
                  title: TextFormField(
                    controller: currencyController,
                    decoration: const InputDecoration(
                      hintText: 'Enter currency pair',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    autofocus: false,
                    cursorColor: Colors.black,
                    onChanged: (value) {
                      filter = value;
                      setState(() {});
                    },
                  ),
                  trailing: IconButton(
                    icon:
                        const Icon(Icons.search, color: Colors.black, size: 30),
                    onPressed: () {
                      dataFetched = true;
                      _apiDataProvider.getBtcValueByType(btcType: filter!);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: appBody,
        ),
        floatingActionButton: Visibility(
          visible: dataFetched,
          child: FloatingActionButton(
            onPressed: () =>
                _apiDataProvider.getBtcValueByType(btcType: filter!),
            child: const Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}
