import 'dart:io';

class ShoppingMall {
  // 상품 목록
  Map<String, int> product = {
    '셔츠': 45000,
    '원피스': 30000,
    '반팔티': 35000,
    '반바지': 38000,
    '양말': 5000,
  };

  // 장바구니
  Map<String, int> jangbaguni = {};
  List<int> selectPrice = [];

  void Menu() {
    print(
        '[1] 상품 목록 보기 [2] 상품 추가하기 / [3] 장바구니에 담기 / [4] 장바구니에 담긴 상품의 총 가격 보기 / [5] 프로그램 종료');
  }

  void Products() {
    print('상품 목록:');
    product.forEach((name, price) {
      print('$name: ${price}원');
    });
  }

  void addProduct() {
    print('추가 할 상품명을 입력해 주세요.');
    String? newProductName = stdin.readLineSync();
    print('추가 할 상품의 가격을 입력해 주세요.');
    int newProductPrice = int.parse(stdin.readLineSync()!);
    if (newProductName != null) {
      product[newProductName] = newProductPrice;
      print('$newProductName: ${newProductPrice}원이 상품 목록에 추가되었습니다.');
    } else {
      print('상품 이름이 입력되지 않았습니다.');
    }
  }

  void addJangbaguni() {
    print('상품 이름을 입력해 주세요.');
    String? productName = stdin.readLineSync();
    if (!product.containsKey(productName)) {
      print('준비된 상품이 없습니다.');
      return;
    }
    if (productName != null) {
      print('상품 개수를 입력해 주세요.');
      int productNumber = int.parse(stdin.readLineSync()!);
      if (productNumber == 0) {
        print('1개 이상의 수량을 입력해주세요.');
        return;
      }
      jangbaguni[productName] = productNumber;
      selectPrice.add(product[productName]! * productNumber);
      print('장바구니에 추가되었습니다.');
    }
  }

  void jangbaguniTotal() {
    if (jangbaguni.isNotEmpty) {
      int totalNum = jangbaguni.values.reduce((a, b) => a + b);
      print('총 주문 개수: $totalNum');
      int totalPrice = selectPrice.reduce((a, b) => a + b);
      print('장바구니에 담긴 상품의 총 가격: $totalPrice');
    } else {
      print('장바구니가 비어 있습니다.');
    }

    print('장바구니를 초기화 하고 싶으면 6, 초기화면으로 돌아가려면 6 을 제외한 숫자를 눌러주세요.');
    int resetJangbaguni = int.parse(stdin.readLineSync()!);
    if (resetJangbaguni == 6) {
      jangbaguni.clear();
      print('장바구니가 초기화 되었습니다.');
    }
  }

  void run() {
    while (true) {
      Menu();
      print('원하는 서비스의 번호를 입력해 주세요:');
      String? selectMenu = stdin.readLineSync();

      switch (selectMenu) {
        case '1':
          Products();
          break;
        case '2':
          addProduct();
          break;
        case '3':
          addJangbaguni();
          break;
        case '4':
          jangbaguniTotal();
          break;
        case '5':
          print('프로그램을 종료하시겠습니까? 종료를 원하시면 5 를 입력해주세요.');
          String? realExit = stdin.readLineSync();
          if (realExit == '5') {
            print('프로그램을 종료합니다.');
            return;
          } else {
            print('프로그램을 종료하지 않고, 초기화면으로 돌아갑니다.');
          }
          break;
        default:
          print('잘못된 입력입니다. 다시 시도해주세요.');
      }
    }
  }
}

void main() {
  ShoppingMall shoppingMall = ShoppingMall();
  shoppingMall.run();
}
