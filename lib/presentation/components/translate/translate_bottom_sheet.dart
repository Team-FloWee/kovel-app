import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/core/service/ai_provider.dart';
import 'package:provider/provider.dart';

class TranslateBottomSheet extends StatefulWidget {
  final String text;

  const TranslateBottomSheet({super.key, required this.text});

  @override
  State<TranslateBottomSheet> createState() => _TranslateBottomSheetState();
}

class _TranslateBottomSheetState extends State<TranslateBottomSheet> {
  List<String> _languageList = ['한국어', 'English', '日本語'];
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AiProvider>().getTranslatedDataStream(request: widget.text, language: _selectedLanguage));
  }

  @override
  Widget build(BuildContext context) {
    final aiProvider = context.watch<AiProvider>();
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                context.pop();
              },
                child: Icon(Icons.close),
            )
          ),
          Column(
            children: [
              Text('Translate',
                  style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont)),
              Column(
                children: [
                  Row(
                    children: [
                      Text('Detected as'),
                      DropdownButton<String>(
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
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: 300,
                          child: Text(
                            widget.text,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'more',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Container(height: 150,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Text(aiProvider.translatedData),
                      ],
                    )),
              ),
              Spacer(),
              Row(
                children: [
                  Text('Copy Translation'),
                  Spacer(),
                  Icon(Icons.copy),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
