import SwiftUI

struct LandmarkList: View {
    // Adding an @EnvironmentObject property to the view and an environment Object(_:) modifier to the preview.
    // The modelData property gets its value automatically, as long as the environment Ojbect(_:) modifier has been applied to a parent
    @EnvironmentObject var modelData: ModelData
    // Adding @State property called showFavoritesOnly with its initial values set to false
    @State private var showFavoritesOnly = false
    
    // Computing a filtered version of the landmarks list
    // checking the showFavoritesOnly property and each landmark.isFavorite value
    var filteredLandmarks: [Landmark] {
        // Using modelData.landmarks as the data when filtering landmarks
        modelData.landmarks.filter{ landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                // The toggle switch that accesses the state useing binding via a "$" sign.
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites only")
                }
                // We create a nested ForEach group to transform the landmarks into rows. To combine static and dynamic views in a list, or to combine two or more different groups of dynamic views, use the ForEach type instead of passing your collection of data to List
                ForEach(filteredLandmarks){ landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark:landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
       LandmarkList()
            .environmentObject(ModelData())
    }
}
