import 'package:flutter/material.dart';

import '../models/event_model.dart';
import 'custom_button.dart';

class EventCard extends StatelessWidget {
  final EventModel event;
  final VoidCallback onDetailPressed;

  const EventCard({
    super.key,
    required this.event,
    required this.onDetailPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 160,
        child: Row(
          children: [
            // Gambar event di sebelah kiri
            SizedBox(
              width: 120,
              height: double.infinity,
              child: Image.asset(
                event.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFDCEBFA),
                    child: const Icon(
                      Icons.image_not_supported_outlined,
                      size: 36,
                      color: Colors.blueGrey,
                    ),
                  );
                },
              ),
            ),

            // Informasi event di sebelah kanan
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Badge kategori
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        event.category,
                        style: const TextStyle(
                          color: Color(0xFF1769AA),
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Judul event
                    Text(
                      event.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    // Tanggal dan waktu
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          size: 14,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            event.date,
                            style: const TextStyle(fontSize: 11),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.blueGrey,
                        ),
                        const SizedBox(width: 4),
                        Text(event.time, style: const TextStyle(fontSize: 11)),
                      ],
                    ),

                    const SizedBox(height: 9),

                    // Tombol detail
                    CustomButton(
                      text: 'Lihat Detail',
                      type: AppButtonType.primary,
                      onPressed: onDetailPressed,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
