//
//  CategoryHome.swift
//  LearningSwiftForImen
//
//  Created by Mohammad Saghafian on 2022-05-03.
//

import SwiftUI

// The category view displays all categories in separate rows arranged in a vertical column for easier browsing. You do this by combining vertical and horizontal stacks, and adding scrolling to the list. 
struct CategoryHome: View {
    // Accessing the categories right now as well as to other landmark data
    @EnvironmentObject var modelData: ModelData
    var body: some View {
        // You use navigation vies along with NavigationLink instances and related modifiers to build hierarchical navigation structures
        NavigationView{
            List{
                ForEach(modelData.categories.keys.sorted(), id: \.self){
                    key in Text(key)
                }
            }
                .navigationTitle("Featured")
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
