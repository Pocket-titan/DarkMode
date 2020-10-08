# DarkMode
Dark mode for Pluto 🎉

NOTE: This is a work in progress, feel free to make a PR if you see any badly visible colors which I missed! You can experiment by using your browser console (`Ctrl+Shift+I` or `Cmd+Alt+I`), selecting elements & manually adding style rules, which you can put into a `html"<style> $css_rules_go_here </style>"` to always enable them in your notebook. Please make a PR if you find any! The colors themselves don't really matter, just make sure it's legible. This way we can sort of crowdsource the workload :)

![How to use](https://user-images.githubusercontent.com/4435990/95021467-76416380-0671-11eb-88a5-8c3bfd23a530.gif)

Add this cell to your Pluto notebook:
```julia
begin
    import Pkg
    Pkg.add(url="https://github.com/Pocket-titan/DarkMode")
    import DarkMode
    DarkMode.enable()
end
```

`DarkMode.enable` optionally takes a `theme` argument (which is the name of a codemirror theme), and a `cm_config` `Dict` allowing you to provide custom CodeMirror options. Like this:
```julia
DarkMode.enable(theme="monokai", cm_config=Dict("tabSize" => 2))
```
See the function signature in the Pluto docs (type `?DarkMode.enable` or click on the `enable` call) for more info.
For a list of all available CodeMirror themes, see [here](https://codemirror.net/theme/). For a list of all CodeMirror options, see [here](https://codemirror.net/doc/manual.html#config).

NOTE: if you remove the `DarkMode.enable()` call, you have to refresh your page in order to go back to the light theme.
