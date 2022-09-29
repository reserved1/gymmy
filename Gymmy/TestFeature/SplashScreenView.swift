//import SwiftUI
//
//struct SplashScreenView: View {
//    @State var start = 0
//
//    var body: some View {
//            if start == 0 {
//                emptyState
//            } else {
//                program
//            }
//    }
//
//    var emptyState: some View {
//        Image("Image")
//            .resizable()
//            .scaledToFit()
//            .task {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
//                    start = 1
//            }
//        }
//    }
//
//    var program: some View {
//        HomeView()
//    }
//}
