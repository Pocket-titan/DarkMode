# DarkMode
Dark mode for Pluto 🎉

Add this cell to your Pluto notebook:
```julia
begin
    import Pkg
    Pkg.add(url="https://github.com/Pocket-titan/DarkMode")
    import DarkMode
    DarkMode.enable()
end
```

NOTE: if you remove the `DarkMode.enable()` call, you have to refresh your page in order to go back to the light theme.
