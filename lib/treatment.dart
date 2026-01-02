import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TreatmentWidget extends StatefulWidget {
  const TreatmentWidget({Key? key}) : super(key: key);

  static String routeName = 'Treatment';
  static String routePath = '/treatment';

  @override
  State<TreatmentWidget> createState() => _TreatmentWidgetState();
}

class _TreatmentWidgetState extends State<TreatmentWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTextStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.white,
    );
    final headlineMediumStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.black,
    );
    final labelMediumStyle = GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black87,
      height: 1.4,
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 92, 92),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded,
                size: 30, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'Treatment for Dengue',
            style: titleTextStyle,
          ),
          centerTitle: true,
          elevation: 2,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 155.59,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Management mainly involves supportive care to relieve symptoms and prevent complications.',
                  style: headlineMediumStyle,
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    '✅ Treatment for Mild Dengue (most cases):\n\n'
                    'Rest: Get plenty of rest to help your body recover.\n\n'
                    'Hydration: Drink lots of fluids (water, oral rehydration solutions, fruit juices, soups) to prevent dehydration from fever and vomiting.\n\n'
                    'Dehydration is a common complication of dengue.\n\n'
                    'Fever and Pain Management: Use paracetamol (acetaminophen) to reduce fever and pain.\n\n'
                    'Avoid NSAIDs like ibuprofen, aspirin, and naproxen — these can increase the risk of bleeding.\n\n'
                    'Monitoring Symptoms: Watch for warning signs (see earlier message) — especially during the critical phase (around days 3–7 of illness), when fever starts to go down and complications may arise.\n\n'
                    '🚨 Treatment for Severe Dengue:\n\n'
                    'If warning signs or severe symptoms occur, hospitalization is required. Treatment may include:\n\n'
                    'Intravenous (IV) fluids for severe dehydration or shock\n\n'
                    'Blood transfusions if there is significant bleeding\n\n'
                    'Close monitoring of blood pressure, platelet count, and organ function\n\n'
                    '❌ No:\n\n'
                    'No antibiotics (dengue is viral, not bacterial)\n\n'
                    'No vaccine available for general public use in many countries (some vaccines exist but are limited by age, past exposure, or availability)\n\n',
                    style: labelMediumStyle,
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
