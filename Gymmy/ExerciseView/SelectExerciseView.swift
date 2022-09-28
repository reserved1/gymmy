import SwiftUI

struct SelectExerciseView: View {

    @EnvironmentObject var routineController: RoutineController

    @EnvironmentObject var exerciseController: ExerciseController

    @Binding var exercise: Exercise

    @State var checkDelete: Bool = false

    @State var checkEdit: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text(exercise.descriptions ?? "")
                            .italic()
                            .multilineTextAlignment(.center)
                    }

                    Section {
                        Text(exercise.observations ?? "")
                            .italic()
                            .multilineTextAlignment(.center)
                    }
                }
//                HStack {
//                    Button {
//                        checkEdit.toggle()
//                    } label: {
//                        Text("Editar AQUI AQUI")
//                            .bold()
//                    }
//                    .buttonStyle(.borderless)
//                    }
//                    .padding(.bottom, 15)
                }
            .sheet(isPresented: $checkEdit) {
                EditExerciseView(exercise: $exercise, checkEdit: $checkEdit)
            }
            .navigationTitle(Text(exercise.name))
            .navigationBarTitleDisplayMode(.large)
        }

    }
}
