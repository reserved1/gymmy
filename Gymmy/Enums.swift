import Foundation

enum RoutineKeys: CodingKey {
    case id, name, exercises
}

enum RoutineControllerKeys: CodingKey {
    case routines
}

enum ExerciseControllerKeys: CodingKey {
    case exercises, savedExercises
}
