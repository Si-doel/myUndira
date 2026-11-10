import 'package:flutter/material.dart';

import '../models/event_model.dart';
import '../widgets/custom_button.dart';

class EventDetailScreen extends StatelessWidget {
  final EventModel event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF4FF),
      appBar: AppBar(
        title: const Text(
          'Detail Event',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar event
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                event.image,
                width: double.infinity,
                height: 230,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 230,
                    width: double.infinity,
                    color: const Color(0xFFDCEBFA),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 48,
                      color: Colors.blueGrey,
                    ),
                  );
                },
              ),
            ),

            // Informasi event
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kategori dan status
                  Row(
                    children: [
                      _buildBadge(
                        event.category,
                        const Color(0xFFEAF4FF),
                        const Color(0xFF1769AA),
                      ),
                      const SizedBox(width: 8),
                      _buildBadge(
                        event.status,
                        const Color(0xFFE5F6EC),
                        const Color(0xFF23834A),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Judul event
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF123B70),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Deskripsi
                  const Text(
                    'Deskripsi Event',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.description,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.6,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Informasi lengkap
                  const Text(
                    'Informasi Event',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  _buildInfoItem(Icons.calendar_month, 'Tanggal', event.date),
                  _buildInfoItem(Icons.access_time, 'Waktu', event.time),
                  _buildInfoItem(
                    Icons.location_on_outlined,
                    'Lokasi',
                    event.location,
                  ),
                  _buildInfoItem(
                    Icons.groups_outlined,
                    'Penyelenggara',
                    event.organizer,
                  ),

                  const SizedBox(height: 28),

                  // Tombol kembali
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      text: 'Kembali',
                      type: AppButtonType.secondary,
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget badge
  Widget _buildBadge(String text, Color backgroundColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // Widget informasi event
  Widget _buildInfoItem(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: const Color(0xFF1769AA)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
