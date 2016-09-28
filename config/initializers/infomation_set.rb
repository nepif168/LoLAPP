$version = ""
$item = ""
$champion = ""

def set_infomation
  #バージョンの取得
  response = open('https://ddragon.leagueoflegends.com/realms/jp.json')
  data = response.read
  realms = JSON.parse(data)
  $version = realms['v']
    #チャンピオン情報の取得
  response = open('http://ddragon.leagueoflegends.com/cdn/' + $version + '/data/ja_JP/champion.json')
  data = response.read
  $champion = JSON.parse(data)
    #アイテム情報の取得
  response = open('http://ddragon.leagueoflegends.com/cdn/' + $version + '/data/ja_JP/item.json')
  data = response.read
  $item = JSON.parse(data)
end
