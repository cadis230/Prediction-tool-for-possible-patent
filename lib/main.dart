import 'package:flutter/material.dart';

void main() {
  runApp(const PatentabilityApp());
}

class PatentabilityApp extends StatelessWidget {
  const PatentabilityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Patentability Prediction',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCF8FF),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF6F0FA),
        elevation: 0,
        title: const Text(
          "Patentability Prediction",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Color(0xFF17151C),
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Welcome title
            const Text(
              "Welcome to Patentability Prediction",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Color(0xFF171525),
              ),
            ),

            const SizedBox(height: 16),

            // Description
            const Text(
              "Upload your patent document to predict its patentability.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF514B61),
              ),
            ),

            const SizedBox(height: 48),

            // PDF upload box
            Container(
              width: 330,
              height: 310,
              decoration: BoxDecoration(
                color: const Color(0xFFF0EDFF),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xFF7654D9),
                  width: 1.5,
                ),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  // PDF icon
                  const Icon(
                    Icons.picture_as_pdf_outlined,
                    size: 70,
                    color: Color(0xFF6846C6),
                  ),

                  const SizedBox(height: 20),

                  // Upload text
                  const Text(
                    "Upload PDF",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF171525),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Choose PDF button
                  ElevatedButton(
                    onPressed: () {
                      // PDF picker will be added here
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6846C6),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),

                    child: const Text(
                      "Choose PDF",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
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
}