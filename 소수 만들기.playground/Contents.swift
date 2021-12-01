import Foundation

func solution(_ nums:[Int]) -> Int {
    var answer = 0
    
    // 🪓 배열에서 세가지 조합 만들기
    /*
    for i in 0..<nums.count - 2 {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                if isPrimeNumber(nums[i] + nums[j] + nums[k]) {
                    answer += 1
                }
            }
        }
    }
    return answer
     */
    // 🪓 filter 사용
    var sums: [Int] = []
    for i in 0..<nums.count - 2 {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                sums.append(nums[i] + nums[j] + nums[k])
            }
        }
    }
    return sums.filter { isPrimeNumber($0) }.count
}

// 🪓 소수 판별
func isPrimeNumber(_ n: Int) -> Bool {
    for i in 2..<n {
        if n % i == 0 {
            return false
        }
    }
    return true
}

solution([1,2,7,6,4])
