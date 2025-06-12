import Foundation

class DisneyCharacter: Codable {
    var id: Int = 0
    var films: [String]
    var name: String
    var imageUrl: String? = nil
    
    init(id: Int, films: [String], name: String, imageUrl: String?) {
        self.id = id
        self.films = films
        self.name = name
        self.imageUrl = imageUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case films, name, imageUrl
    }
}
