import Foundation
import SwiftUI

class RoutineController: ObservableObject {
    @Published var routines: [Routine] = []

    init(_ routines: [Routine]) {
        self.routines = routines
    }
    
    init() {}

    func addToRoutine(_ routine: Routine) {
        self.routines.append(routine)
    }

    func deleteRoutine(_ routine: Routine) {
        routines = routines.filter({$0.id != routine.id})
    }
}

class ExerciseController: ObservableObject {
    @Published var exercises: [Exercise] = []

    @Published var savedExercise: Exercise?

    init(_ exercises: [Exercise]) {
        self.exercises = exercises
    }

    init() {}

    func addToExercise(_ exercise: Exercise) {
        self.exercises.append(exercise)
    }
}
