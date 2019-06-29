require 'json'

def rule(desc, *rules)
    {
        description: desc,
        manipulators: rules
    }
end

def hotkey_for_command(mod, key, command)
    {
        type: "basic",
        from: {
            key_code: key,
            modifiers: {
                mandatory: mod
            }
        },
        to: [
            {
                shell_command: command
            }
        ]
    }
end

mod1 = [ "left_option" ]
chunk_tile = "/usr/local/bin/chunkc tiling::window"
chunk_monitor = "/usr/local/bin/chunkc tiling::monitor"

puts JSON.pretty_generate({title: 'chunkwm key bindings', rules: [
    rule("focus application",
        hotkey_for_command( mod1, "t", "open '/Applications/iTerm.app'"),              # terminal
        hotkey_for_command( mod1, "b", "open '/Applications/Google Chrome.app'"),      # browser
        hotkey_for_command( mod1, "c", "open '/Applications/Visual Studio Code.app'"), # coding
        hotkey_for_command( mod1, "p", "open '/Applications/Bitwarden.app'"),          # password
    ),
    rule("move window",
        hotkey_for_command( mod1, "close_bracket", "#{chunk_tile} --swap next"),
        hotkey_for_command( mod1, "open_bracket", "#{chunk_tile} --swap prev"),
        *( (1..9).map(&:to_s).map{ |i|
            hotkey_for_command( mod1, i, "#{chunk_tile} --send-to-desktop #{i}")
        } )
    ),
    rule("resize",
        hotkey_for_command( mod1, "h", "#{chunk_tile} --use-temporary-ratio 0.05 --adjust-window-edge west"),
        hotkey_for_command( mod1, "l", "#{chunk_tile} --use-temporary-ratio 0.05 --adjust-window-edge east"),
        hotkey_for_command( mod1, "k", "#{chunk_tile} --use-temporary-ratio 0.05 --adjust-window-edge north"),
        hotkey_for_command( mod1, "j", "#{chunk_tile} --use-temporary-ratio 0.05 --adjust-window-edge south"),
        hotkey_for_command( mod1, "return_or_enter", "#{chunk_tile} --toggle fullscreen"),
        hotkey_for_command( mod1, "f", "#{chunk_tile} --toggle parent"),
    ),
]})
