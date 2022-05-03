/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a landmark.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Update the ContentView preview to add the model object to the environment, which makes the object available to any subview
        // A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn't have the environment Object(_:) modifier
        ContentView()
            .environmentObject(ModelData())
    }
}
