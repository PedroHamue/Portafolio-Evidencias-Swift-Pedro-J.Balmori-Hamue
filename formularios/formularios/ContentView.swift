import SwiftUI

struct ContentView: View {
    var StreamName = ["Netflix","HBO GO","Disney +","Prime Video"]
    var StreamImage = ["netflix","hbo","disney","prime"]
   @State var streamings = [
    Streaming(name:"Netflix",image:"netflix",priceLevel: 3,purchased:true,feature: true),
        Streaming(name:"HBO GO",image:"hbo",priceLevel:4),
        Streaming(name:"Disney +",image:"disney",priceLevel: 5,feature: true),
        Streaming(name:"Amazon Prime Video",image:"prime",priceLevel:1,purchased: true)
    ]
    @State private var showActionSheet = false
     @State  private var selectedStreaming: Streaming?
    @State private var showSettingsView: Bool = false
    @EnvironmentObject var settings: SettingsFactory
    var body: some View {
        NavigationView{
            List{
                ForEach(streamings.filter(shouldShowStreaming).sorted(by:self.settings.order.predicateSort())){ Streaming in
               
            ZStack{
            StreamRow(Streaming:Streaming)
                .contextMenu{
                    Button(action: {
                        self.setPurchased(item:Streaming)
                    }) {
                        HStack{
                            Text("comprar")
                               Image( systemName: "checkmark.circle.fill")
                        }
                        
                    }
                    Button(action: {
                        self.setFeature(item:Streaming)
                    }) {
                        HStack{
                            Text("Destacar")
                            Image( systemName: "star")
                        }
                        
                    }
                    Button(action: {
                        self.delete(item:Streaming)
                    }) {
                        HStack{
                            Text("Eliminar")
                            Image( systemName: "trash")
                        }
                        
                    }
                }
            .onTapGesture {
                self.showActionSheet.toggle()
                self.selectedStreaming = Streaming
                }
            .actionSheet(item: self.$selectedStreaming){ _ in
                ActionSheet(title: Text("Indica tu acción a realizar"), message: nil, buttons: [
                    .default(Text("Marcar como favorita"),action:{
                        if let selectedStreaming =
                            self.selectedStreaming{
                            self.setFeature(item:selectedStreaming)
                        }
                    }),
                    .destructive(Text("Eliminar app"),action:{
                        if let selectedStreaming =
                            self.selectedStreaming{
                            self.delete(item: selectedStreaming)
                            
                        }
                    }),
                    .cancel()
                ])
                }
                //NavigationLink(destination: DetailView(Streaming: Streaming)){
                    //EmptyView()
               // }
                }
            }.onDelete{(indexSet) in
                self.streamings.remove(atOffsets:indexSet)
                
                }
        }
        .navigationBarTitle("Apps de Streaming",displayMode:.automatic)
        .navigationBarItems(trailing:
        Button(action:{
            self.showSettingsView = true
        },label: {
            Image(systemName: "line.horizontal.3.decrease.circle")
                .font(.title)
                .foregroundColor(.black)
        })
        )
            .sheet(isPresented: $showSettingsView){
                SettingsView().environmentObject(self.settings)
        }
        }
    }
    private func setFeature(item Streaming: Streaming){
        if let idx = self.streamings.firstIndex(where: {$0.id == Streaming.id}){
            self.streamings[idx].feature.toggle()
        }
    }
    private func setPurchased(item Streaming: Streaming){
        if let idx = self.streamings.firstIndex(where: {$0.id == Streaming.id}){
            self.streamings[idx].purchased.toggle()
        }
        }
    private func delete(item Streaming: Streaming){
        if let idx = self.streamings.firstIndex(where: {$0.id == Streaming.id}){
            self.streamings.remove(at:idx)
        }
    }
    private func shouldShowStreaming(Streaming:Streaming)-> Bool {
        let checkPurchased = (self.settings.showPurchasedOnly && Streaming.purchased) || !self.settings.showPurchasedOnly
        let checkPrice = Streaming.priceLevel <= self.settings.maxPrice
        return checkPurchased && checkPrice
    }
  
        }
 



            
     

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingsFactory())
    }
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
                .padding(.trailing,10)
            VStack(alignment:.leading){
                HStack{
                Text(Streaming.name)
                    .font(.system(.body,design:.rounded))
                .bold()
                Text(String(repeating: "$",count:Streaming.priceLevel))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                }
            }
            Spacer().layoutPriority(-10)
            if Streaming.feature {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            if Streaming.purchased{
                Image(systemName:"checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            
        }
    }
}




