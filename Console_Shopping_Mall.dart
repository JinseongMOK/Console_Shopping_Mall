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
      case '1':
        print('상품 목록:');
        product.forEach((name, price) {
          print('$name: ${price}원');
        });
      case '2':
        print(' 장바구니 구현 중');
      case '3':
        print(' 장바구니에 담긴 총 상품 가격 구현 중');
      case '4':
        print('프로그램을 종료합니다.');
        return;
    }
  }
}
