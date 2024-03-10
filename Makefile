pages:
	npm run build
	git subtree push --prefix dist origin gh-pages
#positron:
#	pkl eval get-positron.pkl > positron.pkl
style:
	pkl eval -f json positron.pkl > docs/data/style.json
extract:
	pmtiles extract --region=region.geojson https://tile.openstreetmap.jp/static/planet.pmtiles docs/data/tkl.pmtiles
