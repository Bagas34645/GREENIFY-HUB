import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = ["Event baru: Bersih Pantai"];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifikasi'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.notifications_active,
                color: Colors.green,
              ),
              title: Text(notifications[index]),
              subtitle: const Text("1 jam yang lalu"),
            ),
          );
        },
      ),
    );
  }
}
