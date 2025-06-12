import Foundation

class DisneyCharacterService {
    func fetchCharacters(page: Int = 1,
                         pageSize: Int = 20,
                         completion: @escaping (DisneyCharactersResponse?, Error?) -> Void) {
        guard let url = URL(string: "https://api.disneyapi.dev/character?page=\(page)&pageSize=\(pageSize)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data else { return }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(DisneyCharactersResponse.self, from: data)
                completion(decoded, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
