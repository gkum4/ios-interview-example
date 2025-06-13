import Foundation
import UIKit

class CharactersViewModel {
    private let service: DisneyCharacterService!
    
    init() {
        self.service = DisneyCharacterService()
    }
    
    func loadCharacters(completion: @escaping ([DisneyCharacter]?, Error?) -> Void) {
        service.fetchCharacters { charactersResponse, error in
            if let charactersResponse {
                completion(charactersResponse.data, nil)
                return
            }
            
            completion(nil, error)
        }
    }
    
    func fetchCharacterImage(for urlString: String, completion: @escaping (UIImage?, Error?) -> Void) {
        guard let imageUrl = URL(string: urlString) else { return }
        
        do {
            let data = try Data(contentsOf: imageUrl)
            let image = UIImage(data: data)
            completion(image, nil)
        } catch {
            completion(nil, error)
        }
    }
}
