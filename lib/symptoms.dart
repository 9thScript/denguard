import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SymptomsWidget extends StatelessWidget {
  const SymptomsWidget({Key? key}) : super(key: key);

  static const String routeName = 'Symptoms';
  static const String routePath = '/symptoms';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 238, 92, 92),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: const Color.fromARGB(255, 255, 255, 255),
              size: 30,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Symptoms of Dengue',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The symptoms of dengue fever typically appear 4–10 days after the bite of an infected mosquito (usually Aedes aegypti or Aedes albopictus). Symptoms can range from mild to severe and may include:',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Common Symptoms:\n- High fever (up to 104°F or 40°C)\n- Severe headache\n- Pain behind the eyes (retro-orbital pain)\n- Severe muscle and joint pain ("breakbone fever")\n- Nausea and vomiting\n- Skin rash (appears 2–5 days after fever starts)\n- Fatigue and weakness\n- Swollen glands',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Warning Signs of Severe Dengue (Dengue Hemorrhagic Fever or Dengue Shock Syndrome):\nThese usually develop 3–7 days after the initial symptoms and require urgent medical attention:\n- Severe abdominal pain\n- Persistent vomiting\n- Bleeding from nose or gums\n- Blood in vomit or stool\n- Rapid breathing\n- Fatigue, restlessness, or irritability\n- Pale, cold, or clammy skin',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'If dengue is suspected, especially with warning signs, it is important to seek medical care immediately, as severe dengue can be life-threatening without proper treatment.',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
