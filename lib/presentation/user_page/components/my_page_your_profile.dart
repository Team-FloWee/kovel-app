import 'package:flutter/material.dart';

class MyPageYourProfile extends StatelessWidget {
  const MyPageYourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Profile',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'edit',
                    style: TextStyle(color: Colors.grey),
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
                width: 72.0,
                height: 72.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  // viewModel profilePath 로 프로필 이미지
                  child: Image.network(
                    'https://img.freepik.com/free-psd/3d-rendering-avatar_23-2150833552.jpg?w=1060&t=st=1714144594~exp=1714145194~hmac=af74a04de4f0eba5788d15dc2579b9a75a9ced94d03fba12091bfbf47c3d9b60',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                height: 72.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // viewModel name으로 변경
                    Text(
                      'Hello, viewmodel.name',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    // viewModel email으로 변경
                    Text(
                      'viewmodel.email',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
