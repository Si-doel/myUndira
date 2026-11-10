import 'package:flutter/material.dart';

import '../config/app_theme.dart';
import '../widgets/module_card.dart';
import '../widgets/section_header.dart';
import '../widgets/custom_button.dart';
import '../models/event_model.dart';
import '../services/event_service.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final EventService _eventService = EventService();
  late Future<List<EventModel>> _eventsFuture;

  @override
  void initState() {
    super.initState();
    _eventsFuture = _eventService.getEvents();
  }

  void showComingSoon(String module) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$module akan segera hadir.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void navigateModule(String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightBlue,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER

              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'assets/images/Logo.png',
                      height: 55,
                      alignment: Alignment.centerLeft,
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      showComingSoon('Notifikasi');
                    },
                    tooltip: 'Notifikasi',
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppTheme.navyBlue,
                      size: 27,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // GREETING
              const Text(
                'Halo, Mahasiswa! 👋',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.navyBlue,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Temukan informasi, kegiatan, dan layanan '
                'kampus dalam satu aplikasi.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blueGrey.shade700,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 22),

              // CAMPUS BANNER
              Container(
                height: 190,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: AppTheme.primaryGradient,
                ),
                child: Stack(
                  children: [
                    // Background Image
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/Gedung.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),

                    // Blue Gradient Overlay
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppTheme.navyBlue.withValues(alpha: 0.95),
                              AppTheme.primaryBlue.withValues(alpha: 0.75),
                              Colors.transparent,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: const [0.0, 0.45, 1.0],
                          ),
                        ),
                      ),
                    ),

                    // Banner Content
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'MyUNDIRA',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const SizedBox(height: 10),

                          const Text(
                            'Your Campus,\nYour Experience.',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              height: 1.25,
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Explore Button
                          CustomButton(
                            text: 'Jelajahi Sekarang',
                            icon: Icons.arrow_forward,
                            onPressed: () {
                              navigateModule('/events');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // MODULE SECTION
              SectionHeader(title: 'Jelajahi MyUNDIRA'),

              const SizedBox(height: 15),

              // ROW 1
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ModuleCard(
                      title: 'Event & Agenda',
                      description: 'Lihat kegiatan kampus',
                      icon: Icons.calendar_month_rounded,
                      isActive: true,
                      onTap: () {
                        navigateModule('/events');
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ModuleCard(
                      title: 'Layanan Mahasiswa',
                      description: 'Temukan informasi layanan',
                      icon: Icons.headset_mic_rounded,
                      isActive: true,
                      onTap: () {
                        navigateModule('/services');
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ROW 2
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ModuleCard(
                      title: 'Fasilitas Kampus',
                      description: 'Jelajahi fasilitas kampus',
                      icon: Icons.location_city_rounded,
                      onTap: () {
                        showComingSoon('Fasilitas Kampus');
                      },
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ModuleCard(
                      title: 'UMKM & Kantin',
                      description: 'Temukan kuliner kampus',
                      icon: Icons.storefront_rounded,
                      onTap: () {
                        showComingSoon('UMKM & Kantin');
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // ROW 3
              ModuleCard(
                title: 'UKM & Komunitas',
                description: 'Kenali organisasi dan komunitas mahasiswa',
                icon: Icons.groups_rounded,
                onTap: () {
                  showComingSoon('UKM & Komunitas');
                },
              ),

              const SizedBox(height: 30),

              // EVENT & AGENDA SECTION
              SectionHeader(
                title: 'Event Terbaru',
                onSeeAll: () {
                  navigateModule('/events');
                },
              ),

              const SizedBox(height: 15),

              FutureBuilder<List<EventModel>>(
                future: _eventsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Gagal memuat event kampus.'),
                    );
                  }

                  final events = snapshot.data ?? [];

                  if (events.isEmpty) {
                    return const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Belum ada event tersedia.'),
                    );
                  }

                  return Column(
                    children: events.take(2).map((event) {
                      return EventCard(
                        event: event,
                        onDetailPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/event-detail',
                            arguments: event,
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),

              const SizedBox(height: 25),

              // INFORMATION
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.campaign_rounded,
                      color: Colors.white,
                      size: 38,
                    ),

                    const SizedBox(width: 15),

                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jangan Lewatkan Event Kampus!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Ikuti berbagai kegiatan menarik di UNDIRA.',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        backgroundColor: Colors.white,
        indicatorColor: AppTheme.lightBlue,

        onDestinationSelected: (index) {
          if (index == 0) {
            setState(() => currentIndex = 0);
          } else if (index == 1) {
            Navigator.pushNamed(context, '/events');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/services');
          } else if (index == 3) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Halaman Profil akan segera hadir.'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Event',
          ),
          NavigationDestination(
            icon: Icon(Icons.headset_mic_outlined),
            label: 'Layanan',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
