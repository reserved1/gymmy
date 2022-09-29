import SwiftUI

struct SelectExerciseView: View {

    @Environment(\.colorScheme) var colorScheme

    @EnvironmentObject var routineController: RoutineController

    @EnvironmentObject var exerciseController: ExerciseController

    @Binding var exercise: Exercise

    @State var checkDelete: Bool = false
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text(exercise.name)
                    .bold()
                    .font(.largeTitle)
                Spacer()
            }
            Form {
                Section {
                    Text(exercise.descriptions ?? "")
                }
                Section {
                    Text(exercise.observations ?? "")
                }
            }
        }
        .padding(.top, 20)
    }
}
