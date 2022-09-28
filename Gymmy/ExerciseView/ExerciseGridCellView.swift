import SwiftUI

struct ExerciseGridCellView: View {

    @Environment(\.colorScheme) var colorScheme

    @Binding var exercise: Exercise

    @State private var isActived = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("\(exercise.name)")
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .multilineTextAlignment(.center)
            }
            .background(
                NavigationLink(destination: SelectExerciseView(exercise: $exercise), isActive: $isActived, label: {
                    EmptyView()
                })
            )
            .padding(15)
            .frame(width: 300, height: 150)
            .foregroundColor(Color(colorScheme == .light ? .black : .white).opacity(1))
        }
        .onTapGesture {
            self.isActived.toggle()
        }
        .edgesIgnoringSafeArea(.all)
    }
}
