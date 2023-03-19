import '../models/api/pagination_data.dart';
import 'base_controller.dart';
import 'base_repository.dart';
import 'swipable_refresh.dart';

abstract class SwipeableController<R extends BaseRepository>
    extends BaseController<R> {
  ///Data ********************
  var refreshController = FRefreshController();
  bool footerEnabled = true;

  // Pagination fields ***
  PaginationData? paginationData = PaginationData();

  /// Lifecycle methods ***************
  @override
  void onInit() {
    setRefreshListeners();
    paginationEnabled(true);
    super.onInit();
  }

  ///Logic *************************
  setRefreshListeners() {
    refreshController.setOnStateChangedCallback((state) {
      if (state == RefreshState.refreshing) {
        _onRefresh();
      } else if (state == LoadState.loading) {
        loadMore();
      }
    });
  }

  paginationEnabled(bool enabled) {
    footerEnabled = enabled;
    update();
  }

  triggerRefresh() {
    _scrollToUp();
    refreshController.refresh();
  }

  _scrollToUp() {
    refreshController.scrollTo(0, duration: const Duration(milliseconds: 200));
  }

  _onRefresh() {
    resetPagination();
    onRefresh();
  }

  resetPagination() {
    paginationData = PaginationData();
  }

  setNextPage(int currentPage) {
    paginationData?.page = currentPage + 1;
  }

  @override
  stopLoading() {
    super.stopLoading();
    refreshController.finishRefresh();
    refreshController.finishLoad();
  }

  /// Abstract methods *****
  onRefresh();

  loadMore();

  ///Dispose
  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
