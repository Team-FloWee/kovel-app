import 'package:flutter/material.dart';
import 'package:kovel_app/config/ui_config.dart';
import 'package:kovel_app/presentation/detail_screen/culture_location/culture_location_info_view_model.dart';
import 'package:provider/provider.dart';

class CultureLocationInfoScreen extends StatelessWidget {
  const CultureLocationInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CultureLocationInfoViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('아직안댐'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.network(
                  fit: BoxFit.cover,
                  "https://images.unsplash.com/photo-1472791108553-c9405341e398?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8fA%3D%3D"),
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    //이후 컴포넌트로 교체
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                color: Color(0xFF00D1FF),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4, horizontal: 10),
                                  child: Text('음식점', style: UiConfig.h4Style),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '오리 주물럭 집',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.3),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '010-1234-5678',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.3),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 16,
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  '서울 관악구 관악시 11로 12길',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: -0.3),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    //컴포넌트로 교체 끝
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 16),
                      child: Divider(
                          thickness: 1,
                          height: 1,
                          color: UiConfig.black.shade500),
                    ),
                    Row(
                      children: [
                        Icon(Icons.monetization_on),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          '무료',
                          style: UiConfig.bodyStyle
                              .copyWith(fontWeight: UiConfig.semiBoldFont),
                        ),
                        //Icon(Icons.access_time_filled),
                        //Icon(Icons.door_front_door),
                        //Icon(Icons.local_parking),
                        //Icon(Icons.timelapse),
                        //Icon(Icons.pets),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 16),
                      child: Divider(
                          thickness: 1,
                          height: 1,
                          color: UiConfig.black.shade500),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 16, top: 16, right: 16, bottom: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: UiConfig.black.shade500,
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Text('인포텍스트입니다'),
                              Text('216Km'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
