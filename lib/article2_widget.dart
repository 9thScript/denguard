import 'package:flutter/material.dart';

class Article2Widget extends StatefulWidget {
  const Article2Widget({super.key});

  static String routeName = 'Article2';
  static String routePath = '/article2';

  @override
  State<Article2Widget> createState() => _Article2WidgetState();
}

class _Article2WidgetState extends State<Article2Widget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xFFEF393C),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          elevation: 2,
          title: const Text(''),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Philippines officials offer cash for mosquitoes amid rise in dengue cases',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'published by The Guardian on February 20, 2025, was written by Leila Goldstein.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Kaibigan, ingat ka.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFEF393C),
                        decoration: TextDecoration.underline,
                      ),
                ),
                const SizedBox(height: 12),
                Text(
                  '''Village officials in the Philippines are handing out cash rewards to residents who capture mosquitoes in a bid to combat an outbreak of dengue.

At the Wednesday launch, residents from the village of Addition Hills in metropolitan Manila lined up with plastic cups and bags containing their captures as they waited to receive their bounty: one Philippine peso (1.7 US cents) for every five mosquitoes.

Organisers handed out coins to participants and used an ultraviolet mosquito zapper to kill off live mosquitoes. One resident walked away with nine pesos, worth approximately 15 US cents, for the 45 larvae he turned over.

Village chair Carlito Cernal said in a social media post that the village had organised the programme due to an increase in dengue cases in the area.

Cases of the potentially deadly viral infection have been increasing across the country. The department of health recorded more than 28,000 cases in January, an increase of 40% compared with the same time period last year.

Earlier this week, the department announced a “concerning rise” in dengue in nine areas in the Philippines. Quezon City, the country’s most populous city, declared a dengue outbreak on Saturday after 10 deaths since the beginning of the year.

However, there are concerns the village bounty programme may inadvertently backfire, if people start propagating mosquitoes to reap the rewards, department spokesperson Albert Domingo said.

Domingo said he was not condemning the move, but added: “If you are willing to give prize money for something, maybe we could consider contests for cleanliness,” with neighborhoods competing to clear away areas with stagnant water.

The project also sparked concern on social media, with commenters warning of potential mosquito farming for profit. “We must make sure that our solutions are sustainable and have no unintended consequences,” read one comment on one of Cernal’s posts about the initiative. “Reevaluate this project because I don’t find it effective” another comment read.

In response to the criticisms, Cernal emphasised in a Facebook post that he had “no ill intentions” with the programme.''',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
