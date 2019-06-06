//
//  Theme.swift
//  twofold
//
//  Created by Allen Boynton on 4/13/19.
//  Copyright © 2019 Allen Boynton. All rights reserved.
//

import UIKit

class Theme {
    static let mainFontTheme = "FugazOne-Regular"
    static let secondFontTheme = "HelveticaNeue"
    static let segmentedFont = "HelveticaNeue-Thin"
}



//返回随机颜色
var randomColor:UIColor{
    get
    {
        let red = CGFloat(arc4random()%256)/255.0
        let green = CGFloat(arc4random()%256)/255.0
        let blue = CGFloat(arc4random()%256)/255.0
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}


class StickmanTheme: Theme {
    static let stickmanBGColor = UIColor.white
    static let stickmanBorderColor = UIColor.darkGray.cgColor
    static let stickmanTintColor = UIColor.lightGray
    static let stickmanSegForegroundColorNormal = UIColor.black
    static let stickmanSegForegroundColorSelected = UIColor.white
}

class ButterflyTheme: Theme {
    static let butterflyBGColor = UIColor.rgb(red: 247, green: 207, blue: 104)
    static let butterflyBorderColor = UIColor.purple.cgColor
    static let butterflyTintColor = UIColor.rgb(red: 231, green: 80, blue: 69)
    static let butterflySegForegroundColorNormal = UIColor.purple
    static let butterflySegForegroundColorSelected = UIColor.black
}

class BeachTheme: Theme {
    static let beachBGColor = UIColor.rgb(red: 70, green: 215, blue: 215)
    static let beachBorderColor = UIColor.blue.cgColor
    static let beachTintColor = UIColor.white
    static let beachSegForegroundColorNormal = UIColor.white
    static let beachSegForegroundColorSelected = UIColor.blue
}

class JungleTheme: Theme {
    static let jungleBGColor = UIColor.rgb(red: 11, green: 102, blue: 35)
    static let jungleBorderColor = UIColor.rgb(red: 186, green: 118, blue: 40)
    static let jungleTintColor = UIColor.rgb(red: 205, green: 175, blue: 138)
    static let jungleSegForegroundColorNormal = UIColor.rgb(red: 111, green: 68, blue: 63)
    static let jungleSegForegroundColorSelected = UIColor.rgb(red: 79, green: 34, blue: 26)
    static let jungleTextColor = UIColor.rgb(red: 163, green: 197, blue: 83)
}

class FighterTheme: Theme {
    static let fighterBGColor = UIColor.rgb(red: 40, green: 70, blue: 112)
    static let fighterBorderColor = UIColor.rgb(red: 123, green: 50, blue: 100)
    static let fighterTintColor = UIColor.rgb(red: 100, green: 200, blue: 80)
    static let fighterSegForegroundColorNormal = UIColor.rgb(red: 82, green: 89, blue: 100)
    static let fighterSegForegroundColorSelected = UIColor.rgb(red: 100, green: 30, blue: 20)
    static let fighterTextColor = UIColor.rgb(red: 130, green: 210, blue: 80)
}


class ClothesTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}


class HeroesTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}


class FoodTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}


class CityTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}


class WeddingTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}

class AnimalTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}

class PeopleTheme: Theme {
    static let BGColor = randomColor
    static let BorderColor = randomColor
    static let TintColor = randomColor
    static let SegForegroundColorNormal = randomColor
    static let SegForegroundColorSelected = randomColor
    static let TextColor = randomColor
}




