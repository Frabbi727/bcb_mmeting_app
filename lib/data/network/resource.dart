sealed class Resource<T> {
  const Resource();
}

class ResourceSuccess<T> extends Resource<T> {
  final T data;
  const ResourceSuccess(this.data);
}

class ResourceError<T> extends Resource<T> {
  final String errorMessage;
  final Exception? exception;
  const ResourceError(this.errorMessage, {this.exception});
}

class ResourceLoading<T> extends Resource<T> {
  const ResourceLoading();
}
