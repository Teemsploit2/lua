string = "one,two,three"
for match in string.gmatch(str, '([^,]+)') do
    print(match)
end
