module ChampionsHelper
  def spell_convert(index)
    spell_text = $champion_spell['data'][@champion_name]['spells'][index]['tooltip']

    unless $champion_spell['data'][@champion_name]['spells'][index]['vars'].blank?
      $champion_spell['data'][@champion_name]['spells'][index]['vars'].each do |var|
        spell_text = spell_text.gsub(/#{"{{ "+var['key']+" }}"}/, var['coeff'].to_s)
      end
    end

    i = -1
    $champion_spell['data'][@champion_name]['spells'][index]['effectBurn'].each do |n|
      i+=1
      if i==0
        next
      end
      spell_text = spell_text.gsub(/#{"{{ e"+i.to_s+" }}"}/, ' '+n+' ')
    end
    return spell_text.gsub(/class="color/, 'style="color:#')
  end
end
