//
//  LetterBoxView.swift
//  Wordle
//
//  Created by Aliaksei Palianskikh on 27.04.22.
//

import UIKit

class LetterBoxView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var letterLabel: UILabel!
    
    private var letterBox: LetterBox?
    
    init(letterBox: LetterBox?) {
        self.letterBox = letterBox
        
        super.init(frame: .zero)
        
        setUpView()
    }
    
    override init(frame: CGRect) { //when created from code
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) { //when created from storyboard/xib
        super.init(coder: coder)
        
        setUpView()
    }
    
    private func setUpView() {
        createXib()
        
        updateView(letterBox: letterBox)
    }
    
    private func createXib() {
        Bundle.main.loadNibNamed("LetterBoxView", owner: self, options: nil)
        
        addSubview(contentView)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func updateLetterBox(letterBox: LetterBox?) {
        self.letterBox = letterBox
        
        updateView(letterBox: letterBox)
    }
    
    private func updateView(letterBox: LetterBox?) {
        updateLabel(letter: letterBox?.letter)
        updateLetterBackground(status: letterBox?.status)
    }
    
    private func updateLabel(letter: String?) {
        letterLabel.text = letter?.uppercased()
    }
    
    private func updateLetterBackground(status: LetterEvaluation?) {
        contentView.backgroundColor = status.backgroundColor
    }
}

extension LetterEvaluation {
    var backgroundColor: UIColor {
        switch self {
        case .notExist:
            return .gray
            
        case .wrongPlace:
            return .yellow
            
        case .matched:
            return .green
        }
    }
}

extension Optional where Wrapped == LetterEvaluation {
    var backgroundColor: UIColor {
        switch self {
        case .none:
            return .clear
            
        case .some(let status):
            return status.backgroundColor
        }
    }
}
