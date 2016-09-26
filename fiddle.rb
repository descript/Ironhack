require 'digest'
require 'date'
require 'time'

version = "01000000"
prev_block_header = "000000000000000004477869f3f98fc34d71e7819743d9da0a3720f8a3cbd782"
merkle_root =  "cc3c6dfcd8b71a27e53e660805933ea28d5180855e50469aa67de46ac252243f"
time = DateTime.new(2016,9,22,10,58,58).to_time
time = time.to_i.to_s.hex.to_s
bits = "402972254".hex.to_s
nonce = "1719317725".hex.to_s

concat = version + prev_block_header + merkle_root + time + bits + nonce

iter_one =  Digest::SHA256.hexdigest(concat)
iter_two = Digest::SHA256.hexdigest(iter_one)
puts iter_two
