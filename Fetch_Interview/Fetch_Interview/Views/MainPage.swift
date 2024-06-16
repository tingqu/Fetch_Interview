
import SwiftUI

struct MainPage: View {
    @ObservedObject var model = ViewModel()
    var body: some View {
        NavigationView{
            List{
                Item()
            }
            .navigationTitle("All Dessert")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image(systemName: "arrow.clockwise")
                    })
                }
            }
        }
        .foregroundColor(.black)
    }
    
    
}


#Preview {
    MainPage()
}
