import SwiftUI

struct ExerciseGridCellView: View {

    @Environment(\.colorScheme) var colorScheme

    @Binding var exercise: Exercise

    @State private var isActived = false

    @State private var isPressed = false

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack {
                    // Lembrar de colocar os foguinhos.
                    Image(systemName: exercise.complete ? "sparkles" : "")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                    Spacer()
                    Text(exercise.name)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .opacity(isPressed ? 0.6 : 1.0)
                        .scaleEffect(isPressed ? 2.0 : 1.0)
                    Spacer()
                }
                .onLongPressGesture(minimumDuration: 0.2) {
                    let impact = UIImpactFeedbackGenerator(style: .heavy)
                    impact.impactOccurred()
                    exercise.complete.toggle()
                } onPressingChanged: { _ in
                    let impact2 = UIImpactFeedbackGenerator(style: .soft)
                    impact2.impactOccurred()
                }
                .pressEvents {
                    withAnimation(.easeIn(duration: 0.5)) {
                        isPressed = true
                    }
                } onRelease: {
                    withAnimation {
                        isPressed = false
                    }
                }
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
