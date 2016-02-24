#Using I2C device for HDC1000
fd = Gpio.i2cSetup(0x40);

if (ret = Gpio.i2cWrite(fd,0x02,0x0000)) < 0
	puts("write error 0x02\n")
end
usleep 500

if (ret = Gpio.i2cWrite(fd,0x01,0x00)) < 0
	puts"write errror 0x01"
end
usleep 6350

ret = Gpio.stdRead(fd, 2)
puts "humidity value : #{ret*100/65536.0}"
