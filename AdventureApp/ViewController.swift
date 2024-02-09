//
//  ViewController.swift
//  AdventureApp
//
//  Created by Halle Black on 2/8/24.
//
import UIKit

struct Prompt {
    let prompt: String
    let optionOne: String
    let optionTwo: String

    init(prompt: String, optionOne: String, optionTwo: String) {
        self.prompt = prompt
        self.optionOne = optionOne
        self.optionTwo = optionTwo
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var promptLabel: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    let prompts = [
        Prompt(prompt: "You are snorkeling in the ocean... when all of a sudden, you see a shark! What do you do?", optionOne: "Swim away quickly!!", optionTwo: "Slow down and let him pass."),
        Prompt(prompt: "The shark thought you were food and took a bite! What now??", optionOne: "Panic and swim back up to the surface.", optionTwo: "Stay calm and think."),
        Prompt(prompt: "The shark swam away, but now you are running out of air! What do you do?", optionOne: "Swim as fast as I can to the surface!", optionTwo: "Turn on the air reserve, duh!")
    ]
    
    var currentPromptIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayPrompt(at: currentPromptIndex)
    }
    
    @IBAction func optionSelected(_ sender: UIButton) {
        if sender == option1Button {
            switch currentPromptIndex {
            case 0:
                // Move to the prompt for "Swim away quickly!!"
                currentPromptIndex = 1
            case 1:
                // Handle option one selection for the second prompt
                // For simplicity, just end the game with the provided message
                endGame(with: "You lose! The shark came back for seconds!")
                return
            case 2:
                // Handle option one selection for the third prompt
                // For simplicity, just end the game with the provided message
                endGame(with: "You lost! You ran out of air on the way to the top!")
                return
            default:
                break
            }
        } else if sender == option2Button {
            switch currentPromptIndex {
            case 0:
                // Move to the prompt for "Slow down and let him pass."
                currentPromptIndex = 2
            case 1:
                // Handle option two selection for the second prompt
                // For simplicity, just end the game with the provided message
                endGame(with: "Congratulations! You gave your wound emergency aid and made it back to the surface.")
                return
            case 2:
                // Handle option two selection for the third prompt
                // For simplicity, just end the game with the provided message
                endGame(with: "Congratulations! You made it back to the top with enough air!")
                return
            default:
                break
            }
        }
        displayPrompt(at: currentPromptIndex)
    }

    func displayPrompt(at index: Int) {
        guard index < prompts.count else {
            promptLabel.text = "Game Over! Restart?"
            option1Button.isHidden = true
            option2Button.isHidden = true
            restartButton.isHidden = false
            return
        }
        let prompt = prompts[index]
        promptLabel.text = prompt.prompt
        option1Button.setTitle(prompt.optionOne, for: .normal)
        option2Button.setTitle(prompt.optionTwo, for: .normal)
        option1Button.isHidden = false
        option2Button.isHidden = false
        restartButton.isHidden = true
    }
    
    @IBAction func restartGame(_ sender: UIButton) {
        currentPromptIndex = 0
        displayPrompt(at: currentPromptIndex)
    }
    
    func endGame(with message: String) {
        promptLabel.text = message
        option1Button.isHidden = true
        option2Button.isHidden = true
        restartButton.isHidden = false
    }
}
