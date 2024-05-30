import 'package:get_it/get_it.dart';
import 'package:kovel_app/core/provider/ai_provider.dart';
import 'package:kovel_app/data/data_source/address_info_data_source.dart';
import 'package:kovel_app/data/data_source/address_info_data_source_impl.dart';
import 'package:kovel_app/data/data_source/ai_data_source.dart';
import 'package:kovel_app/data/data_source/ai_data_source_impl.dart';
import 'package:kovel_app/data/data_source/liked_tour_data_source.dart';
import 'package:kovel_app/data/data_source/liked_tour_data_source_impl.dart';
import 'package:kovel_app/data/data_source/post_data_source.dart';
import 'package:kovel_app/data/data_source/post_data_source_impl.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/data/data_source/user_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/address_info_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/ai_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/liked_tour_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/post_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/tour_info_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/user_repository_impl.dart';
import 'package:kovel_app/domain/repository/address_info_repository.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';
import 'package:kovel_app/domain/repository/liked_tour_repository.dart';
import 'package:kovel_app/domain/repository/post_repository.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';
import 'package:kovel_app/domain/use_case/ai/get_chat_session_use_case.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';
import 'package:kovel_app/domain/use_case/ai/send_chat_to_ai_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/check_user_duplicated_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/create_user_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/get_user_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/login_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/logout_use_case.dart';
import 'package:kovel_app/domain/use_case/get_address_info_use_case.dart';
import 'package:kovel_app/domain/use_case/get_area_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_detail_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_info_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_location_based_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_search_festival_use_case.dart';
import 'package:kovel_app/domain/use_case/get_search_keyword_usecase.dart';
import 'package:kovel_app/domain/use_case/get_top_ten_popular_tour_list_use_case.dart';
import 'package:kovel_app/domain/use_case/like_tour_use_case.dart';
import 'package:kovel_app/domain/use_case/post/create_post_use_case.dart';
import 'package:kovel_app/domain/use_case/post/delete_post_use_case.dart';
import 'package:kovel_app/domain/use_case/post/get_post_list_use_case.dart';
import 'package:kovel_app/domain/use_case/post/update_post_use_case.dart';
import 'package:kovel_app/domain/use_case/unlike_tour_use_case.dart';
import 'package:kovel_app/domain/use_case/update_schedule_use_case.dart';
import 'package:kovel_app/domain/use_case/update_user_name_use_case.dart';
import 'package:kovel_app/presentation/chat_bot/chat_bot_view_model.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';
import 'package:kovel_app/presentation/detail/detail_view_model.dart';
import 'package:kovel_app/presentation/home/home_search_view_model.dart';
import 'package:kovel_app/presentation/home/home_view_model.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';
import 'package:kovel_app/presentation/login/login_view_model.dart';
import 'package:kovel_app/presentation/my_page/my_page_view_model.dart';
import 'package:kovel_app/presentation/nearby_list/nearby_list_view_model.dart';
import 'package:kovel_app/presentation/post/post_create_view_model.dart';
import 'package:kovel_app/presentation/post/post_list_view_model.dart';
import 'package:kovel_app/presentation/sign_up/sign_up_view_model.dart';

import '../core/provider/user_provider.dart';
import '../data/data_source/user_data_source.dart';
import '../domain/use_case/update_archived_use_case.dart';

final getIt = GetIt.instance;

