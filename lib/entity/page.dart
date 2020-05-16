class Page<T>{
  int boundary;
  int offset;
  T data;
  bool hasNext;

  Page({
    this.boundary,
    this.offset,
    this.data,
    this.hasNext,
  });
}