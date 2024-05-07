import 'package:get_it/get_it.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source.dart';
import 'package:kovel_app/data/data_source/tour_info_data_source_impl.dart';
import 'package:kovel_app/data/repository_impl/tour_info_repository_impl.dart';
import 'package:kovel_app/domain/repository/tour_info_repository.dart';
import 'package:kovel_app/domain/use_case/get_common_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_detail_data_use_case.dart';
import 'package:kovel_app/domain/use_case/get_info_data_use_case.dart';
import 'package:kovel_app/presentation/detail/detail_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // registerSingleton

  // DataSource
  getIt.registerSingleton<TourInfoDataSource>(TourInfoDataSourceImpl());

  // Repository
  getIt.registerSingleton<TourInfoRepository>(TourInfoRepositoryImpl(tourInfoDataSource: getIt()));


  // registerFactory

  // ViewModel & UseCase
  getIt.registerFactory<DetailViewModel>(() => DetailViewModel(
      getCommonDataUseCase: GetCommonDataUseCase(tourInfoRepository: getIt()),
      getDetailDataUseCase: GetDetailDataUseCase(tourInfoRepository: getIt()),
      getInfoDataUseCase: GetInfoDataUseCase(tourInfoRepository: getIt())
  ));
}