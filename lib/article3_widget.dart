import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Article3Widget extends StatelessWidget {
  const Article3Widget({super.key});

  static String routeName = 'Article3';
  static String routePath = '/article3';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFEF393C),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          elevation: 2,
          centerTitle: true,
          title: const Text(''),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              Text(
                'Dengue fever: with a record 12.4m cases in 2024 so far, what is driving the world’s largest outbreak?',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Authored by Kat Lay, Tiago Rogero, and Kenneth Mohammed. It was published by The Guardian on October 23, 2024',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Be careful!',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFEF393C),
                  decoration: TextDecoration.underline,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '''
The fatigue was so bad I couldn’t stand, and that’s terrible when you need to take care of a child, right? My head hurt, my eyes hurt – I couldn’t keep them open for long,” remembers Ana Luísa Braga.

The 38-year-old, a social worker and mother of a three-year-old, from Belo Horizonte, the capital of Minas Gerais state in Brazil, fell ill with dengue fever in March.

She is one of millions to feel the effects of the virus this year as the world grapples with its largest ever outbreak. Cases reached their highest number on record in 2023, with 6.5m reported globally – and 2024 looks likely to double that figure, with 12.4m cases so far.

The mosquitoes that spread the virus are benefiting from increased urbanisation, and changes in climate and temperature. At the same time high obesity rates and other chronic health conditions are making people more vulnerable, scientists say.

Dengue is sometimes known as “breakbone fever” – a description that resonated with Braga. “I consider myself to have a high pain tolerance, but the pain was so intense.”

She needed hospital treatment, after deteriorating to the point that she was vomiting and could no longer eat or drink. “Even after being hospitalised for five days, I only gradually started getting better. The fatigue, in particular, didn’t leave me for about 15 days,” she says.

The World Health Organization estimates that 4 billion people are at risk of dengue and related viruses, rising to 5 billion.
''',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
