import SwiftUI

struct SelectRoutineView: View {

    @EnvironmentObject var routineController: RoutineController

    @EnvironmentObject var exerciseController: ExerciseController

    @Environment(\.colorScheme) var colorScheme

    @Binding var routine: Routine

    @State var checkAdded = false

    @State var checkEdited = false

    @State var checkDelete = false

    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 1)

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Section {
                    Text("Exercises")
                        .bold()
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                }
                Spacer()
            }
            Form {
                List {
                    ForEach($routine.exercises, id: \.id) { $exercise in
                            ExerciseGridCellView(exercise: $exercise)
                                .frame(height: 100)
                                .cornerRadius(15)
                                .scaleEffect(x:0.9, y:0.9)
                                .ignoresSafeArea(.all)
                    }
                    .onMove(perform: routine.moveExercises(fromOffsets:toOffSet:))
                    .onDelete(perform: deleteExercise)
                    .onChange(of: routine.exercises, perform: { newValue in
                        routineController.saveRoutines()
                    })
                    .listStyle(.plain)
                }
            }
            HStack {
                Button {
                    checkDelete.toggle()
                } label: {
                    Image(systemName: "trash")
                    Spacer()
                }
                .padding(.leading, 15)
                .buttonStyle(.borderless)
                Button {
                    checkEdited.toggle()
                } label: {
                    Spacer()
                    Text("Edit")
                        .bold()
                }
                .padding(.trailing, 15)
                .buttonStyle(.borderless)

            }
            .padding(.bottom, 15)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                //
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    checkAdded.toggle()
                } label: {
                    Image(systemName: "plus")
                        .scaleEffect(x: 1.4, y: 1.4)
                }
                .padding(.trailing, 15)
            }
        }
        .sheet(isPresented: $checkAdded) {
            AddExerciseView(routineExercises: $routine.exercises, checkAdded: $checkAdded)
        }
        .sheet(isPresented: $checkEdited) {
            EditRoutineView(routine: $routine, checkEdited: $checkEdited)
        }
        .alert(isPresented: $checkDelete) {
            Alert(title: Text("Delete Routine"),
                  message:Text("Are you sure?"),
                  primaryButton: .destructive(Text("Delete")) {
                routineController.deleteRoutine(routine)
            }, secondaryButton: .cancel())
        }
        .navigationTitle(routine.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    func deleteExercise(of offsets: IndexSet) {
        routine.exercises.remove(atOffsets: offsets)
    }
}
