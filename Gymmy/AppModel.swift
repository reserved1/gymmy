import Foundation
import SwiftUI



class Routine: ObservableObject, Codable {
    @Published var id = UUID()
    @Published var name: String
    @Published var exercises: [Exercise]

    init(id: UUID = UUID(), name: String, exercises: [Exercise]) {
        self.id = id
        self.name = name
        self.exercises = exercises
    }

    func addToExercise(_ exercise: Exercise) {
        self.exercises.append(exercise)
    }

    func addExercises(_ exercises: [Exercise]) {
        self.exercises = exercises
    }

    func moveExercises(fromOffsets source: IndexSet, toOffSet destination: Int) {
        exercises.move(fromOffsets: source, toOffset: destination)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: RoutineKeys.self)

        try container.encode(id, forKey: .id)

        try container.encode(name, forKey: .name)

        try container.encode(exercises, forKey: .exercises)
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RoutineKeys.self)

        id = try container.decode(UUID.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        exercises = try container.decode([Exercise].self, forKey: .exercises)
    }
}


struct Exercise: Hashable, Codable {
    var id = UUID()
    var name: String
    var observations: String?
    var descriptions: String?
    var complete: Bool
}

extension Exercise {
    static let exercise1 = Exercise(name: "Exercício 1", observations: "Observação do Exercício 1", descriptions: "Descrição do Exercício 1", complete: false)
    static let exercise2 = Exercise(name: "Exercício 2", observations: "Observação do Exercício 2", descriptions: "Descrição do Exercício 2", complete: false)
    static let exercise3 = Exercise(name: "Exercício 3", observations: "Observação do Exercício 3", descriptions: "Descrição do Exercício 3", complete: false)
    static let exercise4 = Exercise(name: "Exercício 4", observations: "Observação do Exercício 4", descriptions: "Descrição do Exercício 4", complete: false)
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

