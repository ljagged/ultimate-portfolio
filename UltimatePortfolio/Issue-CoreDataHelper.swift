//
//  Issue-CoreDataHelper.swift
//  UltimatePortfolio
//
//  Created by Alex Garrett on 2/20/25.
//

import Foundation

extension Issue {
    var issueTitle: String {
        get { title ?? "" }
        set { title = newValue }
    }

    var issueContent: String {
        get { content ?? "" }
        set { content = newValue }
    }

    var issueCreationDate: Date {
        creationDate ?? .now
    }

    var issueModificationDate: Date {
        modificationDate ?? .now
    }
    
    var issueTags: [Tag] {
        let result = tags?.allObjects as? [Tag] ?? []
        return result.sorted()
    }
    
    static var example: Issue {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let issue: Issue = Issue(context: viewContext)
        issue.title = "Example Issue"
        issue.content = "This is some content"
        issue.priority = 2
        issue.modificationDate = .now
        return issue
    }
}

extension Issue: Comparable {
    public static func < (lhs: Issue, rhs: Issue) -> Bool {
        var left = lhs.issueTitle.localizedLowercase
        var right = rhs.issueTitle.localizedLowercase
        
        if left == right {
            return lhs.issueCreationDate < rhs.issueCreationDate
        }
        return left < right
    }
}
