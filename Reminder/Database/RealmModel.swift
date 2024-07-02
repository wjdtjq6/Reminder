//
//  RealmModel.swift
//  Reminder
//
//  Created by t2023-m0032 on 7/2/24.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var content: String?
    @Persisted var date: Date?
    
    convenience init(title: String, content: String?, date: Date? ) {
        self.init()
        self.title = title
        self.content = content
        self.date = date
    }
}
