# Kovel
<div>
  <img width="100" height="100" src="https://github.com/user-attachments/assets/c7469845-1114-4e07-b9ab-ae6a599b1c1f" alt="Kovle 로고"/>
  <p style="width:100px;"></p>
  <span>외국인을 위한 여행 앱, 코블(Kovel)입니다.</span>
</div>

## 팀 소개

<table>
  <tr>
    <th align="center"><img src="https://github.com/user-attachments/assets/264ba8d5-bfeb-4c59-83d0-c64fdce66061" alt="박세훈"/></th>
    <th align="center"><img src="https://github.com/user-attachments/assets/8c935bd0-00d0-4bbf-bc9f-37cd36e334ac" alt="신승찬"/></th>
    <th align="center"><img src="https://github.com/user-attachments/assets/ffe8d8c6-e588-4306-a290-ffe036a6ca25" alt="신예진"/></th>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/chojja7188">박세훈</a></td>
    <td align="center"><a href="https://github.com/frihett">신승찬</a></td>
    <td align="center"><a href="https://github.com/Gunbam27">신예진</a></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/8da476fb-1298-4a96-958f-e63fa5f61db5" alt="유지영"/></td>
    <td><img src="https://github.com/user-attachments/assets/677facc1-6423-4dca-b539-359c072a3e68" alt="한정만"/></td>
    <td><img src="https://github.com/user-attachments/assets/cb9e2e4d-57ab-46cd-a39f-8b80bea11bb4" alt="한정은"/></td>
  </tr>
  <tr>
    <td align="center"><a href="https://github.com/yujiyeong">유지영</a></td>
    <td align="center"><a href="https://github.com/itbebop">한정만</a></td>
    <td align="center"><a href="https://github.com/jungeun272">한정은</a></td>
  </tr>
</table>
<br/>

## 기획 의도
<div><img width="500" src="https://github.com/user-attachments/assets/e460f970-bf1a-4328-9d99-8313bd642f29" alt="법무부 출입국·외국인정책본부 2023년 6월 통계월보 캡처, 재판매 및 DB 금지"/></div>
<span style="font-size:12px";>[법무부 출입국·외국인정책본부 2023년 6월 통계월보 캡처, 재판매 및 DB 금지]</span>

<div><img width="550" src="https://github.com/user-attachments/assets/af892444-10eb-495e-8350-c3675f101780" alt="구글 검색 > 뉴스 헤더 캡쳐"/></div>
<span style="font-size: 12px;">[구글 검색 > 뉴스 헤더 캡쳐]</span><br/>

<br/>

최근 몇 년간 한국 문화가 세계적으로 주목받으면서 한국을 방문하는 외국인 관광객 수가 매년 꾸준히 증가하고 있습니다. <br/>
외국인 여행자가 증가함에 따라 그들이 한국 여행 중 느끼는 어려움에 대해 조사해 보았습니다. <br/>
많은 외국인들이 언어가 통하지 않아 불편함을 느끼고 있으며, 서울 이외의 지역에서는 외국어 지원이 부족해 여행 정보를 얻기가 어렵다는 의견도 있었습니다.<br/>

이러한 문제를 해결하기 위해 외국인 관광객을 대상으로 한국 여행지 정보를 제공하는 글로벌 여행 앱을 개발하기로 기획했습니다. <br/>
또한, 다양한 취향을 가진 여행객들에게 개인 맞춤형 여행 코스를 추천하기 위해 AI를 활용하기로 했습니다.
<br/>

## 서비스 소개
[![Video Label](http://img.youtube.com/vi/IMpsU_mVFdk/0.jpg)](https://youtu.be/IMpsU_mVFdk?t=543)
<br/>

## 주요 API 및 Package
### API
  - 한국관광공사 TourAPI 4.0
  - Kakao/Google 로그인 API
  - Kakao 로컬 주소 API
  - Google Gemini API
    
### Package
<table>
  <tr>
    <td>#State Management</td>
    <td>provider</td>
  </tr>
  <tr>
    <td>#Routing</td>
    <td>go_router</td>
  </tr>
  <tr>
    <td>#Dependency Injection</td>
    <td>get_it</td>
  </tr>
  <tr>
    <td>#network</td>
    <td>dio</td>
  </tr>
  <tr>
    <td>#key</td>
    <td>flutter_dotenv, flutter_config</td>
  </tr>
  <tr>
    <td>#localization</td>
    <td>intl, easy_localization</td>
  </tr>
  <tr>
    <td>#DB</td>
    <td>firebase_core, cloud_firestore, firebase_storage, shared_preferences</td>
  </tr>
  <tr>
    <td>#auth</td>
    <td>google_sign_in, kakao_flutter_sdk_user, firebase_auth</td>
  </tr>
  <tr>
    <td>#AI</td>
    <td>google_generative_ai</td>
  </tr>
  <tr>
    <td>#util</td>
    <td>url_launcher, easy_debounce, geolocator, freezed</td>
  </tr>
  <tr>
    <td>#ui - widget</td>
    <td>flutter_spinkit, cached_network_image, image_picker, flutter_screenutil</td>
  </tr>
</table>
<br/>

## 스타일 가이드
<img width="815" src="https://github.com/user-attachments/assets/eb045997-e09c-4a29-8f27-b85b30d27f58" alt="코블 앱 스타일 가이드"/>
<br/>

## 아키텍처
<img width="815" src="https://github.com/user-attachments/assets/666eee94-6ec8-412b-9cd0-d924dc81db14" alt="코블 앱 아키텍처 이미지"/>
<img width="815" src="https://github.com/user-attachments/assets/17432d22-b356-4cbe-a514-dcb8578ca482" alt="코블 앱 아키텍처 이미지"/>
<br/>

## 플로우 차트
<img width="815" src="https://github.com/user-attachments/assets/be5ca192-d838-4a7a-8703-d2122875a9de" alt="코블 앱 플로우 차트 이미지"/>
<img width="815" src="https://github.com/user-attachments/assets/fdf7b84e-243a-454a-8fe3-152273e80c8b" alt="코블 앱 플로우 차트 이미지"/>
<img width="815" src="https://github.com/user-attachments/assets/77076b70-f289-40f7-be75-c25a687cdd98" alt="코블 앱 플로우 차트 이미지"/>
<br/>

## 최종 디자인
<img width="815" src="https://github.com/user-attachments/assets/1ea4d7c2-6e1f-4b69-88c5-eb0227f6c638" alt="코블 앱 최종 디자인"/>
