//
//  BotaComBorda.swift
//  quizNight
//
//  Created by wanderley Landim  on 1/12/18.
//  Copyright © 2018 wanderleylb. All rights reserved.
//

import UIKit

class BotaComBorda: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
        layer.cornerRadius = 5
        
    }

}
