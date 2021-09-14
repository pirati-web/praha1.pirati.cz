---
layout: default
mapycz_api: true
---
<div id="mapa" class="h-screen w-screen max-w-full"></div>
<style type="text/css">
.card-header { font-weight: bold; }
.card-body { margin: 10px 0 10px 0; }
.card-footer a {text-decoration:underline; }
</style>
<script type="text/javascript">
  var data = {{ site.data.map.posts | jsonify }}
  var center = SMap.Coords.fromWGS84(14.44, 50.11);
  var m = new SMap(JAK.gel("mapa"), center, 13);
  var l = new SMap.Layer.Marker();

  m.addDefaultLayer(SMap.DEF_BASE).enable();
  m.addDefaultControls();
  var c = []
  var layer = new SMap.Layer.Marker();
  for (const d in data) {
    var md = data[d]
    var coords = SMap.Coords.fromWGS84(md['coord']);
    c.push(coords)
    var marker = new SMap.Marker(coords);
    var card = new SMap.Card();
    card.getHeader().innerHTML = md['title'];
    card.getBody().innerHTML = md['text'];
    card.getFooter().innerHTML = 'Související <a href="/aktuality/stitky/' + md['slug'] + '/">aktuality</a> (' + md['size'] + ')';
    marker.decorate(SMap.Marker.Feature.Card, card);
    layer.addMarker(marker);
  }
  var center = m.computeCenterZoom(c);
  m.addLayer(layer).enable();
</script>
