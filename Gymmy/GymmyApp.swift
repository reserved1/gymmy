import SwiftUI

@main
struct GymmyApp: App {

    let routineController = RoutineController()
    let exerciseController = ExerciseController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(routineController)
                .environmentObject(exerciseController)
        }
    }
}
