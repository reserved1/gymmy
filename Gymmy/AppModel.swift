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

