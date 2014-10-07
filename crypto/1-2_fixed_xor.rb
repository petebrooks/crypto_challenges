def convert_hex_to_base_64(h)
	[[h].pack('H*')].pack('m0')
end

a = '1c0111001f010100061a024b53535009181c'
b = '686974207468652062756c6c277320657965'
res = '746865206b696420646f6e277420706c6179'

def fixed_xor(a, b)
	hex_a = a.scan(/./).map(&:hex)
	hex_b = b.scan(/./).map(&:hex)
	hex_a.zip(hex_b).map { |e| (e[0] ^ e[1]).to_s(16) }.join
end


x = fixed_xor(a, b)
p x
p x == res