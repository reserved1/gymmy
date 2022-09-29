import Foundation
import SwiftUI

class RoutineController: ObservableObject, Codable {
    @Published var routines: [Routine] = []

    init(_ routines: [Routine]) {
        self.routines = routines
    }
    
    init() {
        if FileManager().docExist(named: fileName) {
            loadRoutines()
        }
    }

    func addToRoutine(_ routine: Routine) {
        self.routines.append(routine)
        saveRoutines()
    }

    func deleteRoutine(_ routine: Routine) {
        routines = routines.filter({$0.id != routine.id})
        saveRoutines()
    }

    func updateRoutine(_ routine: Routine) {
        guard let index = routines.firstIndex(where: { $0.id == routine.id }) else { return }
        routines[index] = routine
        saveRoutines()
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RoutineControllerKeys.self)

        try container.encode(routines, forKey: .routines)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RoutineControllerKeys.self)

        routines = try container.decode([Routine].self, forKey: .routines)
    }

    func loadRoutines() {
        FileManager().readDocument(docName: fileName) { (result) in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    routines = try decoder.decode([Routine].self, from: data)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func saveRoutines() {
        let enconder = JSONEncoder()
        do {
            let data = try enconder.encode(routines)
            let jsonString = String(decoding: data, as: UTF8.self)
            FileManager().saveDocument(contents: jsonString, docName: fileName) { (error) in
                if let error = error {
                    print(error.localizedDescription)
                }
            }
        } catch {
            print(error.localizedDescription)
        }
    }
}

class ExerciseController: ObservableObject, Codable {
    @Published var exercises: [Exercise] = []

    @Published var savedExercise: Exercise?

    init(_ exercises: [Exercise]) {
        self.exercises = exercises
    }

    init() {}

    func addToExercise(_ exercise: Exercise) {
        self.exercises.append(exercise)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ExerciseControllerKeys.self)

        try container.encode(exercises, forKey: .exercises)

        try container.encode(savedExercise, forKey: .savedExercises)

    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ExerciseControllerKeys.self)

        exercises = try container.decode([Exercise].self, forKey: .exercises)

        savedExercise = try container.decode(Exercise?.self, forKey: .savedExercises)

    }
}
