import SwiftUI

struct ContentView: View {
    var StreamName = ["Netflix","HBO GO","Disney +","Prime Video"]
    var StreamImage = ["netflix","hbo","disney","prime"]
    var streamings = [
        Streaming(name:"Netflix",image:"netflix"),
        Streaming(name:"HBO GO",image:"hbo"),
        Streaming(name:"Disney +",image:"disney",feature:true),
          Streaming(name:"Amazon Prime Video",image:"prime")
    ]
    /*init(){
        let appearance = UINavigationBarAppearance()
        appearance.largeTitleTextAttributes = [.font: UIFont(name: "AmericanTypewriter-CondensedLight" ,size:32)!,.foregroundColor: UIColor.black]
        appearance.titleTextAttributes = [
            .font: UIFont(name:"AmericanTypewriter-CondensedLight",size: 18)!,
            .foregroundColor: UIColor.black
]
        appearance.setBackIndicatorImage(UIImage(systemName:"arrow.left.circle.fill"), transitionMaskImage: UIImage(systemName:"arrow.left.circle"))
        UINavigationBar.appearance().tintColor = .green
        UINavigationBar.appearance().standardAppearance = appearance
         UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }*/
    var body: some View {
        NavigationView{
        List(streamings.indices){idx in
            ZStack{
            if self.streamings[idx].feature{
                StreamingFullImageRow(Streaming: self.streamings[idx])
            }else{
                StreamRow(Streaming:self.streamings[idx])
            }
                NavigationLink(destination: DetailView(Streaming: self.streamings[idx])){
                    EmptyView()
                }
                
            }
        }
        .navigationBarTitle("Apps de Streaming",displayMode:.automatic)
        }
            }
            
        }

            
     

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
struct Streaming: Identifiable{
    var id = UUID()
    var name: String
    var image:String
    var feature: Bool = false
}

struct StreamRow: View {
    var Streaming : Streaming
    var body: some View {
        HStack {
            Image(Streaming.image)
                .resizable()
                .aspectRatio(contentMode:.fit) .frame(width:150,height:150)
                .clipped()
                .cornerRadius(10)
            Text(Streaming.name)
        }
    }
}
struct StreamingFullImageRow : View {
    var Streaming: Streaming
    var body: some View{
    HStack{
    ZStack{
        Image(Streaming.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height:200)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
            .foregroundColor(.gray)
                    .opacity(0.25)
        )
        Text(Streaming.name)
            .font(.system(.title,design:.rounded))
            .fontWeight(.bold)
            .foregroundColor(.white)
        
    }
    }
}
}

