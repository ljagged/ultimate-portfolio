//
//  SidebarView.swift
//  UltimatePortfolio
//
//  Created by Alex Garrett on 2/20/25.
//

import SwiftUI

struct SidebarView: View {
    @EnvironmentObject var dataController: DataController
    let smartFilters: [Filter] = [.all, .recent]
    
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var tags: FetchedResults<Tag>
    
    var tagFilter: [Filter] {
        tags.map { tag in
            Filter(id: tag.tagID, name: tag.tagName , icon: "tag", tag: tag)
        }
    }
    var body: some View {
        List(selection: $dataController.selectedFilter) {
            Section("Smart Filters") {
                ForEach(smartFilters) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                    }
                }
            }
            Section("Tags") {
                ForEach(tagFilter) { filter in
                    NavigationLink(value: filter) {
                        Label(filter.name, systemImage: filter.icon)
                            .badge(filter.tag?.tagActiveIssues.count ?? 0 )
                    }
                }
            }
        }.toolbar {
            Button {
                dataController.deleteAll()
                dataController.createSampleData()
            } label: {
                Label("Add Sample Data", systemImage: "flame")
            }
        }
    }
}

#Preview {
    SidebarView()
}
