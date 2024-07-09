//
//  SizeExtension.swift
//  TestRickAndMorty
//
//  Created by Матвей Авдеев on 08.07.2024.
//

import UIKit

extension CGFloat {
    
    func adjustSizeWidth() -> CGFloat {
        
        let iPhone13MiniScreenWidth: CGFloat  = 375
        return UIScreen.main.bounds.width / iPhone13MiniScreenWidth
    }
    
    func adjustSizeHeight() -> CGFloat {
        
        let iPhone13MiniScreenHeight: CGFloat = 812
        return UIScreen.main.bounds.height / iPhone13MiniScreenHeight
    }
    
}

