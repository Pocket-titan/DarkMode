# DarkMode
Dark mode for Pluto 🎉

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

NOTE: if you remove the `DarkMode.enable()` call, you have to refresh your page in order to go back to the light theme.
