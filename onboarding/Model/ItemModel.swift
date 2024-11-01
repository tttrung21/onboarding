//
//  ItemModel.swift
//  onboarding
//
//  Created by Trung on 1/11/24.
//

import UIKit

class ItemModel{
    let img: String
    let color: UIColor
    let headline: String
    let sub: String
    
    init(img: String, color: UIColor, headline: String, sub: String) {
        self.img = img
        self.color = color
        self.headline = headline
        self.sub = sub
    }
}
