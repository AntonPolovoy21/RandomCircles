//
//  ViewController.swift
//  Random Circles
//
//  Created by Admin on 22.09.23.
//

import UIKit

class ViewController: UIViewController {
    
    private let circle = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private let possibleColors: [UIColor] = [.systemMint, .systemCyan, .systemPink, .systemOrange, .systemPurple, .systemIndigo, .systemRed, .systemTeal]
    private let circleRadiusMin = 75
    private let circleRadiusMax = 150
    private let positionPadding = 125
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(circle)
        
        let newSize = CGFloat(getRandomSize())
        
        circle.frame = CGRect(x: view.center.x - newSize / 2, y: view.center.y - newSize / 2, width: newSize, height: newSize)
        circle.backgroundColor = getRandomColor()
        circle.layer.cornerRadius = CGFloat(newSize / 2)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(circleTap))
        circle.addGestureRecognizer(gesture)
    }
    
    private func draw(onView view: UIView){
        let newPosition = getRandomPosition(forView: view)
        let newColor = getRandomColor()
        let newSize = getRandomSize()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.circle.frame = CGRect(x: newPosition.circleX, y: newPosition.circleY, width: newSize, height: newSize)
            self.circle.backgroundColor = newColor
            self.circle.layer.cornerRadius = CGFloat(newSize / 2)
        })
        
    }
    
    private func getRandomPosition(forView view: UIView) -> (circleX: Int, circleY: Int){
        (Int.random(in: positionPadding...Int(view.bounds.maxX) - positionPadding), Int.random(in: positionPadding...Int(view.bounds.maxY) - positionPadding))
    }
    
    private func getRandomSize() -> Int{
        Int.random(in: circleRadiusMin...circleRadiusMax)
    }
    
    private func getRandomColor() -> UIColor {
        possibleColors.randomElement() ?? .black
    }
    
    @objc private func circleTap(_ gesture:UITapGestureRecognizer){
        draw(onView: view)
    }
}

