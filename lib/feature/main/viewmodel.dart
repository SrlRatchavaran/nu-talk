import '../../base/base_viewmodel.dart';

class MainViewModel extends BaseViewModel{

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index){
    if(_currentIndex != index){
      _currentIndex = index;
    }
  }

}