import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../config/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.icon,
    this.svg = '',
    this.borderRadius = 16,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final String svg;
  final double borderRadius;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: active ? AppColors.accent : AppColors.primaryWhite8,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: active ? onPressed : null,
        child: SizedBox(
          // width: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: AppColors.primaryWhite,
                ),
                const SizedBox(width: 4),
              ],
              if (svg.isNotEmpty) ...[
                SvgPicture.asset('assets/icons/$svg.svg'),
                const SizedBox(width: 4),
              ],
              Text(
                title,
                style: TextStyle(
                  color: active ? AppColors.primaryWhite : AppColors.accent,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class PrimaryButton2 extends StatelessWidget {
//   const PrimaryButton2({
//     super.key,
//     required this.title,
//     this.icon,
//     this.borderRadius = 12,
//     required this.onPressed,
//   });

//   final String title;
//   final IconData? icon;
//   final double borderRadius;
//   final void Function() onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       padding: EdgeInsets.zero,
//       minSize: 48,
//       borderRadius: BorderRadius.circular(borderRadius),
//       color: AppColors.accent,
//       onPressed: onPressed,
//       child: SizedBox(
//         width: 400,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (icon != null) ...[
//               Icon(
//                 icon,
//                 color: AppColors.primaryWhite,
//               ),
//               const SizedBox(width: 4),
//             ],
//             Text(
//               title,
//               style: const TextStyle(
//                 color: AppColors.primaryWhite,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
