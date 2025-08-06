func getImageUrl(for imageId: Int) -> String {
    let url = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
    
    return "\(url)\(imageId).png"
}
