module DarkMode
### A Pluto.jl notebook ###
# v0.12.16

using Markdown
using InteractiveUtils

# ╔═╡ 302fd2e2-05ad-11eb-1596-6d1114faf8a1
html"""
<h2>Custom CodeMirror themes</h2>
<p>
	All possible themes are defined in the themes array below (they are from
	<a href="https://codemirror.net/theme/" target="_blank">codemirror themes</a> (opens in new window))
</p>
"""

# ╔═╡ 0867504a-05b3-11eb-3bae-ff7fd4cc79fa
"Available CodeMirror themes"
themes = [
  "3024-day",
  "3024-night",
  "abcdef",
  "ambiance-mobile",
  "ambiance",
  "ayu-dark",
  "ayu-mirage",
  "base16-dark",
  "base16-light",
  "bespin",
  "blackboard",
  "cobalt",
  "colorforth",
  "darcula",
  "dracula",
  "duotone-dark",
  "duotone-light",
  "eclipse",
  "elegant",
  "erlang-dark",
  "gruvbox-dark",
  "hopscotch",
  "icecoder",
  "idea",
  "isotope",
  "lesser-dark",
  "liquibyte",
  "lucario",
  "material-darker",
  "material-ocean",
  "material-palenight",
  "material",
  "mbo",
  "mdn-like",
  "midnight",
  "monokai",
  "moxer",
  "neat",
  "neo",
  "night",
  "nord",
  "oceanic-next",
  "panda-syntax",
  "paraiso-dark",
  "paraiso-light",
  "pastel-on-dark",
  "railscasts",
  "rubyblue",
  "seti",
  "shadowfox",
  "solarized",
  "ssms",
  "the-matrix",
  "tomorrow-night-bright",
  "tomorrow-night-eighties",
  "ttcn",
  "twilight",
  "vibrant-ink",
  "xq-dark",
  "xq-light",
  "yeti",
  "yonce",
  "zenburn"
]

# ╔═╡ 3527385c-05ae-11eb-011a-ddf55b18503e
html"""
<h2> Dark mode stylings </h2>
<p>WIP (big stylesheet below)</p>
"""

