import 'package:flutter/cupertino.dart';
import 'package:quran_app/models/quran_model.dart';
import 'package:quran_app/services/quran_services.dart';

class QuranDataController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  QuranModelClass? quranData;
  Future<void> getQuranData() async {
    _isLoading = true;
    notifyListeners();

    quranData = await QuranServicesClass.getQuranData();
    _isLoading = false;

    notifyListeners();
  }
}
