//
//  ViewController.swift
//  RPSGame
//
//  Created by 심현희 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {

    // 속성
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!

    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!

    
    // 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        // 첫번째, 두번째 이미지 뷰에 준비(묵) 이미지를 띄운다
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        // 첫번째, 두번째 레이블에 준비 문자열을 띄운다
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }

    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        // 가위바위보를 선택해서 선택한 정보를 저장한다
        // guard let title = sender.currentTitle else { return }
         
        // 옵셔널타입 강제추출연산자 사용
        let title = sender.currentTitle!
        switch title {
        case "가위":
            myChoice = Rps.scissors
            // 가위 열거형을 만들어서 저장
        case "바위":
            myChoice = Rps.rock
        case "보":
            myChoice = Rps.paper
        default:
            break
        }
            
    }
    
   
    // 함수 이름을 임의로 바꿔주면 안된다..
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        switch comChoice {
        case .rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case .paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case .scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        // 컴퓨터가 선택한 랜덤이미지를 첫번째 이미지뷰에 표시
        // 컴퓨터가 선택한 것을 레이블에 표시
        
        
        
        switch myChoice {
        case .rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case .paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case .scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }

        // 내가 선택한 이미지를 두번째 이미지뷰에 표시
        // 내가 선택한 것을 레이블에 표시
        
        if myChoice == comChoice {
            mainLabel.text = "비겼습니당"
        } else if (myChoice == .rock && comChoice == .scissors) || (myChoice == .scissors && comChoice == .paper) || (myChoice == .paper && comChoice == .rock) {
            mainLabel.text = "이겼습니다잉"
        } else {
            mainLabel.text = "졌습니당 ㅠㅠ"
        }
        // 컴퓨터가 선택한것과 내가 선택한것을 비교해서 선태하세용 문자열에 표시한다
    }
    

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        // 컴퓨터가 준비 이미지를 첫번째 이미지뷰에 표시
        // 컴퓨터가 준비를 레이블에 표시
        
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        // 내가 준비 이미지를 두번째 이미지뷰에 표시
        // 내가 준비를 레이블에 표시
        
        mainLabel.text = "선택하세용"
        // 메인레이블에 선택하세용 표시
        
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        // 컴퓨터가 다시 랜덤 선택을 저장

    }
}


// 타입정의시 이렇게 만들지 않음 (새로운 파일로 만듦)
/*
enum RPS {
    case rock
    case paper
    case scissors
}
*/

