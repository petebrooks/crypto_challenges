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

encoded_string = '1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736'

def decode_xor(str)
	set = {}
	('A'..'z').each do |char|
		xor = str.scan(/./).map{ |e| (e.hex ^ char.hex).to_s(16) }.join
		set[xor] = freq_score(xor)
	end
	set.sort_by { |string, score| score }.first.first
end


def freq_score(str)
	freq = {'a' => 8.2,
					'b' => 1.5,
					'c' => 2.8,
					'd' => 4.3,
					'e' => 12.7,
					'f' => 2.2,
					'g' => 2.0,
					'h' => 6.1,
					'i' => 7.0,
					'j' => 0.2,
					'k' => 0.8,
					'l' => 4.0,
					'm' => 2.4,
					'n' => 6.7,
					'o' => 7.5,
					'p' => 1.9,
					'q' => 0.1,
					'r' => 6.0,
					's' => 6.3,
					't' => 9.1,
					'u' => 2.8,
					'v' => 1.0,
					'w' => 2.4,
					'x' => 0.2,
					'y' => 2.0,
					'z' => 0.1}
	arr = str.scan(/./).map { |e| e.downcase }
	english_score = arr.inject(0) { |score, char| score + (freq[char] || 0) }
	str_score = arr.inject(0) { |score, char| score + (arr.count(char) / arr.length.to_f) }
	(english_score - str_score).abs
end

# p freq_score(encoded_string)
 p decode_xor(encoded_string)

