import 'package:flutter/material.dart';
import 'package:mobile_document/api/homeApi.dart';

class HomeProvider extends ChangeNotifier {
  final HomeApi _homeApi = HomeApi();
  final search = TextEditingController();
  bool _loading = false;
  List<dynamic> _document_in = [];
  List<dynamic> _document_out = [];
  List<dynamic> get document_in => _document_in;
  List<dynamic> get document_out => _document_out;
  bool get loading => _loading;

  Future<void> getDocumnetIn() async {
    _loading = true;
    try {
      final result = await _homeApi.DocumentIn();
      if (result!.isNotEmpty) {
        _loading = false;
        _document_in = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> searchIn() async {
    _loading = true;
    try {
      final result = await _homeApi.SearchIn(search: search.text);
      if (result.isNotEmpty) {
        _loading = false;
        _document_in = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      _document_out.clear();
      notifyListeners();
    }
  }

  Future<void> searchOut() async {
    _loading = true;
    try {
      final result = await _homeApi.SearchOut(search: search.text);
      if (result.isNotEmpty) {
        _loading = false;
        _document_out = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
      _document_out.clear();
      notifyListeners();
    }
  }

  Future<void> getDocumnetOut() async {
    _loading = true;
    try {
      final result = await _homeApi.DocumentOut();
      if (result.isNotEmpty) {
        _loading = false;
        _document_out = result;
        notifyListeners();
      }
    } catch (e) {
      _loading = false;
    
      notifyListeners();
    }
  }
}
