//
//  Rps.swift
//  RPSGame
//
//  Created by 심현희 on 2023/09/17.
//

import UIKit

// 원시값(raw value)설정 // 직접 타입만들어서 사용 
enum Rps: Int {
    case rock //0
    case paper //1
    case scissors //2
    case ready //3
    
    var rpsInfo: (image: UIImage, text: String) {
        switch self {
        case .rock:
            return( #imageLiteral(resourceName: "rock"),"바위")
        case .paper:
            return( #imageLiteral(resourceName: "paper"), "보")
        case .scissors:
            return( #imageLiteral(resourceName: "scissors"), "가위")
        case .ready:
            return(#imageLiteral(resourceName: "ready"), "준비")
        }
    }
}
