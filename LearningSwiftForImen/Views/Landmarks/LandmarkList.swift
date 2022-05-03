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
    // the type is some View because the type is something that acts and behaves like a view
    static var previews: some View {
       LandmarkList()
            .environmentObject(ModelData())
    }
}

//Opaque Types: A function or method with an opaque return type hides its return value's type information. Instead of providing a concrete type as the function's return type, the return value is described in terms of the protocols it supports. Hiding type information is useful at boundaries between a module and code that calls into the module, because the underlying type of the return value can remain private. Unlike returning a value whose type is a protocol type, opaque types preserve type identity--the compiler has access to the type information, but clients of the module  don't
// An opaque return type is like the reverse of a generic type. The code inside makeTrapezoid() can return any type it needs to, as long as that type conforms to the Shape protocol, like the calling code does for a generic function.