# ╔═╡ dc740e14-058b-11eb-1760-3da8b7eb5ca3
dark_mode_html() = html"""
<style>
	body {
		background-color: hsl(0, 0%, 15%);
	}

	/*
	main {
		max-width: 900px;
	}
	*/

	body > header, footer, pluto-helpbox > header {
    	background-color: hsl(0, 0%, 8%);
		color: hsl(0, 0%, 90%);
	}

	body > header * {
		color: white;
	}


	preamble {
		filter: invert(1);
	}

	nav#at_the_top img {
		 filter: invert(1) hue-rotate(180deg) brightness(0.8) saturate(1.1);
	}

	nav#at_the_top button.toggle_export,
	nav#undo_delete {
		filter: invert(1);
	}

	body.disconnected > header {
		background-color: hsla(18, 35%, 47%, 50%);
	}

	pluto-input > button {
		filter: invert(1);
	}

	pluto-output {
		background-color: hsl(229, 5%, 10%);
		color: hsl(0, 0%, 90%);
	}

	pluto-output h1,
	pluto-output h2,
	pluto-output h3,
	pluto-output h4,
	pluto-output h5,
	pluto-output h6 {
		color: hsl(0, 0%, 90%);
	}

	pluto-output code {
		color: hsl(0, 0%, 80%)
	}

	pluto-output a {
		filter: invert(1);
	}

	pluto-output jltree, jltree *, jltree * * {
		filter: brightness(5);
	}

	nav#at_the_top img {
		filter: invert(1) hue-rotate(180deg) contrast(0.85);
	    }

	jlerror > header {
		color: hsl(348, 40%, 90%);
	}

	pluto-filepicker .cm-s-material-palenight .cm-operator {
		color: #ff3b00;
	}

	jltree::before, jltree::after {
		filter: invert(1);
	}

	header.show_export header, header.show_export b {
		color: initial;
	}

	cell>button,
	cellinput>button,
	runarea>button,
	cellshoulder>button,
	slide-controls>button {
		color: white;
	}

	pluto-shoulder > button > span::after,
	pluto-cell.code_folded > pluto-shoulder > button > span::after {
		filter: invert(1);
	}

	pluto-cell > button {
		filter: invert(1);
	}

	cell.running > trafficlight {
		background: repeating-linear-gradient(-45deg,
		hsla(20, 20%, 80%, 1),
		hsla(20, 20%, 80%, 1) 8px,
		hsla(20, 20%, 80%, 0.1) 8px,
		hsla(20, 20%, 80%, 0.1) 16px);
	}

	cell.running.error > trafficlight {
		background: repeating-linear-gradient(-45deg,
            hsl(0, 100%, 71%),
            hsl(0, 100%, 71%) 8px,
            hsla(12, 71%, 47%, 0.33) 8px,
            hsla(12, 71%, 47%, 0.33) 16px);
	}

	pluto-runarea {
		filter: invert(1) brightness(1.9) contrast(1);
	}

	pluto-helpbox {
		color: hsl(0, 0%, 90%);
		background-color: hsl(0, 0%, 10%);
	}

	footer a {
		color: hsl(0, 0%, 95%);
	}

	footer input {
		background-color: hsl(0, 0%, 13%);
    	color: hsl(0, 0%, 85%);
	}

	/* CODEMIRROR STYLE */

	/* Custom Jelmar options */

	/*

	::-webkit-scrollbar {
		width: 14px;
		background-color: hsl(0, 0%, 15%);
	}

	::-webkit-scrollbar-thumb {
		box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
		background-color: hsla(0, 0%, 10%);
	}

	pre.CodeMirror-line {
		padding-left: 0.8em !important;
		padding-right: 0.8em !important;
	}

	.CodeMirror-placeholder {
		margin-left: 0.8em !important;
	}

	pluto-input .CodeMirror,
	ul.CodeMirror-hints {
		font-size: 0.8em;
	}

	pluto-output code {
		font-size: 0.9em;
	}

	*/
</style>
"""

# ╔═╡ 1cc41890-38ce-11eb-025d-d5d397968bc3
function PresentationMode(enabled=false)
	checked = enabled ? "checked" : ""
	run = enabled ? "present(document.getElementById('presentation-mode'))" : ""
	return HTML("""
<!-- This is a copy paste from fonsi's code -->
<input
	type="checkbox"
	id="presentation-mode"
	name="presentation-mode"
    onclick="window.plutoOptIns.present(this)"
	$(checked)>
<label for="presentation-mode">
	Presentation Mode
</label>
<nav id="slide_controls">
	<button
		class="changeslide prev"
		onclick="window.plutoOptIns.go_previous_slide()"
		title="Previous slide">
 		<span></span>
	</button>
	<button 
		class="changeslide next"
		onclick="window.plutoOptIns.go_to_next_slide()"
		title="Next slide">
		<span></span>
	</button>
</nav>
<style>
body.presentation pluto-output h1,
body.presentation pluto-output h2 {
    margin-top: 100vh;
}
body.presentation pluto-notebook {
    padding-bottom: 100vh;
}
body.presentation #helpbox-wrapper {
    display: none !important;
}

div > nav#slide_controls {
    display: none;
}

body.presentation div > nav#slide_controls {
    display: flex;
    position: fixed;
    bottom: 0px;
    right: 0px;
    z-index: 10;
}

div > nav#slide_controls > button {
    position: static;
    padding: 5px;
}

div > nav#slide_controls > button > span::after {
    content: " " !important;
    display: block;
    height: 30px;
    width: 30px;
    background-size: 30px 30px;
}
div > nav#slide_controls > button.prev > span::after {
    background-image: url(https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/arrow-back-outline.svg);
}
div > nav#slide_controls > button.next > span::after {
    background-image: url(https://cdn.jsdelivr.net/gh/ionic-team/ionicons@5.0.0/src/svg/arrow-forward-outline.svg);
}

body.presentation pluto-output h1,
body.presentation pluto-output h2 {
   	margin-top: 100vh;
}
</style>
<script>
	const present = (e) => {
		e.checked
		? document.body.classList.add("presentation")
		: document.body.classList.remove("presentation")
	}
	const calculate_slide_positions = () => {
        const height = window.innerHeight
        const headers = Array.from(document.querySelectorAll("pluto-output h1, pluto-output h2"))
        const pos = headers.map((el) => el.getBoundingClientRect())
        const edges = pos.map((rect) => rect.top + window.pageYOffset)

        const notebook_node = document.querySelector("pluto-notebook")
        edges.push(notebook_node.getBoundingClientRect().bottom + window.pageYOffset)

        const scrollPositions = headers.map((el, i) => {
            if (el.tagName == "H1") {
                // center vertically
                const slideHeight = edges[i + 1] - edges[i] - height
                return edges[i] - Math.max(0, (height - slideHeight) / 2)
            } else {
                // align to top
                return edges[i] - 20
            }
        })

        return scrollPositions
    }
	const go_previous_slide = (e) => {
        const positions = calculate_slide_positions()

        window.scrollTo(
            window.pageXOffset,
            positions.reverse().find((y) => y < window.pageYOffset - 10)
        )
    }

    const go_next_slide = (e) => {
        const positions = calculate_slide_positions()
        window.scrollTo(
            window.pageXOffset,
            positions.find((y) => y - 10 > window.pageYOffset)
        )
    }
	
	window.plutoOptIns = window.plutoOptIns || {}
	window.plutoOptIns.present = present
	window.plutoOptIns.go_previous_slide = go_previous_slide
	window.plutoOptIns.go_next_slide = go_next_slide
	$(run)
</script>
""")
end

