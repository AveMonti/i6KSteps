//
//  dalyStepsR.swift
//  i6KSteps
//
//  Created by Mateusz Chojnacki on 13.02.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import Foundation
import RealmSwift


class DalyStepsR : Object{
    @objc dynamic var stepsDate:Date?
    @objc dynamic var stepsCount:Int = 0
    
    convenience init(date: Date) {
        self.init()
        self.stepsDate = date
    }
    
}
