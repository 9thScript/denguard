import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Article1Widget extends StatelessWidget {
  const Article1Widget({super.key});

  static String routeName = 'Article1';
  static String routePath = '/article1';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFEF393C),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(''),
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 240,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Travel warning issued as popular tourist spot battles deadly virus: ‘Half the world’s population now at risk’',
                        style: GoogleFonts.inter(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'By Marissa Matozzo\nPublished May 8, 2025, 7:15 p.m. ET',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(height: 0),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Be careful!',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Color(0xFFEF393C),
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '''Travelers headed to Fiji this summer better pack more than just their swimsuits — they might want to add some serious bug spray. 

The Centers for Disease Control and Prevention just issued a warning for the tropical hot spot as dengue fever cases spike across the Western Pacific.

Dengue, a potentially deadly virus spread by mosquitoes, has Fiji’s government on high alert. 

“About half the world’s population is now at risk for dengue with an expected 100 to 400 million infections occurring each year,” the World Health Organization wrote in a recent statement, as countries like Mexico, Canada and much of the Caribbean and Latin America are also seeing a rise in cases.

According to the agency, dengue fever typically starts with a high fever, headache, severe muscle and joint pain, nausea, vomiting and a rash.

Some people may also feel pain behind their eyes.

There isn’t a cure for it, and in mild cases, over-the-counter pain medications can relieve some symptoms.

In severe cases — known as dengue hemorrhagic fever — symptoms can escalate to bleeding, breathing difficulties and intense abdominal pain.

The Central Division alone has logged over 1,000 dengue cases from January to late March, according to the Fiji Government.''',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
