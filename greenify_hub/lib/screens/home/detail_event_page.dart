import 'package:flutter/material.dart';

class DetailEventPage extends StatelessWidget {
  const DetailEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFEDE7F6),
        title: const Text(
          'Detail Acara',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Acara
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: const DecorationImage(
                  image: AssetImage('assets/images/sample_event.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Judul Acara
            const Text(
              'Greenify: Aksi Hijau Bersama',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Tanggal dan Jenis
            Row(
              children: const [
                Icon(Icons.calendar_today_outlined, size: 18),
                SizedBox(width: 5),
                Text('17 Agustus 2025, 09:45 WIB'),
                Spacer(),
                Chip(label: Text('Public'), backgroundColor: Color(0xFFB2DFDB)),
              ],
            ),
            const SizedBox(height: 20),

            // Deskripsi
            const Text(
              'Deskripsi Acara',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            const Text(
              'Kegiatan penanaman pohon bersama komunitas pecinta lingkungan. '
              'Ayo ikut berkontribusi dalam menjaga bumi kita dengan aksi nyata hijau!',
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
            const SizedBox(height: 20),

            // Lokasi
            const Text(
              'Lokasi',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 6),
            Row(
              children: const [
                Icon(Icons.location_on_outlined, size: 20),
                SizedBox(width: 5),
                Text('Taman Kota Bandung'),
              ],
            ),
            const SizedBox(height: 25),

            // Gambar peserta
            const Text(
              'Peserta Terdaftar',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(
                        'assets/images/user${index + 1}.jpg',
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),

            // Tombol Aksi
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Arahkan ke halaman QR
                      Navigator.pushNamed(context, '/qr');
                    },
                    icon: const Icon(Icons.qr_code, color: Colors.white),
                    label: const Text('Lihat QR Code'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Arahkan ke halaman komentar
                      Navigator.pushNamed(context, '/comment');
                    },
                    icon: const Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.white,
                    ),
                    label: const Text('Komentar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