# ╔═╡ f695546c-38d3-11eb-29f9-dde2a0be93ce
function WidthOverDocs(enabled=false)
	checked = enabled ? "checked" : ""
	init = enabled ? "toggle_width(document.getElementById('width-over-livedocs'))" : ""
	return HTML("""
<!-- https://github.com/fonsp/Pluto.jl/issues/400#issuecomment-695040745 -->
<input
	type="checkbox"
	id="width-over-livedocs"
	name="width-over-livedocs"
    onclick="window.plutoOptIns.toggle_width(this)"
	$(checked)>
<label for="width-over-livedocs">
	Activate bigger width - hiding live docs
</label>
<style>
	body.width-over-docs #helpbox-wrapper {
    	display: none !important;
	}
	body.width-over-docs main {
		max-width: calc(100% - 4rem);
		margin-right: 2rem;
	}
</style>
<script>
	const toggle_width = function(t) {
		t.checked 
		? document.body.classList.add("width-over-docs")
		: document.body.classList.remove("width-over-docs")
	}
	window.plutoOptIns = window.plutoOptIns || {}
	window.plutoOptIns.toggle_width = toggle_width
	$(init)
</script>
""")
end

# ╔═╡ d5d7e6d4-38d5-11eb-11c9-dd30437ba93c
function Ligatures(enabled=false)
	checked = enabled ? "checked" : ""
	init = enabled ? "toggle_ligatures(document.getElementById('ligatures'))" : ""
	return HTML("""
<input
	type="checkbox"
	id="ligatures"
	name="ligatures"
    onclick="window.plutoOptIns.toggle_ligatures(this)" $(checked)>
<label for="ligatures">
	Activate ligatures
</label>
<style>
	body.ligatures {
		font-variant-ligatures: contextual;
		font-feature-settings: "zero", "ss01", "ss02", "ss04", "ss05", "ss06", "ss08", "ss10", "ss11";
	}
	body.ligatures .CodeMirror pre.CodeMirror-line,
	body.ligatures .CodeMirror pre.CodeMirror-line-like {
    	-webkit-font-variant-ligatures: contextual;
    	font-variant-ligatures: contextual;
	}
</style>
<script>
	const toggle_ligatures = function(t) {
		t.checked  
		? document.body.classList.add("ligatures")
		: document.body.classList.remove("ligatures")
	} // ---  |> --> -> 0 1 * a g r `
	window.plutoOptIns = window.plutoOptIns || {}
	window.plutoOptIns.toggle_ligatures = toggle_ligatures
	$(init)
</script> 
""")
end

