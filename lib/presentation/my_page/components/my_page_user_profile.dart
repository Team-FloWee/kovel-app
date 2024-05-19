import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kovel_app/config/ui_config.dart';

class MyPageUserProfile extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String userProfilePath;

  const MyPageUserProfile({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userProfilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 16.0),
              width: 72.0,
              height: 72.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: userProfilePath,
                    // imageUrl: 'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833552.jpg?w=1060&t=st=1714144594~exp=1714145194~hmac=af74a04de4f0eba5788d15dc2579b9a75a9ced94d03fba12091bfbf47c3d9b60',
                    placeholder: (context, url) =>
                        const Center(child: SpinKitFadingCircle(
                          size: 25,
                          color: UiConfig.primaryColor,
                        )),
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/images/blank_profile_image.png'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 72.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '안녕하세요,'.tr() + userName + '님!'.tr(),
                    style: UiConfig.h4Style
                        .copyWith(fontWeight: UiConfig.semiBoldFont),
                  ),
                  // const SizedBox(height: 4.0),
                  Text(
                    userEmail,
                    style: UiConfig.bodyStyle
                        .copyWith(color: UiConfig.black.shade700),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
