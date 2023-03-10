import 'package:flutter/foundation.dart';
import 'package:lovelace/responsive/mobile_screen_layout.dart';
import 'package:lovelace/responsive/responsive_layout.dart';
import 'package:lovelace/responsive/web_screen_layout.dart';
import 'package:lovelace/screens/chat/chat_list_screen.dart';
import 'package:lovelace/screens/user/account/account_screen.dart';
import 'package:lovelace/screens/main/home_screen.dart';

const webScreenSize = 600;

const userScreens = [
  HomeScreen(),
  ChatListScreen(),
  AccountScreen(),
];

const userPages = ResponsiveLayout(
    mobileScreenLayout: MobileScreenLayout(),
    webScreenLayout: WebScreenLayout());

// String baseUrl = "ec2-13-229-224-40.ap-southeast-1.compute.amazonaws.com";
String baseUrl = checkDevice();

String checkDevice() {
  String baseUrl;
  int port = 80;
  if (defaultTargetPlatform == TargetPlatform.android) {
    baseUrl = "10.0.2.2";
  } else {
    baseUrl = "127.0.0.1";
  }
  String url = "$baseUrl:$port";
  // print(url);
  return url;
}

// String baseUrl = checkDevice();

enum Swipe { left, right, none }
