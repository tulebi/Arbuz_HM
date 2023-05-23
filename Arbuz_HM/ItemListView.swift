import SwiftUI


struct ItemListView: View {
    @EnvironmentObject var arbuzmodel: ArbuzModel
    let items: [Item]
    var body: some View {
        List(items) { item in
            HStack {
                Image(item.image)
                    .resizable()
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading){
                    Text(item.name)
                    Text(item.typecount)
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                    ZStack{
                        RoundedRectangle(cornerRadius: 14)
                            .fill(Color.gray).opacity(0.2)
                        HStack(spacing: 15){
                            Image(systemName: "minus").opacity(arbuzmodel.quantity == 1 ? 0.3 : 1)
                                .onTapGesture {
                                    if arbuzmodel.quantity != 1{
                                        arbuzmodel.quantity -= 1
                                    }
                                }
                                .disabled(arbuzmodel.quantity == 0)
                            Text("\(arbuzmodel.quantity)")
                            Image(systemName: "plus")
                                .onTapGesture {
                                        arbuzmodel.quantity += 1
                                    arbuzmodel.total += item.price
                                }
                        }
                    }
                    .frame(width: 100, height: 30)
                }
                Spacer()
                    VStack(spacing: 40){
                            Image(systemName: "x.circle")
                                .foregroundColor(.green)
                                .onTapGesture {
                                    arbuzmodel.items.removeLast()
                                }
                        Text("\(item.price) ₸")
                    }
            }
        }
        .listStyle(.plain)
    }
}
