import SwiftUI

struct RoutineGridCellView: View {

    @Environment(\.colorScheme) var colorScheme

    @Binding var routine: Routine

    @State private var isActive = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(colorScheme == .dark ? .white : .black), Color(colorScheme == .dark ? .white : .black).opacity(0.8)]), startPoint: .top, endPoint: .bottom)

            ZStack(alignment: .topLeading) {

                VStack(alignment: .leading) {
                    Text("\(routine.name)")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                }
                .background(
                    NavigationLink(destination: SelectRoutineView(routine: $routine), isActive: $isActive, label: {
                        EmptyView()
                    })
                )
                .padding(15)
                .frame(width: 200, height: 200)
                .foregroundColor(Color(colorScheme == .dark ? .black : .white).opacity(0.8))
            }
        }
        .onTapGesture {
            self.isActive.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
