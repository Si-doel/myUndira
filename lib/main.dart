import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'screens/home_screen.dart';
import 'screens/event_list_screen.dart';
import 'screens/event_detail_screen.dart';
import 'screens/service_list_screen.dart';
import 'screens/service_detail_screen.dart';
import 'models/event_model.dart';
import 'models/service_model.dart';

void main() {
  runApp(const MyUndiraApp());
}

class MyUndiraApp extends StatelessWidget {
  const MyUndiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyUNDIRA',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',

      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const HomeScreen());

          // Modul Event & Agenda
          case '/events':
            return MaterialPageRoute(
              builder: (context) => const EventListScreen(),
            );

          case '/event-detail':
            final event = settings.arguments as EventModel;

            return MaterialPageRoute(
              builder: (context) => EventDetailScreen(event: event),
            );

          // Modul Katalog Layanan Mahasiswa
          case '/services':
            return MaterialPageRoute(
              builder: (context) => const ServiceListScreen(),
            );

          case '/service-detail':
            final service = settings.arguments as ServiceModel;

            return MaterialPageRoute(
              builder: (context) => ServiceDetailScreen(service: service),
            );

          default:
            return MaterialPageRoute(
              builder: (context) => const Scaffold(
                body: Center(child: Text('Halaman tidak ditemukan')),
              ),
            );
        }
      },
    );
  }
}
