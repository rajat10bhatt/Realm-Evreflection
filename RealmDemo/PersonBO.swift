//
//  PersonBO.swift
//  RealmDemo
//
//  Created by Rajat on 9/4/18.
//  Copyright © 2018 None. All rights reserved.
//

import Foundation

import UIKit
import EVReflection
import RealmSwift

class PersonBO: Object {
    let person = List<PersonObject>()
}

class PersonObject: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
    @objc dynamic var employed = ""
}
