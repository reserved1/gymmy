//import Foundation
//import SwiftUI
//
//struct ExerciseDropDelegate: DropDelegate {
//
//    @Binding var exercise: Exercise
//
//    @Binding var exercises: [Exercise]
//
//    @EnvironmentObject var routineController: RoutineController
//
//    @EnvironmentObject var exerciseController: ExerciseController
//
//    func performDrop(info: DropInfo) -> Bool {
//        return true
//    }
//
//    func dropEntered(info: DropInfo) {
//        let fromIndex = exercises.firstIndex { (exe) -> Bool in
//            return exe.id == exerciseController.savedExercise?.id
//        } ?? 0
//
//        let toIndex = exercises.firstIndex { (exe2) -> Bool in
//            return exe2.id == self.exercise.id
//        } ?? 0
//
//        if fromIndex != toIndex {
//            withAnimation(.default) {
//                let fromExercise = exercises[fromIndex]
//                exercises[fromIndex] = exercises[toIndex]
//                exercises[toIndex] = fromExercise
//            }
//        }
//    }
//}
