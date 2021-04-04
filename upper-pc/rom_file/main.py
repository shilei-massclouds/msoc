#!/usr/bin/python3

import sys
import ftdi1 as ftdi

ctx = ftdi.new()

ret = ftdi.usb_open(ctx, 0x0403, 0x6014)
if ret:
    print('open: ' + ftdi.get_error_string(ctx))

#ret = ftdi.set_bitmode(ctx, 0xff, 0x01)
ret = ftdi.set_bitmode(ctx, 0xff, 0x40)
if ret:
    print(ftdi.get_error_string(ctx))

'''
ret = ftdi.usb_purge_rx_buffer(ctx)
if ret:
    print('usb_purge_rx_buffer: ' + ftdi.get_error_string(ctx))
'''

#ret = ftdi.write_data(ctx, bytes('1234', 'ascii'))
'''
ret = ftdi.write_data(ctx, bytes([50,51,52,53,54,55,56,57,255]))
if ret == 0:
    print('write: ' + ftdi.get_error_string(ctx))
'''

'''
ret = ftdi.usb_purge_buffers(ctx)
if ret:
    print('usb_purge_tx_buffer: ' + ftdi.get_error_string(ctx))
'''

rom_file = open('/home/cloud/gitLocal/msoc/data/head.bin', 'rb')
if rom_file is None:
    print('Open rom file failed')
    sys.exit(-1)

while (True):
    ret, buf = ftdi.read_data(ctx, 8)
    if ret == 0:
        #print('read: ' + ftdi.get_error_string(ctx))
        continue

    #print(buf[0:(ret-1)])
    addr = int.from_bytes(buf, 'little')
    print('addr: %x' % addr)

    rom_file.seek(addr)
    data = rom_file.read(8)
    for c in data:
        print('%x' % c)
    ret = ftdi.write_data(ctx, data)
    if ret == 0:
        print('write: ' + ftdi.get_error_string(ctx))

    '''
    print(buf)
    for c in buf:
        print('%d' % c)
    '''

'''
while (True):
    ret, pins = ftdi.read_pins(ctx)
    #print("read pins ret(%x)" % ret)
    if ret:
        exit(1)
    for c in pins:
        if c != 0xff:
            print(c)
'''

ret = ftdi.usb_close(ctx)
if ret:
    print(ftdi.get_error_string(ctx))

ftdi.free(ctx)
print('ok!')
