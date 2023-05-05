//
//  searchView.swift
//  tvmaze
//
//  Created by Tanvir Rahman on 02.05.2023.
//

import SwiftUI

struct searchView: View {
    @State private var searchText: String = ""
    @State private var gotoProfileDetails: Bool = false
    @State private var gotoMovieDetails: Bool = false
    @State private var movieID: Int = -1
    @StateObject var search = searchMovieViewModel()
    @FocusState private var focusedTextField: Bool
    var body: some View {
        NavigationView{
            ZStack{
                NavigationLink(destination: profileDetailsView(), isActive: $gotoProfileDetails){
                    Text(" ")
                }
                NavigationLink(destination: movieDetailView(id: String(movieID)), isActive: $gotoMovieDetails){
                    Text(" ")
                }
                VStack{
                    HStack(spacing: 15){
                        TextField("Search", text: $searchText)
                            .padding(10)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.secondary, lineWidth: 1)
                            )
                            .focused($focusedTextField)
                            .submitLabel(.search)
                            .onSubmit{
                                if searchText != "" {
                                    onSubmitSearch()
                                }
                            }
                        Button{
                            if searchText != "" {
                                search.searchMovie(searchText: searchText)
                                DispatchQueue.main.async {
                                    search.responseCode = -2
                                }
                            }
                            focusedTextField = false
                        }label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(10)
                                .background(
                                    Color.gray
                                )
                        }
                    }.padding(10)
                    Spacer()
                    ZStack{
                        if search.responseCode == 200 {
                            ScrollView{
                                LazyVStack{
                                    if search.searchData[0].name?.count ?? 0 > 0 {
                                        ForEach(0..<search.searchData.count, id: \.self){ i in
                                            movieSearchItemsCell(movie: search.searchData[i])
                                                .onTapGesture {
                                                    gotoMovieDetails = true
                                                    movieID = search.searchData[i].id ?? -1
                                                }
                                        }
                                    }else{
                                        Spacer()
                                        Text("No Item Found!")
                                            .font(.largeTitle)
                                            .italic()
                                            .bold()
                                            .foregroundColor(.secondary)
                                        Spacer()
                                    }
                                }
                            }
                        }
                        if search.responseCode == -2 {
                            ScrollView{
                                VStack{
                                    ForEach(0..<15){ _ in
                                        movieSearchItemsCellReducted()
                                    }
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            gotoProfileDetails = true
                        }label: {
                            Label("Profile", systemImage: "person.text.rectangle")
                        }
                    }
                }
                
            }.simultaneousGesture(DragGesture().onChanged({ _ in
                focusedTextField = false
            }))
        }
    }
    func onSubmitSearch() {
        search.searchMovie(searchText: searchText)
    }
    
}

struct searchView_Previews: PreviewProvider {
    static var previews: some View {
        searchView()
    }
}
