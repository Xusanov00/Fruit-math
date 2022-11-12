//
//  GrapesVC.swift
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



class GrapesVC: UIViewController {

    
    
    @IBOutlet weak var resultLblGrapes: UILabel!
    
    @IBOutlet var firstImgsGrapes: [UIImageView]!
    
    @IBOutlet var secondImgsGrapes: [UIImageView]!
    
    
    @IBOutlet weak var resultViewGrapes: UIView!
    
    @IBOutlet var btnsGrapes: [UIButton]!
    
    
    
    
    
    
    var GrapesQuestions: [QuestionDM] = [
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

//        setGrapesData()
    }
    


    
    func setGrapesData() {

        if curQIndex > GrapesQuestions.count-1 {
            resultLblGrapes.text = "\(trueAns) / \(GrapesQuestions.count)"
            resultViewGrapes.isHidden = false
            return
        }
        
        GrapesQuestions[curQIndex].options.shuffle()
        
        
        for ind in 0..<firstImgsGrapes.count {
            if ind < GrapesQuestions[curQIndex].firstQuestion {
                firstImgsGrapes[ind].isHidden = false
            }else {
                firstImgsGrapes[ind].isHidden = true
            }
        }
        
        for ind in 0..<secondImgsGrapes.count {
            if ind < GrapesQuestions[curQIndex].secondQuestion {
                secondImgsGrapes[ind].isHidden = false
            }else {
                secondImgsGrapes[ind].isHidden = true
            }
        }
        
        for btn in btnsGrapes.enumerated() {
            
            btn.element.setTitle(GrapesQuestions[curQIndex].options[btn.offset] , for: .normal)
            
            
            
            btn.element.setTitleColor(.white, for: .normal)
            
            
        }
        
        
        
    }

    
    

    
    func findGrapesAns()-> Int {
        
        for op in GrapesQuestions[curQIndex].options.enumerated() {
            if op.element == GrapesQuestions[curQIndex].trueAnswer {
                return op.offset
            }
        }
        
        
        return 0
    }

    
    
    func stopGrapesBtn(isEnamle: Bool) {
        
        for btn in btnsGrapes {
            btn.isEnabled = isEnamle
            
        }
    }
    
    
    
    
    
    
    
    @IBAction func answerTapped(_ sender: UIButton) {
        
        if sender.currentTitle == GrapesQuestions[curQIndex].trueAnswer {
            
            trueAns += 1
            
          sender.setTitleColor(.green, for: .normal)
            stopGrapesBtn(isEnamle: false)
            
        }else {
            
            sender.tintColor = .red
          sender.setTitleColor(.red, for: .normal)
            
            let ind = findGrapesAns()
            btnsGrapes[ind].tintColor = .green
            btnsGrapes[ind].setTitleColor(.green, for: .normal)
            stopGrapesBtn(isEnamle: false)
            
        }
    }
    
    
    
    
    
    
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
        curQIndex += 1
        setGrapesData()
        stopGrapesBtn(isEnamle: true)

    }
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func restartTapped(_ sender: Any) {
        trueAns = 0
        curQIndex = 0
        resultViewGrapes.isHidden = true
        setGrapesData()
        stopGrapesBtn(isEnamle: true) 
    }
    
    
    @IBAction func homeTapped(_ sender: Any) {
        dismiss(animated: true)
    }

}
