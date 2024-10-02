-- Loop to repeat every 6 minutes
repeat
    -- Log: Saving current active application
    log "Saving the current active application..."

    -- Save the current active application with error handling
    try
        tell application "System Events"
            set activeApp to name of first application process whose frontmost is true
        end tell
    on error
        log "Failed to get the frontmost application. Continuing..."
        set activeApp to ""
    end try

    -- Log: Switching workspace
    log "Switching to the workspace using Cmd + Ctrl + Shift + G..."

    -- Focus on the workspace using "Cmd + Ctrl + Shift + G"
    tell application "System Events"
        keystroke "g" using {command down, control down, shift down}
    end tell

    delay 1 -- Adjust the delay if needed to wait for workspace switch

    -- Log: Pressing the tilde key (~)
    log "Pressing the tilde (~) key..."

    -- Press the tilde key (~)
    tell application "System Events"
        key code 50 using {shift down} -- 50 is the key code for the tilde key (~)
    end tell

    delay 0.5 -- Short delay if necessary

    -- Log: Returning to the original active application
    if activeApp is not "" then
        log "Attempting to return to the original active application (" & activeApp & ")..."
        try
            tell application activeApp to activate
        on error
            log "Failed to return to the application (" & activeApp & "). It might be closed or unavailable."
        end try
    else
        log "No application to return to."
    end if

    -- Log: Waiting for 6 minutes
    log "Waiting for 6 minutes before next run..."

    -- Wait for 6 minutes (360 seconds)
    delay 360
end repeat