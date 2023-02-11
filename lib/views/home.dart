import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:quran_app/controllers/controller.dart';
import 'package:quran_app/models/quran_model.dart';
import 'package:quran_app/utils/prefs.dart';
import 'package:quran_app/widgets/header.dart';
import 'package:quran_app/widgets/quran_list_tile.dart';

import '../utils/store_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          Provider.of<QuranDataController>(context, listen: false)
              .getQuranData();
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QuranDataController>(context, listen: true);
    var data = controller.quranData?.search.results;
    final box = GetStorage();
    // print("The get storage key name is: " + box.read(Keys.quranData));
    print('value is' + quranList.toString());
    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Header(),
          controller.isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SpinKitWave(
                        color: Colors.blueGrey.shade700,
                        size: 40.0,
                      ),
                      Text(
                        "Loading...",
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      // itemCount: quranList == null ? 0 : quranList.length,
                      itemCount:
                          controller.quranData == null ? 0 : data!.length,
                      itemBuilder: (_, index) {
                        Result quran = data![index];
                        return QuranTile(quran: quran);
                      })),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "Al Quran",
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.grey.shade300,
      elevation: 0,
    );
  }
}
