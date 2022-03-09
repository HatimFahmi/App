//
//  DataController.swift
//  TestAPP
//
//  Created by Fahmi Abbas on 07/03/2022.
//
import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
