import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _text1 = '';
  String get text1 => _text1;
  set text1(String value) {
    _text1 = value;
  }

  String _stt = 'Speak Something...';
  String get stt => _stt;
  set stt(String value) {
    _stt = value;
  }

  String _btnTalk = 'Talk';
  String get btnTalk => _btnTalk;
  set btnTalk(String value) {
    _btnTalk = value;
  }

  String _sstSendText = '';
  String get sstSendText => _sstSendText;
  set sstSendText(String value) {
    _sstSendText = value;
  }

  bool _isRecording = false;
  bool get isRecording => _isRecording;
  set isRecording(bool value) {
    _isRecording = value;
  }

  bool _bool1 = false;
  bool get bool1 => _bool1;
  set bool1(bool value) {
    _bool1 = value;
  }

  List<String> _sttArray = [];
  List<String> get sttArray => _sttArray;
  set sttArray(List<String> value) {
    _sttArray = value;
  }

  void addToSttArray(String value) {
    sttArray.add(value);
  }

  void removeFromSttArray(String value) {
    sttArray.remove(value);
  }

  void removeAtIndexFromSttArray(int index) {
    sttArray.removeAt(index);
  }

  void updateSttArrayAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    sttArray[index] = updateFn(_sttArray[index]);
  }

  void insertAtIndexInSttArray(int index, String value) {
    sttArray.insert(index, value);
  }

  bool _fillForm = false;
  bool get fillForm => _fillForm;
  set fillForm(bool value) {
    _fillForm = value;
  }

  String _StartLength = '';
  String get StartLength => _StartLength;
  set StartLength(String value) {
    _StartLength = value;
  }

  String _StopLength = '';
  String get StopLength => _StopLength;
  set StopLength(String value) {
    _StopLength = value;
  }

  String _Defect = '';
  String get Defect => _Defect;
  set Defect(String value) {
    _Defect = value;
  }

  String _Severity = '';
  String get Severity => _Severity;
  set Severity(String value) {
    _Severity = value;
  }

  bool _bool2 = false;
  bool get bool2 => _bool2;
  set bool2(bool value) {
    _bool2 = value;
  }

  bool _bool3 = false;
  bool get bool3 => _bool3;
  set bool3(bool value) {
    _bool3 = value;
  }

  bool _bool4 = false;
  bool get bool4 => _bool4;
  set bool4(bool value) {
    _bool4 = value;
  }

  bool _bool5 = false;
  bool get bool5 => _bool5;
  set bool5(bool value) {
    _bool5 = value;
  }

  int _counter = 0;
  int get counter => _counter;
  set counter(int value) {
    _counter = value;
  }

  bool _bool6 = false;
  bool get bool6 => _bool6;
  set bool6(bool value) {
    _bool6 = value;
  }

  List<String> _counterList = [];
  List<String> get counterList => _counterList;
  set counterList(List<String> value) {
    _counterList = value;
  }

  void addToCounterList(String value) {
    counterList.add(value);
  }

  void removeFromCounterList(String value) {
    counterList.remove(value);
  }

  void removeAtIndexFromCounterList(int index) {
    counterList.removeAt(index);
  }

  void updateCounterListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    counterList[index] = updateFn(_counterList[index]);
  }

  void insertAtIndexInCounterList(int index, String value) {
    counterList.insert(index, value);
  }

  bool _boolTimer = false;
  bool get boolTimer => _boolTimer;
  set boolTimer(bool value) {
    _boolTimer = value;
  }

  String _stt2 = 'Speak Something';
  String get stt2 => _stt2;
  set stt2(String value) {
    _stt2 = value;
  }

  List<String> _totalList = [];
  List<String> get totalList => _totalList;
  set totalList(List<String> value) {
    _totalList = value;
  }

  void addToTotalList(String value) {
    totalList.add(value);
  }

  void removeFromTotalList(String value) {
    totalList.remove(value);
  }

  void removeAtIndexFromTotalList(int index) {
    totalList.removeAt(index);
  }

  void updateTotalListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    totalList[index] = updateFn(_totalList[index]);
  }

  void insertAtIndexInTotalList(int index, String value) {
    totalList.insert(index, value);
  }

  bool _bool7 = false;
  bool get bool7 => _bool7;
  set bool7(bool value) {
    _bool7 = value;
  }
}
