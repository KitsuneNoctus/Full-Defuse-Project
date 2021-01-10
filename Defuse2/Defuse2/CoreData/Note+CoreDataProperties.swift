//
//  Note+CoreDataProperties.swift
//  Defuse2
//
//  Created by Henry Calderon on 1/9/21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String?
    @NSManaged public var prompt: String?
    @NSManaged public var title: String?

}

extension Note : Identifiable {

}
