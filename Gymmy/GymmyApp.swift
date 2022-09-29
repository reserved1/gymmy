import SwiftUI

@main
struct GymmyApp: App {

    @Environment(\.scenePhase) private var phase

    let routineController = RoutineController()
    let exerciseController = ExerciseController()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(routineController)
                .environmentObject(exerciseController)
        }
        .onChange(of: phase) { newPhase in
            switch newPhase {
            case .background:
                routineController.saveRoutines()
            case .inactive:
                routineController.saveRoutines()
            case .active:
                routineController.saveRoutines()
            @unknown default:
                print("Default Phase Scene Text")
            }
        }
    }
}
