# -*- coding: utf-8 -*-

require 'ffi'

module POSIX
  extend FFI::Library
  ffi_lib 'c'

  attach_function :sysctl, [ :pointer, :uint, :pointer, :pointer, :pointer, :pointer, :size_t ], :int
  attach_function :sysctlnametomib, [:string, :pointer, :pointer], :int
  attach_function :sysctlbyname, [:pointer, :pointer, :pointer, :pointer, :size_t ], :int
end


mib = ::FFI::MemoryPointer.from_string("machdep.cpu.brand_string")
buf = 0.chr * 128
size_ptr = ::FFI::MemoryPointer.new :pointer
size_ptr.write_array_of_int([buf.size])

POSIX.sysctlbyname(mib, buf, size_ptr, nil, 0)

puts buf
