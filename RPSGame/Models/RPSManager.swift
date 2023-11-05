//
//  RPSManager.swift
//  RPSGame
//
//  Created by 심현희 on 2023/11/05.
//

import UIKit

struct RPSManager {
    
    private var myChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    private var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!

    func getReady() -> Rps {
        return Rps.ready
    }
    
    func getUserRPS() -> Rps {
        return myChoice
    }
    
    func getComputerRPS() -> Rps {
        return comChoice
    }
    
    mutating func UserGetSelected(name: String) {
        switch name {
        case "가위":
            myChoice = Rps.scissors
            // 가위 열거형을 만들어서 저장
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            myChoice = Rps.rock
        }

    }
    
    func getRpsResult() -> String {
        if myChoice == comChoice {
            return "비겼습니당"
        } else if (myChoice == .rock && comChoice == .scissors) || (myChoice == .scissors && comChoice == .paper) || (myChoice == .paper && comChoice == .rock) {
            return "이겼습니다잉"
        } else {
            return "졌습니당 ㅠㅠ"
        }
        // 컴퓨터가 선택한것과 내가 선택한것을 비교해서 선태하세용 문자열에 표시한다
    }
    mutating func allReset() {
        myChoice = Rps(rawValue: Int.random(in: 0...2))!
        comChoice = Rps(rawValue: Int.random(in: 0...2))!

    }
}
