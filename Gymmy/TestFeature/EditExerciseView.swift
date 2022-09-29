//import SwiftUI
//
//
//struct EditExerciseView: View {
//
//    @Binding var exercise: Exercise
//
//    @Binding var checkEdit: Bool
//
//    @State var name: String = ""
//
//    @State var descriptions: String = ""
//
//    @State var observations: String = ""
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Form {
//                    Section {
//                        TextField("", text: $name)
//                    } header: {
//                        Text("Exercise")
//                            .bold()
//                    }.multilineTextAlignment(.center)
//                        .textFieldStyle(.plain)
//                    Section {
//                        TextField("", text: $descriptions)
//                    } header: {
//                        Text("Description")
//                            .bold()
//                    }.multilineTextAlignment(.center)
//                        .textFieldStyle(.plain)
//                    Section {
//                        TextField("", text: $observations)
//                    } header: {
//                        Text("Observations")
//                            .bold()
//                    }.multilineTextAlignment(.center)
//                        .textFieldStyle(.plain)
//                    Button(action: {
//                        editExercise()
//                        checkEdit.toggle()
//                    }) {
//                        Text("Edit Exercise")
//                            .frame(minWidth: 0, maxWidth: .infinity)
//                    }
//                    .buttonStyle(.borderless)
//                    .buttonBorderShape(.roundedRectangle)
//                    .padding()
//                }
//            }
//            .navigationTitle("Edit Exercise")
//            .navigationBarTitleDisplayMode(.inline)
//        }
//        .onAppear {
//            self.name = exercise.name
//            self.descriptions = exercise.descriptions!
//            self.observations = exercise.observations!
//        }
//    }
//
//    func editExercise() {
//        exercise.name = name
//        exercise.observations = observations
//        exercise.descriptions = descriptions
//    }
//}