void diSetup() {
  // registerSingleton
  // DataSource
  getIt.registerSingleton<TourInfoDataSource>(TourInfoDataSourceImpl());
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());
  getIt.registerSingleton<AiDataSource>(AiDataSourceImpl());
  getIt.registerSingleton<LikedTourDataSource>(LikedTourDataSourceImpl());
  getIt.registerSingleton<AddressInfoDataSource>(AddressInfoDataSourceImpl());
  getIt.registerSingleton<PostDataSource>(PostDataSourceImpl());

  getIt.registerSingleton<TourInfoRepository>(
      TourInfoRepositoryImpl(tourInfoDataSource: getIt()));
  getIt.registerSingleton<UserRepository>(
      UserRepositoryImpl(userDataSource: getIt()));
  getIt
      .registerSingleton<AiRepository>(AiRepositoryImpl(aiDataSource: getIt()));
  getIt.registerSingleton<LikedTourRepository>(
      LikedTourRepositoryImpl(likedTourDataSource: getIt()));
  getIt.registerSingleton<AddressInfoRepository>(
      AddressInfoRepositoryImpl(addressInfoDataSource: getIt()));
  getIt.registerSingleton<PostRepository>(
      PostRepositoryImpl(postDataSource: getIt()));

  // UseCase
  getIt.registerSingleton<GetUserUseCase>(
      GetUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<UpdateArchivedUseCase>(
      UpdateArchivedUseCase(userRepository: getIt()));
  getIt.registerSingleton<UpdateUserNameUseCase>(
      UpdateUserNameUseCase(userRepository: getIt()));
  getIt.registerSingleton<LikeTourUseCase>(
      LikeTourUseCase(likedTourRepository: getIt()));
  getIt.registerSingleton<UnLikeTourUseCase>(
      UnLikeTourUseCase(likedTourRepository: getIt()));
  getIt.registerSingleton<GetCommonDataUseCase>(
      GetCommonDataUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<GetDetailDataUseCase>(
      GetDetailDataUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<GetInfoDataUseCase>(
      GetInfoDataUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<GetTranslatedDataStreamUseCase>(
      GetTranslatedDataStreamUseCase(aiRepository: getIt()));
  getIt.registerSingleton<GetAreaDataUseCase>(
      GetAreaDataUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<LoginUseCase>(LoginUseCase(userRepository: getIt()));

  getIt
      .registerSingleton<LogoutUseCase>(LogoutUseCase(userRepository: getIt()));
  getIt.registerSingleton<CheckUserDuplicatedUseCase>(
      CheckUserDuplicatedUseCase(userRepository: getIt()));
  getIt.registerSingleton<CreateUserUseCase>(
      CreateUserUseCase(userRepository: getIt()));
  getIt.registerSingleton<UpdateScheduleUseCase>(
      UpdateScheduleUseCase(userRepository: getIt()));
  getIt.registerSingleton<GetSearchFestivalUseCase>(
      GetSearchFestivalUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<GetSearchKeywordUseCase>(
      GetSearchKeywordUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<GetLocationBasedDataUseCase>(
      GetLocationBasedDataUseCase(tourInfoRepository: getIt()));
  getIt.registerSingleton<SendChatToAiUseCase>(
      SendChatToAiUseCase(aiRepository: getIt()));
  getIt.registerSingleton<GetChatSessionUseCase>(
      GetChatSessionUseCase(aiRepository: getIt()));
  getIt.registerSingleton<GetTopTenPopularTourListUseCase>(
      GetTopTenPopularTourListUseCase(
          tourInfoRepository: getIt(), likedTourRepository: getIt()));
  getIt.registerSingleton<GetAddressInfoUseCase>(
      GetAddressInfoUseCase(addressInfoRepository: getIt()));
  getIt.registerSingleton<CreatePostUseCase>(
      CreatePostUseCase(postRepository: getIt()));
  getIt.registerSingleton<GetPostListUseCase>(
      GetPostListUseCase(postRepository: getIt()));
  getIt.registerSingleton<UpdatePostUseCase>(
      UpdatePostUseCase(postRepository: getIt()));
  getIt.registerSingleton<DeletePostUseCase>(
      DeletePostUseCase(postRepository: getIt()));

  // Provider
  getIt.registerSingleton<AiProvider>(
      AiProvider(getTranslatedDataStreamUseCase: getIt()));
  getIt.registerSingleton<UserProvider>(UserProvider(
    getUserUseCase: getIt(),
    updateArchivedUseCase: getIt(),
    likeTourUseCase: getIt(),
    unLikeTourUseCase: getIt(),
    updateScheduleUseCase: getIt(),
  ));

  // registerFactory
  // ViewModel
  getIt.registerFactory<MyPageViewModel>(
      () => MyPageViewModel(userRepository: getIt()));
  getIt.registerFactory<DetailViewModel>(() => DetailViewModel(
      getCommonDataUseCase: getIt(),
      getDetailDataUseCase: getIt(),
      getInfoDataUseCase: getIt()));
  getIt.registerFactory<LocationListViewModel>(() => LocationListViewModel(
        getCommonDataUseCase: getIt(),
        getAreaDataUseCase: getIt(),
        userRepository: getIt(),
      ));
  getIt.registerFactory<CourseListViewModel>(() => CourseListViewModel(
        getCommonDataUseCase: getIt(),
        getAreaDataUseCase: getIt(),
      ));
  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(
      loginUseCase: getIt(),
      logoutUseCase: getIt(),
      checkUserDuplicatedUseCase: getIt(),
      createUserUseCase: getIt()));
  getIt.registerFactory<SignUpViewModel>(
      () => SignUpViewModel(updateUserNameUseCase: getIt()));
  getIt.registerFactory<ChatBotViewModel>(() => ChatBotViewModel(
      sendChatToAiUseCase: getIt(), getChatSessionUseCase: getIt()));
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(
        getSearchFestivalUseCase: getIt(),
        getLocationBasedDataUseCase: getIt(),
        getTopTenPopularTourListUseCase: getIt(),
        getAddressInfoUseCase: getIt(),
      ));

  getIt.registerFactory<HomeSearchViewModel>(
      () => HomeSearchViewModel(getSearchKeywordUseCase: getIt()));
  getIt.registerFactory<NearbyListViewModel>(
      () => NearbyListViewModel(getLocationBasedDataUseCase: getIt()));
  getIt.registerFactory<PostListViewModel>(() => PostListViewModel(
        getPostListUseCase: getIt(),
        getUserUseCase: getIt(),
        deletePostUseCase: getIt(),
      ));
  getIt.registerFactory<PostCreateViewModel>(() => PostCreateViewModel(
      createPostUseCase: getIt(), updatePostUseCase: getIt()));
}
