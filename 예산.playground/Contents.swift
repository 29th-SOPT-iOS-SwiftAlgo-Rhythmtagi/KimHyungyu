import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let sorted = d.sorted(by: <)
    var sum: Int = 0
    var count: Int = 0
    
    // 📌 while 문 풀이
    while sum < budget {
        sum += sorted[count]
        if sum > budget {
            count -= 1
        }
        count += 1
        // index 보다 갯수는 1 더 많으니깐 이 다음 부서의 지원금액이 없는 경우 break.
        if count+1 > d.count { break }
    }
    
    // 📌 guard 문 풀이
//    for value in d.sorted() {
//        sum += value
//        guard sum <= budget else { break }
//        count += 1
//    }
    
    // 📌 filter 풀이
    // func filter(includeElement: (T) -> Bool) -> Array<T>
    // includeElement를 지원하는 클로저는 항목이 포함되는지(true) 또는 제외되는지(false) 나타내기 위해 Boolean 값을 반환.
    // 각 항목들을 비교하여 true 인 결과물을 가진 새로운 배열을 반환.
//    var money = budget
//    count = d.sorted().filter {
//        if (money - $0) >= 0 {
//            money = money - $0
//            return true
//        } else {
//            return false
//        }
//    }.count
    
    return count
}

solution([2,2,3,3], 10)
