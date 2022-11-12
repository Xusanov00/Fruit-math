//
//  BananaVC.swift
//  Banana_TabBar
//
//  Created by Ali on 01/10/22.
//

import UIKit

struct QuestionDM {
    var firstQuestion: Int
    var secondQuestion: Int
    var options: [String]
    var trueAnswer: String
    
}



class BananaVC: UIViewController {

    
    @IBOutlet weak var resultLblBanana: UILabel!
    
    @IBOutlet var firstImgsBanana: [UIImageView]!
    
    @IBOutlet var secondImgsBanana: [UIImageView]!
    
    
    @IBOutlet weak var resultViewBanana: UIView!
    
    @IBOutlet var btnsBanana: [UIButton]!
    
    
    
    
    var questionsBanana: [QuestionDM] = [
        QuestionDM(firstQuestion: 2, secondQuestion: 4, options: ["2","6","7","5"], trueAnswer: "6"),
        QuestionDM(firstQuestion: 2, secondQuestion: 3, options: ["8","6","5","9"], trueAnswer: "5"),
        QuestionDM(firstQuestion: 5, secondQuestion: 5, options: ["10","9","7","6"], trueAnswer: "10"),
        QuestionDM(firstQuestion: 5, secondQuestion: 1, options: ["2","6","3","8"], trueAnswer: "6"),
        QuestionDM(firstQuestion: 4, secondQuestion: 5, options: ["10","6","9","5"], trueAnswer: "9"),
        QuestionDM(firstQuestion: 4, secondQuestion: 4, options: ["8","3","5","2"], trueAnswer: "8"),
        QuestionDM(firstQuestion: 3, secondQuestion: 3, options: ["5","6","1","9"], trueAnswer: "6"),
        QuestionDM(firstQuestion: 1, secondQuestion: 1, options: ["6","7","2","8"], trueAnswer: "2"),
        QuestionDM(firstQuestion: 3, secondQuestion: 1, options: ["5","3","4","2"], trueAnswer: "4"),
        QuestionDM(firstQuestion: 1, secondQuestion: 2, options: ["9","5","3","6"], trueAnswer: "3"),

    ]
    
    var curQIndex: Int = 0
    var trueAns: Int = 0
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        setBananaData()
        
    }
    

  
    
    func setBananaData() {

        if curQIndex > questionsBanana.count-1 {
            resultLblBanana.text = "\(trueAns) / \(questionsBanana.count)"
            resultViewBanana.isHidden = false
            return
        }
        
        questionsBanana[curQIndex].options.shuffle()
        
        
        for ind in 0..<firstImgsBanana.count {
            if ind < questionsBanana[curQIndex].firstQuestion {
                firstImgsBanana[ind].isHidden = false
            }else {
                firstImgsBanana[ind].isHidden = true
            }
        }
        
        for ind in 0..<secondImgsBanana.count {
            if ind < questionsBanana[curQIndex].secondQuestion {
                secondImgsBanana[ind].isHidden = false
            }else {
                secondImgsBanana[ind].isHidden = true
            }
        }
        
        for btn in btnsBanana.enumerated() {
            
            btn.element.setTitle(questionsBanana[curQIndex].options[btn.offset] , for: .normal)
            
//            btn.element.setImage(UIImage(systemName: "\(questionsBanana[curQIndex].options[btn.offset]).circle.fill", withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), for: .normal) /*-------------BUTTON PICTURE-------------------*/
            
            btn.element.setTitleColor(.white, for: .normal)
            
            btn.element.tintColor = .white /*-------------BUTTON PICTURE-------------------*/
        }
        
        
        
    }

    
    func stopBtnBanana(isEnamle: Bool) {
        
        for btn in btnsBanana {
            btn.isEnabled = isEnamle
            
        }
    }
    

    
    func findAnsBanana()-> Int {
        
        for op in questionsBanana[curQIndex].options.enumerated() {
            if op.element == questionsBanana[curQIndex].trueAnswer {
                return op.offset
            }
        }
        
        
        return 0
    }

    
    

    
    
    
    
    
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        
        if sender.currentTitle == questionsBanana[curQIndex].trueAnswer {
            
            trueAns += 1
            sender.tintColor = .green /*-------------BUTTON PICTURE-------------------*/
          sender.setTitleColor(.green, for: .normal)
//            stopBtn(isEnamle: false) /*-------------------------IS ENABLED--------------------*/
            
        }else {
            
            sender.tintColor = .red /*-------------BUTTON PICTURE-------------------*/
          sender.setTitleColor(.red, for: .normal)
            
            let ind = findAnsBanana()
            btnsBanana[ind].tintColor = .green /*-------------BUTTON PICTURE-------------------*/
            btnsBanana[ind].setTitleColor(.green, for: .normal)
            stopBtnBanana(isEnamle: false) /*-------------------------IS ENABLED--------------------*/
            
        }
    }
    
    
    
    
    
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        curQIndex += 1
        setBananaData()
        stopBtnBanana(isEnamle: true) /*-------------------------IS ENABLED--------------------*/

    }
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func restartTapped(_ sender: Any) {
        trueAns = 0
        curQIndex = 0
        resultViewBanana.isHidden = true
        setBananaData()
        stopBtnBanana(isEnamle: true) /*-------------------------IS ENABLED--------------------*/
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}
