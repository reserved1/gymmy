import SwiftUI

struct AddRoutineView: View {

    @EnvironmentObject var routineController: RoutineController

    @State var name: String = ""

    @Binding var checkAdd: Bool

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Name your Routine", text: $name)
                    } header: {
                        Text("Routine")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)
                    Button(action: {
                        addRoutine()
                        checkAdd.toggle()
                    }) {
                        Text("Add Routines")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle)
                    .padding()
                }
            }
            .navigationTitle("Add Routine")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func addRoutine() {
        let newRoutine = Routine(name: name, exercises: [])
        routineController.addToRoutine(newRoutine)
    }
}
