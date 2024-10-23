import 'package:flutter/material.dart';

// Halaman utama untuk memilih ruangan
class RoomSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selamat Datang Di Halaman SmartBuilding'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Gambar yang ditampilkan di atas opsi pilih ruangan
            Image.network(
              'data:image/jpeg;base64,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hzzMnl+zSQ82GvLGt1faHPDiCPunZvXwXVOavUi2/wD8efXTW6c122lbwGSuhxZkb/A0OoX5jnEEgDs2tUvn5U2nyvi0lqZN/pHgmX7Pi4qGqaSRzd9qcRV9iiuSOcSt8e047VYW5HKOfbeoSxBoe51uYQPMP+7e+yvOeO3+mddLb+qJ+3uLLp3uDpI2ARwOiDecJEhNcaGw2+ajqViNonyt0bTO9o8PeSZZLFKTRZDprmzMZBqvYtsbClGXJFo9ynBgtWfG0L+Q4N0MRY+r1vdsb2LiRus814vbeHRp8c442lsrWHd0bwKUpQEBAQEBAQEBAQEBAQEBBjlj1NLbIsEWDRHtBSFbRvGzkXl7cPjpBLLqikdG25XGgCzt69zv7V2V4zasS8y03ilpie8PWZYzEA4nW7SWwMcAx7iB0z0uAo/+lNKUnZXJkzbW/htuTj9UbvKB5vqndLW3aQK7ljmiIl16a29Z9tNhTOcNNNqeejJpdz7ybDz9yqGwO9re0Ui8VclZy8JsvYef7TO5rJXGLmGWWPIp+u+I4Ggs5rwjeY+21bTe0xEqeGmezDYWcyydOZnOEyOLQ0F437Bwv3K14ibzEQzra9ccWn+XnE42R4JY97mvxYa3TIW6maD0Wu7LU1pWJjft2VvkvO/HwxSY2TmYblIPPSNcHSuYWAA0x76vbtpXjHXeys5bcausys3DGdQdtxDy8H+s+cuK/wC56mHvRcVGogICAgICAgICAgICAgICDzpCbo2gLQm5tCQ0BNzaABNzaENYBwHyU7nGDSOFbJubQBg7Bt7E3OMBYOwfBN5RxhIChOyUSICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg//Z',
              width: 200, // Ubah ukuran gambar sesuai keinginan
              height: 200,
              fit: BoxFit.cover, // Sesuaikan tampilan gambar
            ),
            const SizedBox(height: 20),
            
            // Tombol untuk memilih ruangan 1
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SmartbuildingPage(roomName: 'Ruangan 1')),
                );
              },
              child: const Text('Ruangan 1'),
            ),
            const SizedBox(height: 20),
            
            // Tombol untuk memilih ruangan 2
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SmartbuildingPage(roomName: 'Ruangan 2')),
                );
              },
              child: const Text('Ruangan 2'),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman pengaturan lampu dan AC
class SmartbuildingPage extends StatefulWidget {
  final String roomName;

  SmartbuildingPage({required this.roomName});

  @override
  _SmartbuildingPageState createState() => _SmartbuildingPageState();
}

class _SmartbuildingPageState extends State<SmartbuildingPage> {
  int _selectedIndex = 0;

  // State untuk mengontrol lampu dan AC
  bool _isLightOn = false;
  bool _isAcOn = false;

  // Fungsi yang hanya merespon tap jika item di-enable
  void _onItemTapped(int index) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Building - ${widget.roomName}'),
        backgroundColor: Colors.blue,
        centerTitle: true, // Menempatkan title di tengah
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Kontrol Lampu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Lampu',
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                  value: _isLightOn,
                  onChanged: (value) {
                    setState(() {
                      _isLightOn = value; // Update status lampu
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Kontrol AC
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'AC',
                  style: TextStyle(fontSize: 20),
                ),
                Switch(
                  value: _isAcOn,
                  onChanged: (value) {
                    setState(() {
                      _isAcOn = value; // Update status AC
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tampilkan status
            Text(
              'Lampu: ${_isLightOn ? "Nyala" : "Mati"}\nAC: ${_isAcOn ? "Nyala" : "Mati"}',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Tidak melakukan apa-apa saat item di-tap
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: RoomSelectionPage(),
  ));
}
