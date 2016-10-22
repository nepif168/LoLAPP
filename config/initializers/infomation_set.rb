$version = ""
$item = ""
$champion = ""
$champion_spell = ""
$champion_passive = ""

def set_infomation
  if $version.blank?
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

    response = open('https://global.api.pvp.net/api/lol/static-data/jp/v1.2/champion?champData=spells&api_key=be54d281-87cc-4a71-84c3-6f0b2e95342c')
    data = response.read
    $champion_spell = JSON.parse(data)

    response = open('https://global.api.pvp.net/api/lol/static-data/jp/v1.2/champion?champData=passive&api_key=be54d281-87cc-4a71-84c3-6f0b2e95342c
')
    data = response.read
    $champion_passive = JSON.parse(data)
  end
end
