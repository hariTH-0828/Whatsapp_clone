//
//  ViewModifiers.swift
//  Whatsapp_clone
//
//  Created by Hariharan R S on 19/07/24.
//

import SwiftUI


/// Default TabBar Icon
private struct DefaultTabBarIcon: ViewModifier {
    let color: Color
    
    init(background: Color) {
        self.color = background
    }
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(StyleManager.colorStyle.primary)
            .frame(width: 30, height: 30)
            .scaledToFit()
            .background(
                Circle()
                    .fill(color)
            )
    }
}

private struct OnScrollingChangeViewModifier: ViewModifier {
    let scrollingChangeThreshold: Double
    let scrollingStopThreshold: TimeInterval
    let onScrollingDown: () -> Void
    let onScrollingUp: () -> Void
    let onScrollingStopped: () -> Void
    
    @State private var scrollingStopTimer: Timer?
    @State private var offsetHolder: CGFloat = .zero
    @State private var initialOffset: CGFloat?
    
    func body(content: Content) -> some View {
        content.background {
            GeometryReader { proxy in
                Color.clear
                    .onChange(of: proxy.frame(in: .global).minY) { oldValue, newValue in
                        print("New value: \(newValue)")
                        // prevent triggering callback when boucing top edge to avoid jumpy animation
                        if initialOffset == nil {
                            initialOffset = oldValue
                        } else if newValue >= initialOffset! {
                            return
                        }
                        
                        if newValue < scrollingChangeThreshold {
                            // We set thresh hold to current offset so we can remember on next iterations.
                            offsetHolder = newValue
                            
                            // is scrolling down
                            onScrollingDown()
                            
                        } else if newValue > offsetHolder - scrollingChangeThreshold {
                            
                            // Save current offset to threshold
                            offsetHolder = newValue
                            // is scrolling up
                            onScrollingUp()
                        }
                        
                        scrollingStopTimer?.invalidate()
                        scrollingStopTimer = Timer.scheduledTimer(withTimeInterval: scrollingStopThreshold, repeats: false, block: { _ in
                            onScrollingStopped()
                        })
                    }
                    .onChange(of: offsetHolder) { _, newValue in
                        print("OffsetHolder: \(newValue)")
                    }
            }
        }
    }
}

private struct DefaultButtonStyle: ViewModifier {
    var selected: Bool
    var height: CGFloat
    
    init(selected: Bool, height: CGFloat) {
        self.selected = selected
        self.height = height
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(.footnote, weight: .semibold))
            .foregroundStyle(selected ? StyleManager.colorStyle.chipForeground : Color(uiColor: .lightGray))
            .frame(height: height)
            .padding(.horizontal, 10)
            .background(
                Capsule()
                    .fill(selected ? StyleManager.colorStyle.chipBackground : Color(.tertiarySystemBackground))
            )
    }
}

extension View {
    
    func defaultTabBarIcon(bgColor: Color = Color(uiColor: .secondarySystemFill)) -> some View {
        modifier(DefaultTabBarIcon(background: bgColor))
    }
    
    func onScrollingChange(
        scrollingChangeThreshold: Double = 100.0,
        scrollingStopThreshold: TimeInterval = 0.3,
        onScrollingDown: @escaping () -> Void,
        onScrollingUp: @escaping () -> Void,
        onScrollingStopped: @escaping () -> Void) -> some View {
            self.modifier(OnScrollingChangeViewModifier(scrollingChangeThreshold: scrollingChangeThreshold, scrollingStopThreshold: scrollingStopThreshold, onScrollingDown: onScrollingDown, onScrollingUp: onScrollingUp, onScrollingStopped: onScrollingStopped))
        }
    
    func defaultButtonStyle(isSelected: Bool, _ height: CGFloat = 26) -> some View {
        modifier(DefaultButtonStyle(selected: isSelected, height: height))
    }
}
