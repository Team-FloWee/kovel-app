import 'package:flutter/material.dart';
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
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AiProvider>().getTranslatedDataStream(request: widget.text, language: 'english'));
  }

  @override
  Widget build(BuildContext context) {
    final aiProvider = context.watch<AiProvider>();
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              Text('Translate',
                  style: UiConfig.h4Style.copyWith(
                      fontWeight: UiConfig.semiBoldFont)),
              Spacer(),
              Icon(Icons.close)
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text('Detected as'),
                  DropdownButton<String>(
                    items: [
                      DropdownMenuItem<String>(
                          value: 'English',
                          child: Text('English (US)')),
                      DropdownMenuItem<String>(
                          value: 'Korea',
                          child: Text('Korean (KR)')),
                    ],
                    isExpanded: false,
                    onChanged: (dynamic value) {},
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
    );
  }
}
