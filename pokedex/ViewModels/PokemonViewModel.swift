import Foundation

@MainActor
class PokemonViewModel: ObservableObject {
    @Published var result: Pokemon?
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchPokemonDetails(url: String) async {
        isLoading = true
        errorMessage = nil

        do {
            let result = try await PokemonApiClient.getPokemonDetailResult(url: url)
            
            if result != nil {
                self.result = result
            }
        } catch {
            errorMessage = "Failed to load pokemon details: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
