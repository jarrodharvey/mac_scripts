-- Loop to repeat every 6 minutes
repeat
    -- Log: Saving current active application
    do shell script "echo 'Saving the current active application...'"

    -- Save the current active application
    tell application "System Events"
        set activeApp to name of first application process whose frontmost is true
    end tell

    -- Log: Switching workspace
    do shell script "echo 'Switching to the workspace using Cmd + Ctrl + Shift + G...'"

    -- Focus on the workspace using "Cmd + Ctrl + Shift + G"
    tell application "System Events"
        keystroke "g" using {command down, control down, shift down}
    end tell

    delay 1 -- Adjust the delay if needed to wait for workspace switch

    -- Log: Pressing the tilde key (~)
    do shell script "echo 'Pressing the tilde (~) key...'"

    -- Press the tilde key (~)
    tell application "System Events"
        key code 50 using {shift down} -- 50 is the key code for the tilde key (~)
    end tell

    delay 0.5 -- Short delay if necessary

    -- Log: Returning to the original active application
    do shell script "echo 'Returning to the original active application...'"

    -- Return to the original active window/application
    tell application activeApp to activate

    -- Log: Waiting for 6 minutes
    do shell script "echo 'Waiting for 6 minutes before next run...'"

    -- Wait for 6 minutes (360 seconds)
    delay 360
end repeat