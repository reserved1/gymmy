import SwiftUI


struct EditRoutineView: View {

    @Binding var routine: Routine

    @Binding var checkEdited: Bool

    @State var name: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("", text: $name)
                    } header: {
                        Text("Routine")
                            .bold()
                    }.multilineTextAlignment(.center)
                        .textFieldStyle(.plain)
                    Button(action: {
                        editRoutine()
                        checkEdited.toggle()
                    }) {
                        Text("Edit Routine")
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    .buttonStyle(.borderless)
                    .buttonBorderShape(.roundedRectangle)
                    .padding()
                }
            }
            .navigationTitle("Edit Routine")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            self.name = routine.name
        }
    }

    func editRoutine() {
        routine.name = name
    }
}
