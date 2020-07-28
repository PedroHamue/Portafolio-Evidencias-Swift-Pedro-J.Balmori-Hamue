import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode)
    var presentationMode
    var Streaming: Streaming
    var body: some View {
        ScrollView{
            VStack{
                Image(Streaming.image)
                .resizable()
                    .aspectRatio(contentMode: .fit)
                Text(Streaming.name)
                    .font(.system(.title,design:.rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .frame(width:300)
                .lineLimit(3)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
    .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action:{
            self.presentationMode.wrappedValue
            .dismiss()
        },label:{
            Image(systemName: "arrow.left.circle.fill")
                .font(.title)
                .foregroundColor(.white)
            
        }))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(Streaming: Streaming(name: "Netflix",image:"netflix",priceLevel:3))
    }
}

