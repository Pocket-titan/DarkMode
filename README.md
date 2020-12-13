# DarkMode
Dark mode for Pluto 🎉

NOTE: This is a work in progress, feel free to make a PR if you see any badly visible colors which I missed! You can experiment by using your browser console (`Ctrl+Shift+I` or `Cmd+Alt+I`), selecting elements & manually adding style rules, which you can put into a `html"<style> $css_rules_go_here </style>"` to always enable them in your notebook. Please make a PR if you find any! The colors themselves don't really matter, just make sure it's legible. This way we can sort of crowdsource the workload :)

### Update: this gif is outdated, see code below!
![How to use](https://user-images.githubusercontent.com/4435990/95021467-76416380-0671-11eb-88a5-8c3bfd23a530.gif)

Add this cell to your Pluto notebook:
```julia
begin
    import Pkg
    Pkg.add(PackageSpec(url="https://github.com/Pocket-titan/DarkMode"))
    import DarkMode
    DarkMode.enable()
    # OR DarkMode.Toolbox(theme="default")
end
```

`DarkMode.enable` optionally takes a `theme` argument (which is the name of a codemirror theme), and a `cm_config` `Dict` allowing you to provide custom CodeMirror options. Like this:
```julia
DarkMode.enable(theme="monokai", cm_config=Dict("tabSize" => 2))
```
See the function signature in the Pluto docs (type `?DarkMode.enable` or click on the `enable` call) for more info.
For a list of all available CodeMirror themes, see [here](https://codemirror.net/theme/). For a list of all CodeMirror options, see [here](https://codemirror.net/doc/manual.html#config).

NOTE: if you remove the `DarkMode.enable()` call, you have to refresh your page in order to go back to the light theme.

---
### CSS Dark Mode

A CSS Mode is provided on top of `DarkMode.enable()`. 

You can enable CSS mode typing `DarkMode.CSSDarkMode("zenburn")` (where "zenburn" is a theme, from the same theme list). Optionally, you can pass a keyword argument to darken Pluto, like this: `DarkMode.CSSDarkMode("zenburn", darkenPluto=true)`.

### Pluto Opt-Ins

`DarkMode.Toolbox()` provides a set of opt-in utilities, if you want them.

- `PresentationMode()` is the familiar to many presentation mode. Use it to add the arrows bottom right
- `Ligatures()` optionally activates ligatures.
- `WidthOverDocs()` activates a bigger width for the editor, while hiding LiveDocs

Pass a boolean argument if you want the feature enabled the next time you open your notebook.

You can also pass defaults to the `DarkMode.Toolbox()` using keyword arguments.

Signature is the following: 
```
DarkMode.Toolbox(ligatures=false,
		presentation=false,
		theme="lucario",
		darkenPluto=false,
		width="normal")
```

(use `width = "wide"` to enable `WideOverDocs()`)

#### Quickstart for CSS Dark Mode & Opt-Ins is the following:

```
begin
    import Pkg
    Pkg.add(url="https://github.com/pankgeorg/DarkMode")
    import DarkMode
    DarkMode.Toolbox(theme="lucario")
end
```

### Limitations/Caveats

1. Some themes may not play well with live docs code (some classes are missing, but you can test using the arrows on the dropdown!)
2. CSSDarkMode's default is *not* to darken the whole UI but only `code` blocks! Pass `darkenPluto=true` to get a really dark Pluto!
3. Please use each Opt-in once in each notebook!
4. Wide mode hides docs (what will probably change in the future)

### Next steps

- Make this a toolbar?
- Integrate parts in Pluto?

