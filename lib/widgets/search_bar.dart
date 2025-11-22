import 'package:flutter/material.dart';
import '../utils/colors.dart';

class ExploreSearchBar extends StatelessWidget {
  final String placeholder;
  final String? value;
  final ValueChanged<String>? onChangeText;
  final VoidCallback? onFocus;
  final VoidCallback? onBlur;

  const ExploreSearchBar({
    super.key,
    this.placeholder = "Search",
    this.value,
    this.onChangeText,
    this.onFocus,
    this.onBlur,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 41,
      width: double.infinity, // Fill available width
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(left: 16, right: 20),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.black,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: value != null ? TextEditingController(text: value) : null,
              onChanged: onChangeText,
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.black,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                fillColor: Colors.transparent,
                hoverColor: Colors.transparent,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.black,
                height: 1.2,
              ),
              cursorColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
