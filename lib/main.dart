import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageSelectionPage(),
    );
  }
}

// Halaman Pemilihan Bahasa
class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  bool isEnglishSelected = false;
  bool isIndonesianSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "👨‍🌾 Halo!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Pilih Bahasa untuk AgriDetect Anda",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            // English Option
            LanguageOption(
              title: "English",
              isSelected: isEnglishSelected,
              onChanged: (value) {
                setState(() {
                  isEnglishSelected = value;
                  isIndonesianSelected = !value;
                });
              },
            ),
            const SizedBox(height: 16),
            // Indonesian Option
            LanguageOption(
              title: "Indonesia",
              isSelected: isIndonesianSelected,
              onChanged: (value) {
                setState(() {
                  isIndonesianSelected = value;
                  isEnglishSelected = !value;
                });
              },
            ),
            const SizedBox(height: 32),
            // Accept Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OnboardingPage(),
                  ),
                );
              },
              child: const Text(
                "Terima",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            // Footer Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Saya membaca dan menerima ketentuan penggunaan dan kebijakan privasi.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const LanguageOption({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
          Switch(
            value: isSelected,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

// Halaman Onboarding
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> onboardingData = [
      {
        "title": "Deteksi Instan Penyakit",
        "icon": "🌱",
      },
      {
        "title": "Konsultasi Tanaman",
        "icon": "💬",
      },
      {
        "title": "Tips Pertumbuhan yang Bermanfaat",
        "icon": "💡",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        itemCount: onboardingData.length,
        itemBuilder: (context, index) {
          final item = onboardingData[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item["icon"]!,
                  style: const TextStyle(fontSize: 80),
                ),
                const SizedBox(height: 24),
                Text(
                  item["title"]!,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (index != onboardingData.length - 1)
                      TextButton(
                        onPressed: () {
                          // Skip logic (if needed)
                        },
                        child: const Text(
                          "Lewati",
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    else
                      const SizedBox(width: 60),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        if (index == onboardingData.length - 1) {
                          // Handle final step
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Berikutnya"),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
