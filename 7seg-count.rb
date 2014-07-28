def seg_no(n)
	case n
	when 0
		return [0,0,0,0,0,0,1]
	when 1
		return [1,0,0,1,1,1,1]
	when 2
		return [0,0,1,0,0,1,0]
	when 3
		return [0,0,0,0,1,1,0]
	when 4
		return [1,0,0,1,1,0,0]
	when 5
		return [0,1,0,0,1,0,0]
	when 6
		return [0,1,0,0,0,0,0]
	when 7
		return [0,0,0,1,1,1,1]
	when 8
		return [0,0,0,0,0,0,0]
	when 9
		return [0,0,0,0,1,0,0]
	else
		return [0,1,1,0,0,0,0]
	end
	return seg
end

def set_seg(pin)
	case pin
	when 0
		return 1
	when 1
		return 2
	when 2
		return 4
	when 3
		return 6
	when 4
		return 0
	when 5
		return 3
	when 6
		return 5
	end
	return seg
end

def dwseg(seg,digits)
	pin=0
	seg.each do |var|
		Gpio.digitalWrite set_seg(pin) , var
		p "output #{var} for #{pin} #{set_seg(pin)}"
		pin+=1
	end
end

def setup_pin
	7.times do |pin|
		Gpio.pinMode pin, Gpio::OUTPUT
	end
end

setup_pin
delay = 1000000
setup_pin
10.times do |i|
	p i
	dwseg(seg_no(i),1)
	usleep delay
end
