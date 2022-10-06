//
//  ThemeVariables.swift
//  MyPokedex
//
//  Created by Christian Rezende on 01/09/22.
//


import UIKit

public class ThemeVariables {
    
    // TODO: Improve color by element
    public static let colorGreen:UIColor = rgbToUIColor(red: 116, green: 203, blue: 72)
    public static let colorOrange:UIColor = rgbToUIColor(red: 245, green: 125, blue: 49)
    public static let colorBlue:UIColor = rgbToUIColor(red: 100, green: 147, blue: 235)
    public static let colorLightGreen:UIColor = rgbToUIColor(red: 167, green: 183, blue: 35)
    public static let colorYellow:UIColor = rgbToUIColor(red: 249, green: 207, blue: 48)
    public static let colorPurple:UIColor = rgbToUIColor(red: 112, green: 85, blue: 155)
    public static let colorLightBrown:UIColor = rgbToUIColor(red: 170, green: 166, blue: 127)
    public static let colorPink:UIColor = rgbToUIColor(red: 251, green: 85, blue: 132)
    public static let colorGrey:UIColor = rgbToUIColor(red: 183, green: 185, blue: 208)
    public static let colorLightGrey:UIColor = rgbToUIColor(red: 247, green: 247, blue: 247)


    public static func getNextColor()->UIColor {
        let arrayColors = [
            colorGreen,
            colorOrange,
            colorBlue,
            colorLightGreen,
            colorYellow,
            colorPurple,
            colorLightBrown,
            colorPink,
            colorGrey
        ]
        let randomNumber = Int.random(in: 0...arrayColors.count - 2)
        let color  = arrayColors[randomNumber]
        return color
    }
    
    private static func rgbToUIColor(red:Float,green:Float,blue:Float)->UIColor{
        return UIColor(
            red: CGFloat(red / 255.0),
            green: CGFloat(green / 255.0),
            blue: CGFloat(blue / 255.0),
            alpha: CGFloat(1.0)
        )
    }
}
