require_relative 'network_helpers'

page = getHTTPPage("wiki.52poke.com/wiki/神奇宝贝列表（按全国图鉴编号）")

result = page.scan(/<td><span class="sprite-icon sprite-icon-(\d*)" title=""><\/span>
<\/td>
<td><a href="[^"]*" title=([^>]*)>[^<]*<\/a>
<\/td>
<td><a href="[^"]*" title=\S* class=mw-redirect>[^<]*<\/a>
<\/td>
<td><a href="[^"]*" title=(\w*) class=mw-redirect>[^<]*<\/a>
<\/td>
<[^>]*><a href="[^"]*" title=[^>]*>([^<]*)<\/a>
<\/td>
(?:<[^>]*><a href="[^"]*" title=[^>]*>)?([^<]*)?(?:<\/a>)?/m)

puts "Done"
puts result

