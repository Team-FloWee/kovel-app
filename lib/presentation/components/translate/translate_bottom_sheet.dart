import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/provider/ai_provider.dart';
import 'package:provider/provider.dart';

class TranslateBottomSheet extends StatefulWidget {
  final String text;

  const TranslateBottomSheet({super.key, required this.text});

  @override
  State<TranslateBottomSheet> createState() => _TranslateBottomSheetState();
}

class _TranslateBottomSheetState extends State<TranslateBottomSheet> {
  final ScrollController _translatedDataController = ScrollController();
  List<String> _languageList = ['한국어', 'English', '日本語'];
  String _selectedLanguage = 'English';
  bool _isMore = false;

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AiProvider>().getTranslatedDataStream(request: widget.text, language: _selectedLanguage));
  }

  @override
  Widget build(BuildContext context) {
    final aiProvider = context.watch<AiProvider>();
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(16),
      width: 1.sw,
      height: _isMore ? 0.95.sh : 0.6.sh,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                context.pop();
              },
                child: const Icon(Icons.close),
            )
          ),
          Column(
            children: [
              Text('Translate',
                  style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont)),
              const SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: UiConfig.black.shade100,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _isMore ? Text(
                              widget.text,
                              style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
                            ) : Row(
                              children: [
                                Expanded(
                                  child: ShaderMask(
                                    shaderCallback: (bounds) {
                                      return LinearGradient(
                                          begin: const Alignment(0.5, 0.5),
                                          end: const Alignment(1.0, 0.5),
                                          colors: [UiConfig.black.shade900, Colors.transparent],
                                          stops: const [0.0, 1.0]
                                      ).createShader(bounds);
                                    },
                                    child: Text(
                                      widget.text,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isMore = true;
                                    });
                                  },
                                  child: Text(
                                    'more',
                                    style: UiConfig.bodyStyle.copyWith(
                                      color: UiConfig.primaryColor,
                                      fontWeight: UiConfig.semiBoldFont
                                    )
                                  )
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            Divider(thickness: 1, height: 1, color: UiConfig.black.shade500),
                            DropdownButton<String>(
                                underline: const SizedBox(),
                                style: UiConfig.smallStyle.copyWith(
                                    fontWeight: UiConfig.semiBoldFont,
                                ),
                                value: _selectedLanguage,
                                items: _languageList.map((e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                )).toList(),
                                isExpanded: false,
                                onChanged: (String? value) {
                                  setState(() {
                                    _selectedLanguage = value ?? 'English';
                                  });
                                  context.read<AiProvider>().getTranslatedDataStream(request: widget.text, language: _selectedLanguage);
                                }
                            ),
                            _buildTranslatedSection(
                                isMore: _isMore,
                                translatedData: aiProvider.translatedData,
                                controller: _translatedDataController
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Ink(
                        decoration: BoxDecoration(
                          color: UiConfig.black.shade100,
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: aiProvider.translatedData));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: Row(
                              children: [
                                Text('Copy Translation', style: UiConfig.bodyStyle),
                                const Spacer(),
                                const Icon(Icons.copy),
                              ],
                            )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildTranslatedSection({
  required bool isMore, required String translatedData, required ScrollController controller
}) {
  return Stack(
    children: [
      Opacity(
        opacity: translatedData == '' ? 1 : 0,
        child: const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator()
        ),
      ),
      isMore ? Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          children: [
            Text(
                translatedData,
                style: UiConfig.h4Style.copyWith(
                    fontWeight: UiConfig.semiBoldFont)
            ),
          ],
        ),
      ) : Container(
        constraints: BoxConstraints(
          maxHeight: 180.h
        ),
        child: Scrollbar(
          controller: controller,
          thumbVisibility: true,
          child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  children: [
                    Text(
                        translatedData,
                        style: UiConfig.h4Style.copyWith(
                            fontWeight: UiConfig.semiBoldFont)
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    ],
  );
}