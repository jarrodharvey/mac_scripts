on run argv
    if (count of argv) is equal to 0 then
        display dialog "Please provide a mouse speed value as a parameter." buttons {"OK"} default button "OK"
        return
    end if

    set mouseSpeed to item 1 of argv
    try
        -- Convert the argument to a number (0.0 to 3.0 range)
        set mouseSpeed to mouseSpeed as number
        
        if mouseSpeed < 0.0 or mouseSpeed > 3.0 then
            display dialog "Please provide a value between 0.0 and 3.0." buttons {"OK"} default button "OK"
            return
        end if

        -- Open System Settings (previously System Preferences)
        tell application "System Settings"
            activate
            delay 1
        end tell

        -- Use System Events to navigate and manipulate the UI
        tell application "System Events"
            tell process "System Settings"
                -- Click "Mouse" in the sidebar (you may need to adjust the name based on your language and system configuration)
                try
                    click menu item "Mouse" of menu "View" of menu bar 1
                on error
                    display dialog "Unable to find Mouse settings."
                    return
                end try

                -- Wait for the Mouse pane to load
                delay 2

                -- Adjust the slider for mouse speed (assuming it's the first slider in the window)
                tell slider 1 of window 1
                    set value to mouseSpeed
                end tell
            end tell
        end tell

        display notification "Mouse speed set to " & mouseSpeed with title "Mouse Speed Updated"
    on error errMsg
        display dialog "Error: " & errMsg buttons {"OK"} default button "OK"
    end try
end run