//
//  Tag-CoreDataHelper.swift
//  UltimatePortfolio
//
//  Created by Alex Garrett on 2/20/25.
//

import Foundation

extension Tag {
    var tagID: UUID {
        id ?? UUID()
    }

    var tagName: String {
        name ?? ""
    }
    
    var tagActiveIssues: [Issue] {
        let result = issues?.allObjects as? [Issue] ?? []
        return result.filter { $0.completed == false }
    }
    static var example: Tag {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext

        let tag = Tag(context: viewContext)
        tag.id = UUID()
        tag.name = "Example Tag"
        return tag
    }
}

extension Tag: Comparable {
    public static func < (lhs: Tag, rhs: Tag) -> Bool {
        return lhs.tagName.localizedLowercase < rhs.tagName.localizedLowercase
    }
    

}
