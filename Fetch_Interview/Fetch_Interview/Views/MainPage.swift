
import SwiftUI

struct MainPage: View {
    @ObservedObject var model = ViewModel()

    var body: some View {
        NavigationView{
            List{
                ForEach(model.meals){ meal in
                    Item(meal: meal)
                }
            }
            .navigationTitle("All Dessert")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear{
            model.fetchMeals() 
        }
        .foregroundColor(.black)
    }
}


#Preview {
    MainPage()
}
