abstract class FutureUsecase<Output, Input> {
  Future<Output> call([Input? input]);
}
