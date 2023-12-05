abstract interface class Solution<F, S> {
  Future<F> first({bool isTest = false});
  Future<S> second({bool isTest = false});
}
