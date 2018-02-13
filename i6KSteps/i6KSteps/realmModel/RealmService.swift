//
//  RealmService.swift
//  i6KSteps
//
//  Created by Mateusz Chojnacki on 13.02.2018.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService{
    private init(){} //singletone
    static let shared = RealmService()
    
    var realm = try! Realm()
    
    
    func getAll() -> [DalyStepsR]{
        let resoults: Results<DalyStepsR> = realm.objects(DalyStepsR.self)
        return Array(resoults)
    }
    
    func update(dalySteps: DalyStepsR, stepsDate: Date?, stepsCount: Int?){
        do{
            try realm.write {
                if(stepsDate != nil){
                    dalySteps.stepsDate = stepsDate
                }
                if(stepsCount != nil){
                    dalySteps.stepsCount = stepsCount!
                }
            }
        } catch let error as NSError{
            post(error)
        }
    }
    
    func delete(dalySteps: DalyStepsR){
        do{
            try realm.write {
                realm.delete(dalySteps)
            }
        } catch let error as NSError{
            post(error)
        }
    }
    
    func create(dalySteps: DalyStepsR){
        do{
            try realm.write {
                realm.add(dalySteps)
            }
        } catch let error as NSError{
            post(error)
        }
    }
    
    /// Notyfication Center
    func post(_ error: Error){
        NotificationCenter.default.post(name: NSNotification.Name("RealmError"), object: error)
    }
    
}
