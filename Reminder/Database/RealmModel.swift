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
    @Persisted var date: String?
    @Persisted var tag: String?
    @Persisted var priority: Int?
    @Persisted var isComplete: Bool
    
    convenience init(title: String, content: String?, date: String?, tag: String?, priority: Int? ,isComplete: Bool) {
        self.init()
        self.title = title
        self.content = content
        self.date = date
        self.tag = tag
        self.priority = priority
        self.isComplete = false
    }
}
