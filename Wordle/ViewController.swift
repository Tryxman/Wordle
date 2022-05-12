//
//  ViewController.swift
//  Wordle
//
//  Created by Aliaksei Palianskikh on 27.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var letterBoxView: LetterBoxView!
    
    private let letterBox: LetterBox? = LetterBox(letter: "A", status: .matched)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createLetterBoxView()
        
    }
    private func createLetterBoxView() {
        let letterBoxView = LetterBoxView(letterBox: letterBox)
        
        view.addSubview(letterBoxView)
        
        letterBoxView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            letterBoxView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            letterBoxView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            letterBoxView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            letterBoxView.widthAnchor.constraint(equalTo: letterBoxView.heightAnchor)
        ])
    }

}
