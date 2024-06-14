part of '../components.dart';

class LearnedCard extends StatelessWidget {
  const LearnedCard({
    required this.currentLearned,
    required this.targetLearned,
    this.onPressed,
    super.key,
  });

  final int currentLearned;
  final int targetLearned;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);

    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, bottom: 20, top: 8),
      child: InkWell(
        onTap: onPressed,
        borderRadius: borderRadius,
        splashColor: Colors.greenAccent.withOpacity(.5),
        splashFactory: InkRipple.splashFactory,
        child: Ink(
          padding: const EdgeInsets.all(20),
          height: 130,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[200]!,
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: const Color(0xFF2F80ED).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: SvgPicture.asset(
                  Assets.iconsSVG.calendar,
                  width: 50,
                  height: 50,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Learned today',
                        style: context.theme.textTheme.titleLarge
                            ?.copyWith(fontSize: 22),
                      ),
                      Container(
                        //    color: Colors.blueAccent,
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          children: [
                            RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              text: TextSpan(
                                text: currentLearned.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                  fontSize: 22,
                                  letterSpacing: .9,
                                ),
                                children: [
                                  TextSpan(
                                    text: '/$targetLearned  ',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          
                            const Flexible(
                              child: Text(
                                'minutes',
                                maxLines: 1,
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CircularStepProgressIndicator(
                padding: 0,
                currentStep: currentLearned,
                totalSteps: targetLearned,
                selectedStepSize: 3.7,
                unselectedStepSize: 3.7,
                width: 60,
                height: 60,
                unselectedColor: const Color(0xFFEEF0F3),
                roundedCap: (_, __) => true,
                child: Center(
                  child: Text(
                    '${(currentLearned / targetLearned * 100).round()}%',
                    style: const TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.bold,
                    ),
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
