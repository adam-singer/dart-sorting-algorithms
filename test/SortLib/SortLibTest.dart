#import('../../src/SortLib/SortLib.dart');
#import('../../third_party/unittest/unittest_vm.dart');
#source('sortlibtests.dart');
class SortLibTest {
  void run() {
    new sortlibtests().run();
  }
}
void main() {
  new SortLibTest().run();
}
