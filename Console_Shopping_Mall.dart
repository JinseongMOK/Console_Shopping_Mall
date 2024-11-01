import 'dart:io';

void main() {
  // 메뉴
  Set<String> menu = {
    '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료'
  };

  // 상품 목록
  Map<String, int> product = {
    '셔츠': 45000,
    '원피스': 30000,
    '반팔티': 35000,
    '반바지': 38000,
    '양말': 5000,
  };

  // 장바구니
  Map<String, int> janbaguni = {};
  List<int> selectPrice = [];

  while (true) {
    print(
        '------------------------------------------------------------------------------------------------------');
    menu.forEach(print); // 메뉴 출력
    print(
        '------------------------------------------------------------------------------------------------------');

    // 사용자로부터 입력 받기
    print('원하는 서비스의 번호를 입력해 주세요:');
    String? select_menu = stdin.readLineSync();

    switch (select_menu) {
      case '1': // 상품 목록 보기
        print('상품 목록:');
        product.forEach((name, price) {
          print('$name: ${price}원');
        });
        break;
      case '2': // 장바구니에 상품 추가
        // 상품명 입력
        print('상품 이름을 입력해 주세요.');
        String? productName = stdin.readLineSync();
        if (!product.containsKey(productName)) {
          print('준비된 상품이 없습니다.');
          break;
        }
        // 수량 입력
        if (productName != null) {
          print('상품 개수를 입력해 주세요.');
          print('수량을 입력하세요:');
          int productNumber = int.parse(stdin.readLineSync()!);
          if (productNumber == 0) {
            print('1개 이상의 수량을 입력해주세요.');
          }
          janbaguni[productName] = productNumber;
          print('장바구니에 추가되었습니다');
        } else {
          print('상품명이 입력되지 않았습니다.');
        }
        // 장바구니에 담은 상품 가격 * 개수 selectPrice에 담기
        if (janbaguni.containsKey('셔츠')) {
          selectPrice.add(janbaguni[productName]! * 45000);
        } else if (janbaguni.containsKey('원피스')) {
          selectPrice.add(janbaguni[productName]! * 30000);
        } else if (janbaguni.containsKey('반팔티')) {
          selectPrice.add(janbaguni[productName]! * 35000);
        } else if (janbaguni.containsKey('반바지')) {
          selectPrice.add(janbaguni[productName]! * 38000);
        } else if (janbaguni.containsKey('양말')) {
          selectPrice.add(janbaguni[productName]! * 5000);
        }
        print('현재 장바구니: ${janbaguni}, ${selectPrice}');
        break;
      case '3': // 장바구니에 담긴 총 삼품 가격
        // 장바구니에 담긴 수량의 합
        if (janbaguni.isNotEmpty) {
          int totalNum = janbaguni.values.reduce((a, b) => a + b);
          print('총 주문 개수: $totalNum');
        } else {
          print('장바구니가 비어 있습니다.');
        }
        // 장바구니에 담긴 총 상품 가격의 합
        if (janbaguni.isNotEmpty) {
          int totalPrice = selectPrice.reduce((a, b) => a + b);
          print('장바구니에 담긴 상품의 총 가격: ${totalPrice}');
        }
        // 장바구니 초기화
        print('장바구니를 초기화 하고 싶으면 6, 초기화면으로 돌아가려면 6 을 제외한 숫자를 눌러주세요.');
        int resetJangbaguni = int.parse(stdin.readLineSync()!);
        if (resetJangbaguni == 6) {
          janbaguni.clear();
          print('장바구니가 초기화 되었습니다.');
        }
        break;
      case '4': // 프로그램 종료
        print('프로그램을 종료하시겠습니까? 종료를 원하시면 5 를 입력해주세요.');
        String? realExit = stdin.readLineSync();
        // 프로그램 종료여부 확인
        if (realExit == '5') {
          print('프로그램을 종료합니다.');
          return;
        } else {
          print('프로그램을 종료하지 않고, 초기화면으로 돌아갑니다.');
        }
        break;
    }
  }
}
