# MouseCenter

MouseCenter is Hammerspoon spoon that recenters your mouse pointer on the primary display, and optionally highlights it with a brightly colored circle.

## Installation

1. Install hammerspoon from [Hammerspoon.org](https://hammerspoon.org), or via homebrew:

          brew install hammerspoon

2. Grab the latest release of [MouseCenter](https://github.com/zcutlip/MouseCenter/releases/latest/download/MouseCenter.spoon.zip)
3. Drop the unzipped spoon into `~/.hammerspoon/Spoons`
4. Optionally install `MouseCircle` from the Hammerspoon spoons [repository](https://www.hammerspoon.org/Spoons/MouseCircle.html)
5. Edit `~/.hammerspoon/init.lua` (create it if necessary) to include the following initialization:

    ```scheme
    hs.loadSpoon("MouseCenter")
    spoon.MouseCenter:bindHotkeys({center={{"alt", "shift"}, "c"}})
    ```

This will load MouseCenter, and bind it to ⇧+⌥+c. Set the hotkey to whatever combination you want. If you have MouseCircle installed, you'll get a visual highlight whenever you recenter the mouse pointer.