# ╔═╡ 34d4446a-3a62-11eb-0a6e-2f48fcc7a60c
function CSSDarkMode(defaultTheme; darkenPluto=false)
	themes = [
  "3024-day",
  "3024-night",
  "abcdef",
  "ambiance-mobile",
  "ambiance",
  "ayu-dark",
  "ayu-mirage",
  "base16-dark",
  "base16-light",
  "bespin",
  "blackboard",
  "cobalt",
  "colorforth",
  "darcula",
  "dracula",
  "duotone-dark",
  "duotone-light",
  "eclipse",
  "elegant",
  "erlang-dark",
  "gruvbox-dark",
  "hopscotch",
  "icecoder",
  "idea",
  "isotope",
  "lesser-dark",
  "liquibyte",
  "lucario",
  "material-darker",
  "material-ocean",
  "material-palenight",
  "material",
  "mbo",
  "mdn-like",
  "midnight",
  "monokai",
  "moxer",
  "neat",
  "neo",
  "night",
  "nord",
  "oceanic-next",
  "panda-syntax",
  "paraiso-dark",
  "paraiso-light",
  "pastel-on-dark",
  "railscasts",
  "rubyblue",
  "seti",
  "shadowfox",
  "solarized",
  "ssms",
  "the-matrix",
  "tomorrow-night-bright",
  "tomorrow-night-eighties",
  "ttcn",
  "twilight",
  "vibrant-ink",
  "xq-dark",
  "xq-light",
  "yeti",
  "yonce",
  "zenburn"
]
	
