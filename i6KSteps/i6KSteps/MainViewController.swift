//
//  ViewController.swift
//  i6KSteps
//
//  Created by Mateusz Chojnacki on 2/11/18.
//  Copyright © 2018 Mateusz Chojnacki. All rights reserved.
//

import UIKit
import HealthKit

class MainViewController: UIViewController {

    
    var healthStore = HKHealthStore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.auth()
        
        Timer.scheduledTimer(timeInterval: 2,
                             target: self,
                             selector: #selector(MainViewController.printSteps),
                             userInfo: nil,
                             repeats: true)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @objc func printSteps(){
        self.updateSteps(completion: { (steps) in
            print(steps)
        })
        
    }
    
    func auth(){
        if HKHealthStore.isHealthDataAvailable(){
            let writeDataTypes = dataTypesToWrite()
            let readDataTypes = dataTypesToWrite()
            
            
            
            healthStore.requestAuthorization(toShare: writeDataTypes as? Set<HKSampleType>, read: readDataTypes as? Set<HKObjectType>, completion: { (success, error) in
                if(!success){
                    print("error")
                    
                    return
                }
                
            })
        }
        
    }
    
    func dataTypesToWrite() -> NSSet{
        let stepsCount = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        
        let returnSet = NSSet(objects: stepsCount!)
        return returnSet
    }
    
    func dataTypesToRead() -> NSSet{
        let stepsCount = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)
        let returnSet = NSSet(objects: stepsCount!)
        
        return returnSet
    }
    
    
    func updateSteps(completion: @escaping (Double) -> Void) {
        let stepsQuantityType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: now, options: .strictStartDate)
        
        let query = HKStatisticsQuery(quantityType: stepsQuantityType, quantitySamplePredicate: predicate, options: .cumulativeSum) { (_, result, error) in
            var resultCount = 0.0
            
            guard let result = result else {
                print("\(String(describing: error?.localizedDescription)) ")
                completion(resultCount)
                return
            }
            
            if let sum = result.sumQuantity() {
                resultCount = sum.doubleValue(for: HKUnit.count())
            }
            
            DispatchQueue.main.async {
                completion(resultCount)
            }
        }
        
        healthStore.execute(query)
    }

    
}

