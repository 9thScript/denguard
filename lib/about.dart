import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutWidget extends StatelessWidget {
  const AboutWidget({super.key});

  static String routeName = 'About';
  static String routePath = '/about';

  TextStyle sectionTitleStyle() => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        color: const Color(0xFFEF393C),
      );

  TextStyle sectionBodyStyle() => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('About Us', style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(255, 238, 92, 92),
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () => Navigator.pop(context),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.95, 0),
                      child: Image.network(
                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/den-guard-pl5d5i/assets/2cmkqxjtybez/dengaurdlogo-removebg-preview.png',
                        height: 240,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text('About',
                          style: GoogleFonts.inter(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                      child: Text('Learn more about the \napp.',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          )),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Purpose', style: sectionTitleStyle()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'DenGuard is a mobile app that helps people stay informed about possible dengue outbreaks in the Philippines. By showing future predictions based on real data, this app can help communities, hospitals, and local leaders prepare early and take action to reduce dengue risks.',
                    style: sectionBodyStyle(),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('What is Prophet?', style: sectionTitleStyle()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'The app uses a method called Prophet, which is a tool made by Meta to help make predictions based on past data. In simple words, Prophet looks at the number of dengue cases from the past and finds patterns, like when the numbers go up or down. Then, it uses those patterns to guess what might happen next.',
                    style: sectionBodyStyle(),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Disclaimer', style: sectionTitleStyle()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'The forecasts shown in this app are based on historical data and are meant to help with planning and awareness.',
                    style: sectionBodyStyle(),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
