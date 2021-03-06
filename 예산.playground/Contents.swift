import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    let sorted = d.sorted(by: <)
    var sum: Int = 0
    var count: Int = 0
    
    // ๐ while ๋ฌธ ํ์ด
    while sum < budget {
        sum += sorted[count]
        if sum > budget {
            count -= 1
        }
        count += 1
        // index ๋ณด๋ค ๊ฐฏ์๋ 1 ๋ ๋ง์ผ๋๊น ์ด ๋ค์ ๋ถ์์ ์ง์๊ธ์ก์ด ์๋ ๊ฒฝ์ฐ break.
        if count+1 > d.count { break }
    }
    
    // ๐ guard ๋ฌธ ํ์ด
//    for value in d.sorted() {
//        sum += value
//        guard sum <= budget else { break }
//        count += 1
//    }
    
    // ๐ filter ํ์ด
    // func filter(includeElement: (T) -> Bool) -> Array<T>
    // includeElement๋ฅผ ์ง์ํ๋ ํด๋ก์ ๋ ํญ๋ชฉ์ด ํฌํจ๋๋์ง(true) ๋๋ ์ ์ธ๋๋์ง(false) ๋ํ๋ด๊ธฐ ์ํด Boolean ๊ฐ์ ๋ฐํ.
    // ๊ฐ ํญ๋ชฉ๋ค์ ๋น๊ตํ์ฌ true ์ธ ๊ฒฐ๊ณผ๋ฌผ์ ๊ฐ์ง ์๋ก์ด ๋ฐฐ์ด์ ๋ฐํ.
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
