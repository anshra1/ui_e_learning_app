part of '../components.dart';

class DotContainer extends StatelessWidget {
  const DotContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        width: 3,
        height: 3,
        decoration: const BoxDecoration(
          color: AppColors.grey,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