darkstyle = """
	body {
		background-color: hsl(0, 0%, 32%);
	}
	/*
	main {
		max-width: 900px;
	}
	*/
	body > header, footer, pluto-helpbox > header {
    	background-color: hsl(0, 0%, 8%);
		color: hsl(0, 0%, 90%);
	}
	body > header * {
		color: white;
	}
	preamble {
		filter: invert(1);
	}
	nav#at_the_top img {
		 filter: invert(1) hue-rotate(180deg) brightness(0.8) saturate(1.1);
	}
	nav#at_the_top button.toggle_export,
	nav#undo_delete {
		filter: invert(1);
	}
	body.disconnected > header {
		background-color: hsla(18, 35%, 47%, 50%);
	}
	pluto-input > button {
		filter: invert(1);
	}
	pluto-output {
		background-color: hsl(229, 5%, 10%);
		color: hsl(0, 0%, 90%);
	}
	pluto-output h1,
	pluto-output h2,
	pluto-output h3,
	pluto-output h4,
	pluto-output h5,
	pluto-output h6 {
		color: hsl(0, 0%, 90%);
	}
	pluto-output code {
		color: hsl(0, 0%, 80%)
	}
	pluto-output a {
		filter: invert(1);
	}
	pluto-output jltree, jltree *, jltree * * {
		filter: brightness(5);
	}
	nav#at_the_top img {
		filter: invert(1) hue-rotate(180deg) contrast(0.85);
	    }
	jlerror > header {
		color: hsl(348, 40%, 90%);
	}
	pluto-filepicker .cm-s-material-palenight .cm-operator {
		color: #ff3b00;
	}
	jltree::before, jltree::after {
		filter: invert(1);
	}
	header.show_export header, header.show_export b {
		color: initial;
	}
	cell>button,
	cellinput>button,
	runarea>button,
	cellshoulder>button,
	slide-controls>button {
		color: white;
	}
	pluto-shoulder > button > span::after,
	pluto-cell.code_folded > pluto-shoulder > button > span::after {
		filter: invert(1);
	}
	pluto-cell > button {
		filter: invert(1);
	}
	cell.running > trafficlight {
		background: repeating-linear-gradient(-45deg,
		hsla(20, 20%, 80%, 1),
		hsla(20, 20%, 80%, 1) 8px,
		hsla(20, 20%, 80%, 0.1) 8px,
		hsla(20, 20%, 80%, 0.1) 16px);
	}
	cell.running.error > trafficlight {
		background: repeating-linear-gradient(-45deg,
            hsl(0, 100%, 71%),
            hsl(0, 100%, 71%) 8px,
            hsla(12, 71%, 47%, 0.33) 8px,
            hsla(12, 71%, 47%, 0.33) 16px);
	}
	pluto-runarea {
		filter: invert(1) brightness(1.9) contrast(1);
	}
	pluto-helpbox {
		color: hsl(0, 0%, 90%);
		background-color: hsl(0, 0%, 10%);
	}
	footer a {
		color: hsl(0, 0%, 95%);
	}
	footer input {
		background-color: hsl(0, 0%, 13%);
    	color: hsl(0, 0%, 85%);
	}
	/* CODEMIRROR STYLE */
	/* Custom) Jelmar options */
	/*
	::-webkit-scrollbar {
		width: 14px;
		background-color: hsl(0, 0%, 15%);
	}
	::-webkit-scrollbar-thumb {
		box-shadow: inset 0 0 6px rgba(0, 0, 0, .3);
		background-color: hsla(0, 0%, 10%);
	}
	pre.CodeMirror-line {
		padding-left: 0.8em !important;
		padding-right: 0.8em !important;
	}
	.CodeMirror-placeholder {
		margin-left: 0.8em !important;
	}
	pluto-input .CodeMirror,
	ul.CodeMirror-hints {
		font-size: 0.8em;
	}
	pluto-output code {
		font-size: 0.9em;
	}
	*/"""
	options = join(map(x -> """<option value='$(x)\' $(defaultTheme == x ? "selected" : "")>$(x)</option>""", themes))
	return HTML("""
<label for="theme-selector">Select theme</label>
<select id="dark-theme-select" name="theme-selector" onfocus="this.selectedIndex = -1;">
	<option value="default">default</option>
$(options)
	</select>
<style id="dark-theme-style"></style>
<script>

function cm_theme_changer(theme) {
	fetch(
		"https://cdn.jsdelivr.net/npm/codemirror@5.55.0/theme/" + theme + ".css"
	).then(
		res => res.text()
	).then(
		x => {
		if (theme === 'default')
			document.getElementById("dark-theme-style").innerHTML = ''
		else document.getElementById("dark-theme-style")
		.innerHTML = `\${x
 	/* Pluto theme */
		.replace(new RegExp(theme, 'g'), 'default')
 	/* raise specificity */
		.replace(/\\.cm-s-default/g, \".cm-s-default.cm-s-default\")
	}$(darkenPluto ? darkstyle : "")`;
	})
}
cm_theme_changer("$(defaultTheme)")
document.getElementById("dark-theme-select").onchange = event => cm_theme_changer(event.target.value);
</script>
""")
end

# ╔═╡ 736a7f5a-38dc-11eb-10b3-c7ce8aa598c4
function Toolbox(; ligatures=false,
		presentation=false,
		theme="lucario",
		darkenPluto=false,
		width="normal")
	
	return md"""
Name 				| Usage 				| Tool  
:---  				| :--- 					| :---
More Width 			| `WidthOverDocs(false)` 	| $(WidthOverDocs(width == "wide"))
Presentation Mode 	| `PresentationMode(false)`	| $(PresentationMode(presentation))
Enable Ligatures 	| `Ligatures(false)` 		| $(Ligatures(ligatures))
CSS - Dark Mode 	| `CSSDarkMode(theme; darkenPluto=darkenPluto)` | $(CSSDarkMode("lucario"; darkenPluto=false))
"""
end

# ╔═╡ a34edd1a-3bf7-11eb-3039-159d9e5802cd
Toolbox(ligatures=true)

# ╔═╡ 51271e08-064e-11eb-1fa1-e7971164cddf
import JSON

