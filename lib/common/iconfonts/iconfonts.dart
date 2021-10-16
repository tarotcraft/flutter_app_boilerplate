
import 'package:flutter/widgets.dart';

class IconDataGitHub extends IconData {
  const IconDataGitHub(int codePoint, { matchTextDirection = false })
      : super(
    codePoint,
    fontFamily: 'iconfont',
    matchTextDirection: matchTextDirection
  );
}

class IconFonts {
  static const IconData push = IconDataGitHub(0xe657);
  static const IconData branch = IconDataGitHub(0xe648);
  static const IconData fork = IconDataGitHub(0xe64a);
  static const IconData issue = IconDataGitHub(0xe64d);
  static const IconData code = IconDataGitHub(0xe646);
  static const IconData star = IconDataGitHub(0xe644);
  static const IconData book = IconDataGitHub(0xe643);
  static const IconData search = IconDataGitHub(0xe63f);
  static const IconData lock = IconDataGitHub(0xe63e);
  static const IconData repo = IconDataGitHub(0xe63d);
  static const IconData pull = IconDataGitHub(0xe63b);
  static const IconData github = IconDataGitHub(0xe638);
  static const IconData tag = IconDataGitHub(0xe671);
  static const IconData organization = IconDataGitHub(0xe673);
  static const IconData location = IconDataGitHub(0xe66c);
  static const IconData info = IconDataGitHub(0xe656);
  static const IconData link = IconDataGitHub(0xe655);
  static const IconData mail = IconDataGitHub(0xe66e);
  static const IconData person = IconDataGitHub(0xe65c);
}
