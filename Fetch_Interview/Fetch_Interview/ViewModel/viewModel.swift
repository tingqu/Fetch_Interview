import Foundation

class ViewModel: ObservableObject {
    
    @Published var Meals: Meals?
    
    init(){
        fetchCourses()
    }
    
    func fetchCourses() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let courses = try JSONDecoder().decode(Fetch_Interview.Meals.self, from: data)
                DispatchQueue.main.async {
                    self.Meals = courses
                }
            } catch {
                print(error)
            }
        }.resume()
    }
    
}
