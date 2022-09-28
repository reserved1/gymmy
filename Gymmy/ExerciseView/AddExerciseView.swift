import SwiftUI

struct AddExerciseView: View {

    @EnvironmentObject var exerciseController: ExerciseController
    @EnvironmentObject var routineController: RoutineController

    @State var name: String = ""
    @State var descriptions: String = ""
    @State var observations: String = ""

    @Binding var routineExercises: [Exercise]

    @Binding var checkAdded: Bool

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Name your Exercise", text: $name)
                    } header: {
                        Text("Exercise")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)
                    Section {
                        TextEditor(text: $descriptions)
                    } header: {
                        Text("Description")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)
                    Section {
                        TextEditor(text: $observations)
                    } header: {
                        Text("Observations")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)
                    Button(action: {
                        addExercise()
                        checkAdded.toggle()
                    }) {
                        Text("Add Exercise")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle)
                    .padding()
                }
            }
            .navigationTitle("Add Exercise")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func addExercise() {
        let newExercise = Exercise(name: name, observations: observations, descriptions: descriptions, complete: false)
        exerciseController.addToExercise(newExercise)
        routineExercises.append(newExercise)
    }
}
