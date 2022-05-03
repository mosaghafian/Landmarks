import SwiftUI

// This struct is very similar to what I did in React Native with the coins
// We get a whole landmark passed down to this fiel
struct LandmarkDetail: View {
    // Switch to LandmarkDetail.swift, and compute the index of the input landmark by comparing it with the mdoel data
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark

    
    var landmarkIndex: Int {
        // To support the switch to landmarkdetail.swift, and compute the index of the input landmark by comparing it with the model data
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                // Embed the landmark's name in an HStack with a new FavoriteButton; provide a binding to the isFavorite property with the dollar sign ($)
                //Use landmarkIndex with the modelData object to ensure that the button updates the isFavorite property of the landmark stored in your model object.
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.name)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
        
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        // Update the LandmarkDetail view to work with the ModelData object in the environment
        LandmarkDetail(landmark:modelData.landmarks[0])
            .environmentObject(modelData)
    }
}
