import SwiftUI

/// EXERCISE
struct DirectoryExerciseView: View {
    @StateObject private var vm = DirectoryExerciseViewModel()

    var body: some View {
        List(vm.items) { item in
            Button(item.title) {
                vm.select(item)
            }
        }
        .sheet(isPresented: Binding(
            get: {
                if vm.selectedItem != nil {
                    vm.selectedItem = vm.selectedItem
                }
                return vm.selectedItem != nil
            },
            set: { isPresented in
                if !isPresented {
                    vm.selectedItem = nil
                }
            }
        )) {
            if let item = vm.selectedItem {
                VStack(spacing: 12) {
                    Text(item.title).font(.title)
                    Text(item.subtitle).font(.body)
                    Button("Close") {
                        vm.selectedItem = nil
                    }
                }
                .padding()
            } else {
                Text("No selection")
            }
        }
        .onAppear { vm.load() }
    }
}

struct DirectoryExerciseItem: Identifiable, Equatable {
    let id: UUID
    let title: String
    let subtitle: String
}
