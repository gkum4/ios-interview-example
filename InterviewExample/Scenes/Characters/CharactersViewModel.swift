import Foundation

class CharactersViewModel {
    private let service = DisneyCharacterService()
    
    func loadCharacters(completion: @escaping ([DisneyCharacter]?, Error?) -> Void) {
        service.fetchCharacters { charactersResponse, error in
            if let charactersResponse {
                completion(charactersResponse.data, nil)
                return
            }
            
            completion(nil, error)
        }
    }
}
