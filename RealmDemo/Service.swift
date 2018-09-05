//
//  Service.swift
//  RealmDemo
//
//  Created by Rajat on 9/4/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation
import RealmSwift
import EVReflection

class Service {
    var notificationToken: NotificationToken?
    func getJsonString() {
        self.fetchCompaniesBuildingList()
        let url = Bundle.main.url(forResource: "Person", withExtension: "json")
        do {
            let jsonData = try Data(contentsOf: url!)
            let object = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments)
            if let dictionary = object as? NSDictionary {
                let personBO = PersonBO(json: dictionary.toJsonString())
                let realm = try! Realm()
                try! realm.write {
                    realm.add(personBO)
                }
//                let persons = dictionary["person"] as! NSArray
//                print(persons)
//                for person in persons {
//                    let personDict = person as! NSDictionary
//                    let personObject = PersonObject(dictionary: personDict)
//                    print(personObject)
//                    let realm = try! Realm()
//                    try! realm.write {
//                        realm.add(personObject)
//                    }
//                }
            }
        } catch {
            print("Unable to load data: \(error)")
        }
    }
    
    func fetchCompaniesBuildingList() -> Void {
        let realm = try! Realm()
        let  companyBuildings = realm.objects(PersonBO.self)
        notificationToken = companyBuildings.observe {(changes) in
            print("Changes: ----------------\n\(changes)\n-------------------")
        }
    }
    deinit {
        notificationToken?.invalidate()
    }
}

//extension List: EVCustomReflectable {
//    public func constructWith(value: Any?) {
//        if let array = value as? [NSDictionary] {
//            self.removeAll()
//            for dict in array {
//                if let element: Element = EVReflection.fromDictionary(dict, anyobjectTypeString: _rlmArray.objectClassName!) as? Element {
//                    self.append(element)
//                }
//            }
//        }
//    }
//    public func toCodableValue() -> Any {
//        return self.enumerated().map { ($0.element as? EVReflectable)?.toDictionary() ?? NSDictionary() }
//    }
//}

extension Object: EVReflectable {
    public func customConverter() -> AnyObject? {
        return nil
    }
}
