//
//  FavoriteButton.swift
//  LearningSwiftForImen
//
//  Created by Mohammad Saghafian on 2022-05-02.
//

import SwiftUI

struct FavoriteButton: View {
    // Binding current state, and provide a constant value for the preview
    // Since we use a binding, changes made inside this view propagate back to the data source
    @Binding var isSet: Bool
    
    var body: some View {
        // Create a Button with an action that toggles the isSet state, and that changes its appearance based on the state. The title string that you provide for the button's label doesn't appear in the UI when you sue the iconOnly label style, but VoiceOver uses it to improve accessibility.
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill": "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
