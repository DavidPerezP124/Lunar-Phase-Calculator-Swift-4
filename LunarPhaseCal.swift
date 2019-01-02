//
//  LunarPhaseCal.swift
//  Lunar phase calculator
//
//  Created by David Perez on 1/2/19.
//  Copyright © 2019 David Perez P. All rights reserved.
//

import Foundation

class LunarPhaseCal {
    func moonPhaseNum() -> Double{
        
        
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        let year = Double(components.year!)
        let month = Double(components.month!)
        let day = Double(components.day!)
        
        let a = Int((year/100).rounded())
        let b = Int(a/4)
        let c = 2-a+b
        let e = Int((365.25 * (Double(year)+4716)).rounded())
        let f = Int((30.6001 * (Double(month)+1)).rounded())
        let firstPart = c+Int(day)
        let secondPart = e+f
        let thirdPart: Double = Double(firstPart + secondPart)
        let jd = thirdPart-1524.5
        
        let daysSinceNewMoon = jd - 2451549.5
        let newMoons: Double = daysSinceNewMoon/29.53
        
        let daysIntoCycle = newMoons.truncatingRemainder(dividingBy: 1)
        var current = Double(daysIntoCycle * 29.53).rounded(toPosition: 2)
        
        if current > 2.1 {
            current = current - 2.0
        }
        
        
        return current
    }
    
}
extension Double {
    func rounded(toPosition number:Int) -> Double {
        let dividedBy = pow(10.0, Double(number))
        let roundsTo = (self * dividedBy).rounded() / dividedBy
        return roundsTo
    }
}
