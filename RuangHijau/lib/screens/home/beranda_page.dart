import 'package:flutter/material.dart';
import 'comment_page.dart';

class BerandaPage extends StatefulWidget {
  const BerandaPage({super.key});

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  List<Map<String, dynamic>> posts = [
    {
      "username": "Eco Station",
      "imageUrl": "https://picsum.photos/400/250",
      "caption": "Kami baru saja mengadakan kegiatan bersih taman!",
      "likes": 1265,
      "comments": 278,
      "isLiked": false,
    },
    {
      "username": "Nature Squad",
      "imageUrl": "https://picsum.photos/401/250",
      "caption": "Aksi tanam pohon bersama komunitas lokal 🌱",
      "likes": 980,
      "comments": 152,
      "isLiked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'RuangHijau',
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
            _buildCommunitySection(),
            const Divider(),
            ...List.generate(posts.length, (index) {
              return _buildPostItem(index);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunitySection() {
    return Padding(
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
    );
  }

  Widget _buildPostItem(int index) {
    var post = posts[index];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.green,
                child: Icon(Icons.eco, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Text(
                post["username"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
          const SizedBox(height: 10),

          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              post["imageUrl"],
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    post["isLiked"] = !post["isLiked"];
                    post["isLiked"] ? post["likes"]++ : post["likes"]--;
                  });
                },
                child: Icon(
                  post["isLiked"] ? Icons.favorite : Icons.favorite_border,
                  color: post["isLiked"] ? Colors.red : Colors.black,
                ),
              ),
              const SizedBox(width: 6),
              Text('${post["likes"]}'),

              const SizedBox(width: 16),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CommentPage(
                        username: post["username"],
                        imageUrl: post["imageUrl"],
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.comment_outlined),
              ),
              const SizedBox(width: 6),
              Text('${post["comments"]}'),

              const SizedBox(width: 16),

              GestureDetector(
                onTap: () {
                  _showShareOption();
                },
                child: const Icon(Icons.share_outlined),
              ),

              const Spacer(),
              const Icon(Icons.bookmark_border),
            ],
          ),

          const SizedBox(height: 6),

          Text(post["caption"], style: const TextStyle(fontSize: 14)),

          const SizedBox(height: 8),
        ],
      ),
    );
  }

  void _showShareOption() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Share'),
        content: const Text("Fitur share akan ditambahkan ke depannya 😊"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
