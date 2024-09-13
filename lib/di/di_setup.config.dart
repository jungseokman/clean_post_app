// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_app/features/post/data/datasources/post_datasooure.dart'
    as _i739;
import 'package:clean_app/features/post/data/repositories/post_repository_impl.dart'
    as _i1016;
import 'package:clean_app/features/post/domain/repositories/post_repository.dart'
    as _i252;
import 'package:clean_app/features/post/domain/usecases/post_usecase/get_post_usecase.dart'
    as _i259;
import 'package:clean_app/features/post/presentation/bloc/post_bloc.dart'
    as _i66;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i739.PostDatasooure>(() => _i739.PostDatasooure());
    gh.singleton<_i252.PostRepository>(() =>
        _i1016.PostRepositoryImpl(postDatasooure: gh<_i739.PostDatasooure>()));
    gh.singleton<_i259.GetPostUsecase>(
        () => _i259.GetPostUsecase(postRepository: gh<_i252.PostRepository>()));
    gh.singleton<_i66.PostBloc>(
        () => _i66.PostBloc(gh<_i259.GetPostUsecase>()));
    return this;
  }
}
