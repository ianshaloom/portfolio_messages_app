import 'package:flutter/material.dart';

import 'presentation/views/portlio_messages_page.dart';
import 'theme/color_schemes.dart';

class PortfolioMessages extends StatelessWidget {
  const PortfolioMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Port Messages',
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const PortMessagesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
