//
//  Circle.swift
//  Random Circles
//
//  Created by Admin on 22.09.23.
//

import Foundation
import UIKit

class Circle {
    private init() {}
    static let shared = Circle()
    
    let circle = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let possibleColors: [UIColor] = [.systemMint, .systemCyan, .systemPink, .systemOrange, .systemPurple, .systemIndigo, .systemRed, .systemTeal]
    let circleRadiusMin = 40
    let circleRadiusMax = 150
    let gesture = UITapGestureRecognizer(target: Circle.shared.circle, action: #selector(Circle.shared.someAction (_:)))
    
    func draw(onView view: UIView){
        let newPosition = getRandomPosition(forView: view)
        let newColor = getRandomColor()
        let newSize = getRandomSize()
        
        circle.frame = CGRect(x: newPosition.circleX, y: newPosition.circleY, width: newSize, height: newSize)
        circle.backgroundColor = newColor
        circle.layer.cornerRadius = CGFloat(newSize / 2)
        view.addSubview(circle)
    }
    
    func getRandomPosition(forView view: UIView) -> (circleX: Int, circleY: Int){
        (Int.random(in: 0...Int(view.bounds.maxX)), Int.random(in: 0...Int(view.bounds.maxY)))
    }
    
    func getRandomSize() -> Int{
        Int.random(in: circleRadiusMin...circleRadiusMax)
    }
    
    func getRandomColor() -> UIColor {
        possibleColors[Int.random(in: 0...possibleColors.count - 1)]
    }
    
    @objc func someAction(_ sender:UITapGestureRecognizer){
        print("TUP")
    }
}
