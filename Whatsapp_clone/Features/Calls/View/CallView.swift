//
//  CallView.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI

struct CallView: View {
    @StateObject private var viewModel: CallViewModel = CallViewModel()
    @State private var segmentSelection: SegmentTabs = .all
    @State private var searchText: String = ""
    @State private var editMode: EditMode = .inactive
    @State private var isPresentConfirmDialog: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                switch segmentSelection {
                case .all:
                    AllCallView()
                case .missed:
                    MissedCallView()
                }
            }
            .navigationTitle("Calls")
            .searchable(text: $searchText)
            .environment(\.editMode, $editMode)
            .confirmationDialog("", isPresented: $isPresentConfirmDialog, actions: {
                Button("Clear call history", role: .destructive) {
                    /// clear all recent call logs
                    withAnimation(.smooth) {
                        viewModel.callLogs.removeAll()
                        editMode = .inactive
                    }
                }
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    if editMode == .inactive {
                        Button(action: {
                            
                        }, label: {
                            Image(.icoPlus)
                                .renderingMode(.template)
                                .defaultTabBarIcon()
                        })
                    }else {
                        Button("Clear") {
                            isPresentConfirmDialog.toggle()
                        }
                        .foregroundStyle(StyleManager.colorStyle.primary)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    if editMode == .inactive {
                        Menu {
                            Button(action: {
                                withAnimation(.snappy) {
                                    editMode = editMode == .active ? .inactive : .active
                                }
                            }, label: {
                                Label("Edit", systemImage: "pencil.line")
                            })
                        } label: {
                            Image(.icoMeetball)
                                .renderingMode(.template)
                                .defaultTabBarIcon()
                        }
                    }else {
                        Button("Done") {
                            editMode = .inactive
                        }
                        .foregroundStyle(StyleManager.colorStyle.primary)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Picker(":", selection: $segmentSelection) {
                        Text(SegmentTabs.all.rawValue)
                            .tag(SegmentTabs.all)
                        
                        Text(SegmentTabs.missed.rawValue)
                            .tag(SegmentTabs.missed)
                    }
                    .pickerStyle(.segmented)
                    .frame(width: 200)
                }
            })
        }
    }
    
    
    @ViewBuilder
    func AllCallView() -> some View {
        Form {
            favouriteListView()
            
            recentListView(viewModel.callLogs)
        }
    }
    
    @ViewBuilder
    func MissedCallView() -> some View {
        Form {
            recentListView([])
        }
    }
    
    
    @ViewBuilder
    func recentListView(_ recentContacts: [RecentCallLogs]) -> some View {
        if !recentContacts.isEmpty {
            Section {
                List {
                    ForEach(recentContacts, id: \.id) { contact in
                        recentCellView(contact: contact)
                            .frame(height: 38)
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button(role: .destructive, action: {}) {
                                    Text("Delete")
                                }
                                .tint(.red)
                            }
                    }
                    .onDelete(perform: viewModel.delete(at:))
                }
            }header: {
                Text("Recents")
                    .textCase(.none)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(.primary)
                    .clipped()
            }
        }
    }
    
    @ViewBuilder
    func favouriteListView() -> some View {
        Section {
            List {
                Button(action: {}, label: {
                    Text("Add to Favourites")
                        .foregroundStyle(.green)
                })
                .frame(height: 18)
            }
        } header: {
            Text("Favourite")
                .textCase(.none)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.primary)
                .clipped()
        }
    }
    
    @ViewBuilder
    func recentCellView(contact _recentContact: RecentCallLogs) -> some View {
        HStack(spacing: 12, content: {
            Image(_recentContact.image)
                .resizable()
                .scaledToFill()
                .frame(width: 38, height: 38)
                .clipShape(.circle)
            
            VStack(alignment: .leading, content: {
                Text(_recentContact.name)
                    .font(.system(size: 18, weight: .regular))
                
                HStack(spacing: 3, content: {
                    if _recentContact.call == .incoming && _recentContact.type == .face {
                        Image(systemName: "arrow.down.left.video.fill")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }else if _recentContact.call == .outgoing && _recentContact.type == .face {
                        Image(systemName: "arrow.up.right.video.fill")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }else if _recentContact.call == .incoming && _recentContact.type == .voice {
                        Image(systemName: "phone.arrow.down.left.fill")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }else {
                        Image(systemName: "phone.arrow.up.right.fill")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    
                    Text(_recentContact.call.rawValue)
                        .font(.caption)
                        .foregroundStyle(.gray)
                })
            })
            
            Spacer()
            
            Text(_recentContact.day.rawValue)
                .font(.footnote)
                .foregroundStyle(.gray)
            
            Button(action: {}, label: {
                Image(systemName: "info.circle")
                    .foregroundStyle(StyleManager.colorStyle.primary)
            })
        })
    }
}

#Preview {
    CallView()
}