# ╔═╡ f3694ed2-05a8-11eb-0c42-c1163dd14e7a
cm_theme_html(theme, cm_config=Dict()) = begin
		cm_config = JSON.json(cm_config)
		HTML("""
		<script id="__customize_cm_script">
			const addCss = (url) => {
				let link = document.createElement("link");
				link.type = "text/css";
				link.rel = "stylesheet";
					link.href = url;
				document.head.appendChild(link);
			}

			let cm_config = $cm_config;

			const updateCodeMirrors = (theme) => {
				// Your custom cm config goes here
				let config = {
					...(theme ? { theme } : {}),
					...cm_config
				}

				let add_config = (cm) => {
					Object.entries(config).forEach(([key, value]) => {
						cm.setOption(key, value);
					});
				}

				// Modify the current cells
				let editors = document.querySelectorAll('.CodeMirror');
				editors.forEach(editor => {
					let cm = editor.CodeMirror;
					add_config(cm);
				});

				// When a new cell gets added, we still have to wait for CM to init :/
				const cmObserver = new MutationObserver((mutations, observer) => {
					mutations.forEach(mutation => {
						console.log(mutation);
						if (mutation.type === 'childList') {
							mutation.addedNodes?.forEach(node => {
								let cm = node?.CodeMirror;
								if (!cm) {
									return
								}
								add_config(cm);
							});
						}
					});
					observer.disconnect();
				});

				// When new cells get added, modify them too (hacky)
				const observer = new MutationObserver((mutations, observer) => {
					mutations.forEach(mutation => {
						if (mutation.type === 'childList') {
							mutation.addedNodes?.forEach(node => {
								let input = node.querySelector('pluto-input');
								if (!input) {
									return
								}
								console.log(input);
								cmObserver.observe(input, {
									subtree: false,
									childList: true,
									attributes: false,
								});
							});
						}
					});
				});

				let target = document.querySelector('pluto-notebook');
				observer.observe(target, {
					subtree: false,
					childList: true,
					attributes: false,
				});
			}

			let theme = "$theme";

			if (theme) {
				addCss(`https://cdn.jsdelivr.net/npm/codemirror@5.55.0/theme/` + theme + `.css`);
				updateCodeMirrors(theme);
			}
		</script>
		""")
end

# ╔═╡ d6fb2ad4-0645-11eb-3613-3341978dca6d
"""
	enable(;
	  theme::String="material-palenight",
	  cm_config::Dict{String,Any}=Dict()
	)

Enable dark mode in Pluto 😊

Optionally pass in a codemirror theme and/or a codemirror config to apply.
For a list of available themes, see [`themes`](@ref).
For a list of possible codemirror options, see: [codemirror config](https://codemirror.net/doc/manual.html#config)

# Examples
```julia-repl
enable()

enable(theme="cobalt")

enable(theme="monokai", cm_config=Dict(
	"tabSize" => 2,
	"matchBrackets" => true,
))
```
"""
function enable(;theme="material-palenight", cm_config=Dict())
	if theme ∉ themes
		return (HTML("""
				<span style="color:red;">Error:</span>
				<span> invalid theme "$theme". Valid themes are:</span>
			"""),
			themes)
	end

	return HTML("""$(cm_theme_html(theme, cm_config).content)$(dark_mode_html().content)""")
end

# ╔═╡ Cell order:
# ╟─302fd2e2-05ad-11eb-1596-6d1114faf8a1
# ╟─0867504a-05b3-11eb-3bae-ff7fd4cc79fa
# ╟─f3694ed2-05a8-11eb-0c42-c1163dd14e7a
# ╟─3527385c-05ae-11eb-011a-ddf55b18503e
# ╟─dc740e14-058b-11eb-1760-3da8b7eb5ca3
# ╟─d6fb2ad4-0645-11eb-3613-3341978dca6d
# ╠═a34edd1a-3bf7-11eb-3039-159d9e5802cd
# ╠═736a7f5a-38dc-11eb-10b3-c7ce8aa598c4
# ╟─1cc41890-38ce-11eb-025d-d5d397968bc3
# ╟─f695546c-38d3-11eb-29f9-dde2a0be93ce
# ╟─d5d7e6d4-38d5-11eb-11c9-dd30437ba93c
# ╟─34d4446a-3a62-11eb-0a6e-2f48fcc7a60c
# ╟─51271e08-064e-11eb-1fa1-e7971164cddf

end
