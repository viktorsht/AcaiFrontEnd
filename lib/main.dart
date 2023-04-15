import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';
void main() {
  initializeDateFormatting().then((_) => runApp(const App()));
}