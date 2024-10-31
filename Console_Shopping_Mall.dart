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

      case '2': // 장바구니에 상품 추가
        print('상품 이름을 입력해 주세요.');
        String? productName = stdin.readLineSync();
        print('상품 개수를 입력해 주세요.');

        if (productName != null) {
          print('수량을 입력하세요:');
          int productNumber = int.parse(stdin.readLineSync()!);

          janbaguni[productName] = productNumber;
          print('장바구니에 추가되었습니다');
        } else {
          print('상품명이 입력되지 않았습니다.');
        }
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
      case '3': // 장바구니에 담긴 총 삼품 가격
        // 장바구니에 담긴 수량의 합
        int totalNum = janbaguni.values.reduce((a, b) => a + b);
        print('총 주문 개수: ${totalNum}');
        // 장바구니에 담긴 총 상품 가격의 합
        int totalPrice = selectPrice.reduce((a, b) => a + b);
        print('장바구니에 담긴 상품의 총 가격: ${totalPrice}');
      case '4': // 프로그램 종료
        print('프로그램을 종료합니다.');
        return;
    }
  }
}
