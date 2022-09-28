import SwiftUI

struct HomeView: View {

    @EnvironmentObject var routineController: RoutineController

    let columns = Array(repeating: GridItem(.flexible(), spacing: 0), count: 2)

    @State var checkAdd = false

    var body: some View {
        NavigationView {
            if routineController.routines.isEmpty {
                Text("Add your first Routine!!")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            //
                        }
                        ToolbarItem(placement: .principal) {
                            Text("Routines")
                                .bold()
                                .font(.largeTitle)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                checkAdd.toggle()
                            } label: {
                                Image(systemName: "plus")
                                    .scaleEffect(x: 1.4, y: 1.4)
                            }
                            .padding(.trailing, 15)
                        }
                    }
            } else {
                ScrollView {
                    Section {
                        LazyVGrid(columns: columns) {
                            ForEach($routineController.routines, id:\.id) { $routine in
                                RoutineGridCellView(routine: $routine)
                                    .frame(height: 100)
                                    .cornerRadius(15)
                                    .scaleEffect(x:0.9, y:0.9)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        //
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Routines")
                            .bold()
                            .font(.largeTitle)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            checkAdd.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .scaleEffect(x: 1.4, y: 1.4)
                        }
                        .padding(.trailing, 15)
                    }
                }
            }
        }
        .sheet(isPresented: $checkAdd) {
            AddRoutineView(checkAdd: $checkAdd)
        }
    }
}

