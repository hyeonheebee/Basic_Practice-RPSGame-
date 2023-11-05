//
//  ViewController.swift
//  RPSGame
//
//  Created by 심현희 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {

    // 속성 / 오브젝트들이 변수와 연결되어있음
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 데이터 저장을 위한 변수 만들기, 내가 만든 타입을 사용, 속성(케이스)과 연결
    // 옵셔널 타입가능성 => 강제추출연산자 ! 사용
    var rpsManager = RPSManager()
   
    
    // 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
    
        makeUI()
    }

    func makeUI() {
        // 첫번째, 두번째 이미지 뷰에 준비(묵) 이미지를 띄운다
        
        comImageView.image = rpsManager.getReady().rpsInfo.image
        myImageView.image = rpsManager.getReady().rpsInfo.image
        // 첫번째, 두번째 레이블에 준비 문자열을 띄운다
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.text
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.text
        

        
    }
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        
        // 가위바위보를 선택해서 선택한 정보를 저장한다
        // 가드let바인딩 참조하기
        // guard let title = sender.currentTitle else { return }
         
        // currentTitle Stirng? 으로 옵셔널타입 강제추출연산자 ! 사용
        let title = sender.currentTitle!
        rpsManager.UserGetSelected(name: title)
                
    }
    
   
    // 함수 이름을 임의로 바꿔주면 안된다..
    // 실제로 버튼이 선택되고 눌렸을때 함수
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        
        // enum 타입에 대한 switch 문 이므로 default 처리 필요없음(당연함)
        comImageView.image = rpsManager.getComputerRPS().rpsInfo.image
        comChoiceLabel.text = rpsManager.getComputerRPS().rpsInfo.text

        // 컴퓨터가 선택한 랜덤이미지를 첫번째 이미지뷰에 표시
        // 컴퓨터가 선택한 것을 레이블에 표시
        
        myImageView.image = rpsManager.getUserRPS().rpsInfo.image
        myChoiceLabel.text = rpsManager.getUserRPS().rpsInfo.text

        // 내가 선택한 이미지를 두번째 이미지뷰에 표시
        // 내가 선택한 것을 레이블에 표시
        
        mainLabel.text = rpsManager.getRpsResult()
         
    }
    

    @IBAction func resetButtonTapped(_ sender: UIButton) {
        comImageView.image = rpsManager.getReady().rpsInfo.image
        comChoiceLabel.text = rpsManager.getReady().rpsInfo.text
        // 컴퓨터가 준비 이미지를 첫번째 이미지뷰에 표시
        // 컴퓨터가 준비를 레이블에 표시
        
        myImageView.image = rpsManager.getReady().rpsInfo.image
        myChoiceLabel.text = rpsManager.getReady().rpsInfo.text
        // 내가 준비 이미지를 두번째 이미지뷰에 표시
        // 내가 준비를 레이블에 표시
        
        mainLabel.text = "선택하세용"
        // 메인레이블에 선택하세용 표시
        rpsManager.allReset()
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

