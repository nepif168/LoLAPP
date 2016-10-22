module ItemsHelper
  def tags(key)
    tags_text = ""
    unless $item['data'][key]['tags'].blank?
      i = 0
      $item['data'][key]['tags'].each do |tag|
        tags_text += tag
        unless i==$item['data'][key]['tags'].length-1
          tags_text += ', '
        end
        i+=1
      end
    end
    return tags_text
  end
end
