import 'package:get_it/get_it.dart';
import 'package:kovel_app/core/service/ai_provider.dart';
import 'package:kovel_app/data/data_source/address_info_data_source.dart';
import 'package:kovel_app/data/data_source/address_info_data_source_impl.dart';
import 'package:kovel_app/data/data_source/ai_data_source.dart';
import 'package:kovel_app/data/data_source/ai_data_source_impl.dart';
import 'package:kovel_app/data/data_source/firebase/user_data_source.dart';
import 'package:kovel_app/data/data_source/firebase/user_data_source_impl.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/address_info_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/ai_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/tour_info_repository_impl.dart';
import 'package:kovel_app/data/repository_impl/user_repository_impl.dart';
import 'package:kovel_app/domain/repository/address_info_repository.dart';
import 'package:kovel_app/domain/repository/ai_repository.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';
import 'package:kovel_app/domain/repository/user_repository.dart';
import 'package:kovel_app/domain/use_case/ai/get_translated_data_stream_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/check_user_duplicated_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/create_user_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/login_use_case.dart';
import 'package:kovel_app/domain/use_case/auth/logout_use_case.dart';
import 'package:kovel_app/domain/use_case/get_address_use_case.dart';
import 'package:kovel_app/domain/use_case/get_area_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_detail_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_info_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_search_festival_use_case.dart';
import 'package:kovel_app/domain/use_case/update_user_name_use_case.dart';
import 'package:kovel_app/presentation/course_list/course_list_view_model.dart';

import 'package:kovel_app/presentation/home/home_view_model.dart';
import 'package:kovel_app/presentation/location_list/location_list_view_model.dart';

import 'package:kovel_app/presentation/detail/detail_view_model.dart';
import 'package:kovel_app/presentation/login/login_view_model.dart';
import 'package:kovel_app/presentation/sign_up/sign_up_view_model.dart';

import '../core/auth/user_provider.dart';

final getIt = GetIt.instance;

void diSetup() {
  // registerSingleton
  // DataSource
  getIt.registerSingleton<TourInfoDataSource>(TourInfoDataSourceImpl());
  getIt.registerSingleton<UserDataSource>(UserDataSourceImpl());
  getIt.registerSingleton<AiDataSource>(AiDataSourceImpl());
  getIt.registerSingleton<AddressInfoDataSource>(AddressInfoDataSourceImpl());

  // Repository
  getIt.registerSingleton<TourInfoRepository>(TourInfoRepositoryImpl(tourInfoDataSource: getIt()));
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl(userDataSource: getIt()));
  getIt.registerSingleton<AiRepository>(AiRepositoryImpl(aiDataSource: getIt()));
  getIt.registerSingleton<AddressInfoRepository>(AddressInfoRepositoryImpl(addressInfoDataSource: getIt()));

  // Provider
  getIt.registerSingleton<AiProvider>(AiProvider(getTranslatedDataStreamUseCase: GetTranslatedDataStreamUseCase(aiRepository: getIt())));
  getIt.registerSingleton<UserProvider>(UserProvider());

  // registerFactory

  // ViewModel & UseCase
  getIt.registerFactory<DetailViewModel>(() => DetailViewModel(
      getCommonDataUseCase: GetCommonDataUseCase(tourInfoRepository: getIt()),
      getDetailDataUseCase: GetDetailDataUseCase(tourInfoRepository: getIt()),
      getInfoDataUseCase: GetInfoDataUseCase(tourInfoRepository: getIt())));

  getIt.registerFactory<LocationListViewModel>(() => LocationListViewModel(
        getCommonDataUseCase: GetCommonDataUseCase(tourInfoRepository: getIt()),
        getAreaDataUseCase: GetAreaDataUseCase(tourInfoRepository: getIt()),
        userRepository: UserRepositoryImpl(userDataSource: getIt()),
      ));

  getIt.registerFactory<CourseListViewModel>(() => CourseListViewModel(
        getCommonDataUseCase: GetCommonDataUseCase(tourInfoRepository: getIt()),
        getAreaDataUseCase: GetAreaDataUseCase(tourInfoRepository: getIt()),
      ));

  getIt.registerFactory<LoginViewModel>(() => LoginViewModel(
      loginUseCase: LoginUseCase(userRepository: getIt()),
      logoutUseCase: LogoutUseCase(userRepository: getIt()),
      checkUserDuplicatedUseCase: CheckUserDuplicatedUseCase(userRepository: getIt()),
      createUserUseCase: CreateUserUseCase(userRepository: getIt())));

  getIt.registerFactory<SignUpViewModel>(() => SignUpViewModel(updateUserNameUseCase: UpdateUserNameUseCase(userRepository: getIt())));
  getIt.registerFactory<HomeViewModel>(
      () => HomeViewModel(getSearchFestivalUseCase: GetSearchFestivalUseCase(tourInfoRepository: getIt()), getAddressUseCase: GetAddressUseCase(addressInfoRepository: getIt())));
}
