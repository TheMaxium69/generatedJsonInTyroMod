function CreateJson-Item {

$contenuJson = '{
  "parent": "item/'+ $args[1] +'",
  "textures": {
    "layer0": "tyromod:item/'+ $args[0] +'"
  }
}'

return $contenuJson


}