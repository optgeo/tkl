---
toc: false
---

# Hello, Tokyo Local

```html
<link href="https://unpkg.com/maplibre-gl/dist/maplibre-gl.css" rel="stylesheet" />
```

```js
import maplibregl from "npm:maplibre-gl"
let pmtiles = await import("https://cdn.skypack.dev/pmtiles")
maplibregl.addProtocol('pmtiles', (new pmtiles.Protocol()).tile)

const div = display(document.createElement("div"))
div.style = "height: 600px;"

//const style = "https://gsi-cyberjapan.github.io/optimal_bvmap/style/std.json"
//const style = "https://openmaptiles.github.io/positron-gl-style/style-cdn.json"
const url = await FileAttachment('data/tkl.pmtiles').url()
const style = await FileAttachment('data/style.json').json()
style.sources.openmaptiles.tiles[0] = "pmtiles://" + url + "/{z}/{x}/{y}"

const map = new maplibregl.Map({
  container: div,
  style: style,
  center: [139.755, 35.691],
  zoom: 15
})
map.addControl(new maplibregl.FullscreenControl())
map.addControl(new maplibregl.NavigationControl())

invalidation.then(() => map.remove())
```
