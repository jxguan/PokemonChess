require_relative 'networkHelpers'

page = getHTTPPage("wiki.52poke.com/wiki/种族值列表（第五世代）")

result = page.scan(/<tr>
<th>(\d+)<\/th>
.*?
<td class="t-HP">(\d+)<\/td>
<td class="t-[^"]*">(\d+)<\/td>
<td class="t-[^"]*">(\d+)<\/td>
<td class="t-[^"]*">(\d+)<\/td>
<td class="t-[^"]*">(\d+)<\/td>
<td class="t-[^"]*">(\d+)<\/td>
.*?Category:[^>]*>(\d+)/m)

puts "Done"
puts result

