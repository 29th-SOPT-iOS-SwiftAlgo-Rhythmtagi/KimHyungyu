///*
//📌 용어와 정의
//- 균형잡힌 괄호 문자열 : '(' 와 ')' 로만 이루어진 문자열이 있을 경우, '(' 의 개수와 ')' 의 개수가 같다
//- 올바른 괄호 문자열 : 균형잡힌 괄호 문자열에서 '('와 ')'의 괄호의 짝도 모두 맞을 경우
//
//📌 주어진 알고리즘 :
//1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
//2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
//3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
//  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
//4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
//  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
//  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
//  4-3. ')'를 다시 붙입니다.
//  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
//  4-5. 생성된 문자열을 반환합니다.
//
//📌 포인트
//- 주어진 조건 활용
//- 재귀
//*/
import Foundation

func solution(_ p:String) -> String {

    // ✅ 1단계로 향하는 재귀함수 역할
    func gotoFirstStep(_ w: String) -> String {
        var checkPair = ["(": 0, ")": 0]
        var checkStack: [String] = []
        var u: String = ""
        var v: String = ""
        let array = w.map { String($0) }

        for index in 0..<w.count {
            let s = array[index]
            // ✅ "(" 경우
            if s == "(" {
                checkStack.append(s)
                checkPair["("]! += 1
            }
            // ✅ ")" 경우
            else {
                // ✅ '올바른 괄호 문자열' 이라고 판단
                if let last = checkStack.last, last == "(" {
                    checkStack.removeLast()
                }
                // ✅ 아직 '올바른 괄호 문자열' 이라고 판단하지 않음
                else {
                    checkStack.append(s)
                }
                checkPair[")"]! += 1
            }
            // ✅ 지금까지 '균형잡힌 괄호 문자열' 의 마지막 index 를 찾는 과정

            // 📌 2단계: '균형잡힌 괄호 문자열' u 와 v 로 분리
            if checkPair["("] != 0, checkPair["("] == checkPair[")"] {
                // ✅ u
                u = array[0...index].map { String($0) }.joined()
                if index + 1 <= w.count {
                    // ✅ v
                    v = array[index + 1..<w.count].map { String($0) }.joined()
                }
                // 📌 3단계: '올바른 괄호 문자열' 의 경우
                if checkStack.isEmpty {
                    return u + gotoFirstStep(v)
                }
                // 📌 4단계: '올바른 괄호 문자열' 이 아닐 경우
                else {
                    u.removeFirst()
                    u.removeLast()

                    return "(" + gotoFirstStep(v) + ")" + reverse(u)
                }
            }
        }
        // 📌 1단계: 입력이 빈문자열일 경우.
        return ""
    }

    // 📌 4-4단계: 문자열의 괄호 방향을 뒤집어서 뒤에 붙인다.
    func reverse(_ u: String) -> String {
        return u.map { $0 == "(" ? ")" : "("}.joined()
    }

    // ✅ 실행
    return gotoFirstStep(p)
}
