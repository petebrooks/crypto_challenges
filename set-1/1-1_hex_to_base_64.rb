def convert_hex_to_base_64(h)
	[[s].pack('H*')].pack('m0')
end

hex = '49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d'
str = convert_hex(hex)
puts str