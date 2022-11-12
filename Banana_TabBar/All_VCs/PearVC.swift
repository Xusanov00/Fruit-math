//
//  PearVC.swift
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


class PearVC: UIViewController {

    
    
    @IBOutlet weak var resultLblPear: UILabel!
    
    @IBOutlet var firstImgsPear: [UIImageView]!
    
    @IBOutlet var secondImgsPear: [UIImageView]!
    
    
    @IBOutlet weak var resultViewPear: UIView!
    
    @IBOutlet var btnsPear: [UIButton]!
    
    
    
    
    var PearQuestions: [QuestionDM] = [
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

//        setPearData()
    }
    

    
    func setPearData() {

        if curQIndex > PearQuestions.count-1 {
            resultLblPear.text = "\(trueAns) / \(PearQuestions.count)"
            resultViewPear.isHidden = false
            return
        }
        
        PearQuestions[curQIndex].options.shuffle()
        
        
        for ind in 0..<firstImgsPear.count {
            if ind < PearQuestions[curQIndex].firstQuestion {
                firstImgsPear[ind].isHidden = false
            }else {
                firstImgsPear[ind].isHidden = true
            }
        }
        
        for ind in 0..<secondImgsPear.count {
            if ind < PearQuestions[curQIndex].secondQuestion {
                secondImgsPear[ind].isHidden = false
            }else {
                secondImgsPear[ind].isHidden = true
            }
        }
        
        for btn in btnsPear.enumerated() {
            
            btn.element.setTitle(PearQuestions[curQIndex].options[btn.offset] , for: .normal)
            
            
            
            btn.element.setTitleColor(.white, for: .normal)
            
            
        }
        
        
        
    }

    
    

    
    func findPearAns()-> Int {
        
        for op in PearQuestions[curQIndex].options.enumerated() {
            if op.element == PearQuestions[curQIndex].trueAnswer {
                return op.offset
            }
        }
        
        
        return 0
    }

    
    
    func stopPearBtn(isEnamle: Bool) {
        
        for btn in btnsPear {
            btn.isEnabled = isEnamle
            
        }
    }
    
    
    
    
    
    

    @IBAction func answerTapped(_ sender: UIButton) {
        
        if sender.currentTitle == PearQuestions[curQIndex].trueAnswer {
            
            trueAns += 1
            
          sender.setTitleColor(.green, for: .normal)
//            stopBtn(isEnamle: false)
            
        }else {
            
            
          sender.setTitleColor(.red, for: .normal)
            
            let ind = findPearAns()
            
            btnsPear[ind].setTitleColor(.green, for: .normal)
            stopPearBtn(isEnamle: false)
            
        }
    }
    
    
    
    
    
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        curQIndex += 1
        setPearData()
        stopPearBtn(isEnamle: true)

    }
    
    
    
    
    
    
    
    
    
    @IBAction func restartTapped(_ sender: Any) {
        trueAns = 0
        curQIndex = 0
        resultViewPear.isHidden = true
        setPearData()
        stopPearBtn(isEnamle: true) 
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true)
    }

}
