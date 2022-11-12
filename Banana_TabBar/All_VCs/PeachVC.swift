//
//  PeachVC.swift
//  Banana_TabBar
//
//  Created by Ali on 01/10/22.
//

import UIKit

//struct QuestionDM {
//    var firstQuestion: Int
//    var secondQuestion: Int
//    var options: [String]
//    var trueAnswer: String
//    
//}



class PeachVC: UIViewController {

    
    
    @IBOutlet weak var resultLblPeach: UILabel!
    
    @IBOutlet var firstImgsPeach: [UIImageView]!
    
    @IBOutlet var secondImgsPeach: [UIImageView]!
    
    
    @IBOutlet weak var resultViewPeach: UIView!
    
    @IBOutlet var btnsPeach: [UIButton]!
    
    
    
    
    var questionsPeach: [QuestionDM] = [
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

//        setPeachData()
    }
    

    
    func setPeachData() {

        if curQIndex > questionsPeach.count-1 {
            resultLblPeach.text = "\(trueAns) / \(questionsPeach.count)"
            resultViewPeach.isHidden = false
            return
        }
        
        questionsPeach[curQIndex].options.shuffle()
        
        
        for ind in 0..<firstImgsPeach.count {
            if ind < questionsPeach[curQIndex].firstQuestion {
                firstImgsPeach[ind].isHidden = false
            }else {
                firstImgsPeach[ind].isHidden = true
            }
        }
        
        for ind in 0..<secondImgsPeach.count {
            if ind < questionsPeach[curQIndex].secondQuestion {
                secondImgsPeach[ind].isHidden = false
            }else {
                secondImgsPeach[ind].isHidden = true
            }
        }
        
        for btn in btnsPeach.enumerated() {
            
            btn.element.setTitle(questionsPeach[curQIndex].options[btn.offset] , for: .normal)
            
            
            
            btn.element.setTitleColor(.white, for: .normal)
            
            
        }
        
        
        
    }

    
    

    
    func findPeachAns()-> Int {
        
        for op in questionsPeach[curQIndex].options.enumerated() {
            if op.element == questionsPeach[curQIndex].trueAnswer {
                return op.offset
            }
        }
        
        
        return 0
    }

    
    
    func stopPeachBtn(isEnamle: Bool) {
        
        for btn in btnsPeach {
            btn.isEnabled = isEnamle
            
        }
    }
    
    
    
    
    
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        
        if sender.currentTitle == questionsPeach[curQIndex].trueAnswer {
            
            trueAns += 1
            
          sender.setTitleColor(.green, for: .normal)
            stopPeachBtn(isEnamle: false)
            
        }else {
            
            
          sender.setTitleColor(.red, for: .normal)
            
            let ind = findPeachAns()
            
            btnsPeach[ind].setTitleColor(.green, for: .normal)
            stopPeachBtn(isEnamle: false)
        }
    }
    
    
    
    
    
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        curQIndex += 1
        setPeachData()
        stopPeachBtn(isEnamle: true) 

    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func restartTapped(_ sender: Any) {
        trueAns = 0
        curQIndex = 0
        resultViewPeach.isHidden = true
        setPeachData()
        stopPeachBtn(isEnamle: true) /*-------------------------IS ENABLED--------------------*/
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true)
    }

}
