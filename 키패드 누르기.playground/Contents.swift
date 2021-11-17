import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    var results: String = ""
    // * 위치
    var previousL: Int = 10
    // # 위치
    var previousR: Int = 12
    var tapHand: String = "R"
    
    for number in numbers {
        // 0 위치
        let number = number == 0 ? 11 : number
        
        switch number {
        // 왼손
        case 1,4,7:
            tapHand = "L"
        
        // 오른손
        case 3,6,9:
            tapHand = "R"
            
        // 판단
        case 2,5,8,11:
            // 절대값 차이
            let absL:Int = abs(number - previousL)
            let absR:Int = abs(number - previousR)
            
            // 행은 1씩 차이가 나고, 열은 3씩 차이가 난다.
            let distanceFromL:Int = (absL / 3) + (absL % 3)
            let distanceFromR:Int = (absR / 3) + (absR % 3)

            if distanceFromL == distanceFromR {
                tapHand = hand == "right" ? "R" : "L"
            } else {
                tapHand = distanceFromR < distanceFromL ? "R" : "L"
            }
        default:
            break
        }
        
        if tapHand == "L" {
            previousL = number
        } else {
            previousR = number
        }
        results.append(tapHand)
    }
    return results
}
