import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../config/ui_config.dart';

class LanguageEditDialog extends StatefulWidget {
  final Function(String) updateLanguage;
  const LanguageEditDialog({super.key, required this.updateLanguage});

  @override
  State<LanguageEditDialog> createState() => _LanguageEditDialogState();
}

class _LanguageEditDialogState extends State<LanguageEditDialog> {
  late String selectedLanguage; // 선택된 언어를 저장할 변수

  @override
  void initState() {
    super.initState();
    selectedLanguage = 'ko';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      backgroundColor: UiConfig.black.shade100,
      surfaceTintColor: UiConfig.black.shade100,
      icon: const Icon(Icons.language_outlined, color: UiConfig.primaryColor),
      title: Text(
        'Language',
        style: UiConfig.h3Style.copyWith(fontWeight: UiConfig.semiBoldFont),
      ),
      //content: LanguageDropDownMenu(),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedLanguage = 'ko';
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  // 선택된 언어일 때 파란색으로 설정
                  if (selectedLanguage == 'ko') {
                    return Colors.blue;
                  }
                  // 그렇지 않으면 기본색으로 설정
                  return Colors.white;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  // 선택된 언어일 때 파란색으로 설정
                  if (selectedLanguage == 'ko') {
                    return Colors.white;
                  }
                  // 그렇지 않으면 기본색으로 설정
                  return Colors.blue;
                },
              ),
            ),
            child: const Text('Korean'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                selectedLanguage = 'en';
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  // 선택된 언어일 때 파란색으로 설정
                  if (selectedLanguage == 'en') {
                    return Colors.blue;
                  }
                  // 그렇지 않으면 기본색으로 설정
                  return Colors.white;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  // 선택된 언어일 때 파란색으로 설정
                  if (selectedLanguage == 'en') {
                    return Colors.white;
                  }
                  // 그렇지 않으면 기본색으로 설정
                  return Colors.blue;
                },
              ),
            ),
            child: const Text('English'),
          )
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Navigator.pop(context, '취소'),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: UiConfig.black.shade600,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '취소',
                    style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            InkWell(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: selectedLanguage == 'ko'
                          ? const Text('언어가 한국어로 변경되었습니다.')
                          : const Text('Language changed to English.')),
                );
                widget.updateLanguage(selectedLanguage);
                context.go('/splash');
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 12.0),
                decoration: BoxDecoration(
                  color: UiConfig.primaryColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    '변경',
                    style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
