import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config/ui_config.dart';

class DetailText extends StatelessWidget {
  final String badgeTitle;
  final String title;
  final String tel;
  final String address;

  const DetailText({
    super.key,
    required this.badgeTitle,
    required this.title,
    required this.tel,
    required this.address,
  });

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $uri');
      //Todo 에러처리
    }
  }

  @override
  Widget build(BuildContext context) {
    final Uri telUri = Uri.parse('tel:+82 $tel');
    final Uri addressUri = Uri.parse(
        'https://m.map.kakao.com/actions/searchView?q=$address#!/LQMLML,QNSMURM/map/place');
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              color: UiConfig.primaryColor,
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 5, top: 3, left: 10, right: 10),
                child: Text(
                  badgeTitle,
                  style: UiConfig.smallStyle.copyWith(
                      fontWeight: UiConfig.semiBoldFont,
                      color: UiConfig.black.shade100),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: UiConfig.h4Style.copyWith(fontWeight: UiConfig.semiBoldFont),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 8,
          ),
          tel != ''
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1.5),
                        child: Icon(Icons.phone,
                            size: 18, color: UiConfig.black.shade800),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _launchUrl(telUri);
                          },
                          child: Text(
                            tel,
                            style: UiConfig.bodyStyle.copyWith(
                              fontWeight: UiConfig.semiBoldFont,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          address != ''
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 1.5),
                        child: Icon(Icons.location_on_rounded,
                            size: 18, color: UiConfig.black.shade800),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _launchUrl(addressUri);
                          },
                          child: Text(
                            address,
                            style: UiConfig.bodyStyle.copyWith(
                              fontWeight: UiConfig.semiBoldFont,
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
