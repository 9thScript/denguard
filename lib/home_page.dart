import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = '/home';

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _selectedIndex = 0;

  // Function to handle navigation based on index
  void _onItemTapped(int index) {
    // Map the index to routes
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Home page
        break;
      case 1:
        Navigator.pushNamed(context, '/forecasting'); // Forecast page
        break;
      case 2:
        Navigator.pushNamed(context, '/about'); // About page
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: const Color(0xFFF1F4F8),
          appBar: AppBar(
            title:
                const Text('DenGuard', style: TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(255, 238, 92, 92),
            automaticallyImplyLeading: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              color: Colors.white,
              onPressed: () => Navigator.pop(context),
            ),
            elevation: 0,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0),
                            child: Image.network(
                              'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/den-guard-pl5d5i/assets/2cmkqxjtybez/dengaurdlogo-removebg-preview.png',
                              height: 229.2,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'DenGuard',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFF83B46),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/symptoms');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 238, 92, 92),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                child: Text(
                                  'Symptoms',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/treatment');
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 238, 92, 92),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                child: Text(
                                  'Treatments',
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'Featured Articles',
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 238, 92, 92),
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildArticleCard(
                      context,
                      title: 'Fiji Issues Travel Warning Amid Dengue Surge',
                      source: 'New York Post | May 2025',
                      route: '/article1',
                    ),
                    const SizedBox(height: 12),
                    _buildArticleCard(
                      context,
                      title:
                          'Philippines officials offer cash for mosquitoes amid rise in dengue cases',
                      source: 'The Guardian | February 2025',
                      route: '/article2',
                    ),
                    const SizedBox(height: 12),
                    _buildArticleCard(
                      context,
                      title:
                          'Dengue fever: with a record 12.4m cases in 2024 so far, what is driving the world’s largest outbreak?',
                      source: 'The Guardian | May 2024',
                      route: '/article3',
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildArticleCard(BuildContext context,
      {required String title, required String source, required String route}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0x1A000000),
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    source,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF677681),
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.arrow_forward_rounded,
                color: Color(0xFFF83B46),
              ),
              onPressed: () {
                Navigator.pushNamed(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
