import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Greenify Hub',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian "Your Community"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Community',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.green[200],
                            child: const Icon(Icons.group, color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const Divider(),

            // Postingan
            _buildPostItem(
              username: "Eco Station",
              imageUrl: "https://picsum.photos/400/250",
              caption: "Kami baru saja mengadakan kegiatan bersih taman!",
              likes: 1265,
              comments: 278,
            ),
            _buildPostItem(
              username: "Nature Squad",
              imageUrl: "https://picsum.photos/401/250",
              caption: "Aksi tanam pohon bersama komunitas lokal 🌱",
              likes: 980,
              comments: 152,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem({
    required String username,
    required String imageUrl,
    required String caption,
    required int likes,
    required int comments,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header akun
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
                child: Icon(Icons.eco, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(
                username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 10),

          // Gambar postingan
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // Icon interaksi
          Row(
            children: [
              const Icon(Icons.favorite_border),
              const SizedBox(width: 6),
              Text('$likes'),
              const SizedBox(width: 16),
              const Icon(Icons.comment_outlined),
              const SizedBox(width: 6),
              Text('$comments'),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined),
              const Spacer(),
              const Icon(Icons.bookmark_border),
            ],
          ),
          const SizedBox(height: 6),

          // Caption
          Text(caption, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
