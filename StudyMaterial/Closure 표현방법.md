# Closure 표현방법

오늘은 정렬 함수인 sorted(by:) 를 공부해보다가 생긴 궁금증을 소개해볼게여

먼저, 간단하게 큰 숫자대로 정렬을 해볼까요? 

오.. 그런데 이런 코드도 있던데요..? 

```swift
let reversedNumber = [1,4,5,2,9].sorted(by: >)
// reversedNumber 는 [9, 5, 4, 2, 1] Int 형 배열을 가집니다.
```

```swift
let reversedNumber = [1,4,5,2,9].sorted(by: { $0 > $1 })
// .....?
```

잠시만 이게 무슨 일이죠? 그러면 by 라는 argument 의 자료형은 > 와 같은 연사자인가요..? 연산자라는 자료형이.. 있나요..? 아니면 클로저..? 어질어질하네요 😵‍💫

일단 sorted(by:) 함수에 대해서 알아봅시다. 

```swift
func sorted(by areInIncreasingOrder: (Element, Element) throws -> Bool) rethrows -> [Element]
```

네..! 지금은 모르는 것들이 많을 수 있겠지만 by 라는 argument 는 클로저를 가집니다.(클로저는... 아요 노션에 가시면 기초 문법 강의자료에 아주 잘 나와있어요!)

어쨋든~~ 오늘 알아볼건 왜 저런 형태의 코드가 나오는가에요

우리는 클로저의 많은 형태에 대해서 접합니다..🥲 

```swift
{ (a: Int, b: Int) -> Int in
        return a + b
}
// 이런 형태도
{ (a: Int, b: Int) in
        return a + b
}
// 이런 형태도..
{ a, b in
        return a + b
}
// 이런 형태도...
{ a, b in
        a + b
}
//이런 형태도...?
{ return $0 + $1 }
// 이런 형태도...
{ $0 + $1 }
```

우아... 무엇이 어떻게 되서 변하는 것인지...

저도... 편안하게 쓰고싶은데...

이번 기회에 Swift 문서를 보면서 클로저의 표현 방법에 대해서 알아보도록 합시다!😎

알고리즘이 아닌 프로그래밍을 할 때도 많은 도움이 되면 좋겠네여!

## 😎 Closure expression syntax

클로저의 기본적인 표현 방법.

```swift
{ ( parameters ) -> return type in
    statements
}
```

예시를 들어가면서 진행하겠습니다

```swift
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]

```

위의 코드를 클로저 표현식 구문으로 나타내 보면

```swift
let reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

```

함수를 아예 (by:) 속에 집어넣었죠? 실행문은 in 뒤에 써주었습니다.

## 😎 Inferring Type from context

sorted(by: ) 메서드에서 매개변수로 함수 타입을 받기 때문에 결과적으로 함수 타입과 반환할 타입을 유추할 수 있습니다.

```swift
let reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )

```

## 😎 Implicit returns form Single-Expression closure

단일 표현식에서는 return 키워드도 생략가능하니다. return 이 사라졌죠

```swift
let reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )

```

## 😎 Shortand argument names

Swift 는 인라인 클로저(삽입된 클로저라고 보면되요)에서 인수 이름을 간단하게 사용하는 방법을 제공합니다. 이때 in 키워드도 생략할 수 있어요.

$0 는 s1 을 s1 은 s2 를 암시적으로 의미해요. s1 과 s2 역시 클로저안에서 매개변수를 받기위해 지정한 변수명이기 때문에 $0, $1 로 설정하면 변수명을 고민하는 부담은 덜 수 있겠네요!

```swift
let reversedNames = names.sorted(by: { $0 > $1 } )

```

## 😎 Operator methods

비교 연산자(<, >) 를 사용해서 비교할 수 있어요.

드디어 우리가 흔히 봐왔던 sorted(by: >) 형태가 되는 것이죠...!

```swift
let reversedNames = names.sorted(by: >)
// 내림차순으로 정렬된 배열을 반환하게 된다.
```

$0, $1 이게 진짜 어디서 오는건지 궁금했는데 어느정도 궁금증이 풀렸다면..! 오케이입니다!

혹시나 잘 모르겠더라도 눈에 담아두고 나중에 생각나면 찾아와주세여~

### 출처

[[Swift 문법] Swift 공식 문서 정리 - 7 - Closures (클로저)](https://icksw.tistory.com/9)

[Closures - The Swift Programming Language (Swift 5.5)](https://docs.swift.org/swift-book/LanguageGuide/Closures.html)
