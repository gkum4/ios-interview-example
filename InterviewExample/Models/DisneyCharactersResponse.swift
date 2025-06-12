import Foundation

class DisneyCharactersResponse: Codable {
    var data: [DisneyCharacter] = []
    
    init(data: [DisneyCharacter]) {
        self.data = data
    }
}
