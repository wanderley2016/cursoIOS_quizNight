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
        layer.borderWidth = 3.0
        layer.borderColor = UIColor.red.cgColor
        
    }

}
