import Foundation

@MainActor
class PokedexViewModel: ObservableObject {
    @Published var result: PokemonResult?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchPokemonList() async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await PokemonApiClient.getPokemonListResult()
            
            if result != nil {
                self.result = result
            }
        } catch {
            errorMessage = "Failed to load posts: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
