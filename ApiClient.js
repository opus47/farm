
//json-request
function jrq(method, url, callback) {

  var req = new XMLHttpRequest();
  req.onreadystatechange = function() {
    if(req.readyState == XMLHttpRequest.DONE) {
      var js = JSON.parse(req.response);
      callback(js)
    }
  }
  req.open(method, url);
  req.send();
}


function searchPieces(text, callback) {

  var etext = encodeURI(text);
  console.log("search string ", text);

  jrq("GET", "https://opus47.io/pieces/search?text="+etext, function(js) {

    js.forEach(function(x) {

      console.log("~");
      console.log("Composer: ", x.composer);
      console.log("Title: ", x.title);
      console.log("Key: ", x.key);
      console.log("Catalog: ", x.catalog);
      console.log("id: ", x.id);

    })

    callback(js);

  });
}

function getPieceInfo(id, callback) {

  jrq("GET", "https://opus47.io/pieces/"+id, function(js) {

    console.log("get piece info");
    console.log(JSON.stringify(js));

    callback(js);

  });

}
