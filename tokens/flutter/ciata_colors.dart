import 'package:flutter/material.dart';

/// Cores institucionais oficiais do CIATA.
///
/// Não use apenas cor para transmitir estado, prioridade ou erro.
abstract final class CIATAColors {
  static const Color yellow = Color(0xFFFFD000);
  static const Color blue = Color(0xFF005C99);
  static const Color darkBlue = Color(0xFF16365E);
  static const Color gray = Color(0xFFB3B3B3);

  static const Color primary = blue;
  static const Color secondary = darkBlue;
  static const Color accent = yellow;
  static const Color neutral = gray;
}
