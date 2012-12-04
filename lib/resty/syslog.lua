local ffi = require 'ffi'
local bit = require 'bit'
local C          = ffi.C
local bit_lshift = bit.lshift

ffi.cdef[[
void openlog(const char *ident, int option, int facility);
void syslog(int priority, const char *format, ...);
void closelog(void);
]]

-- option
local LOG_PID	 = 0x01	
local LOG_CONS	 = 0x02	
local LOG_ODELAY = 0x04	
local LOG_NDELAY = 0x08	
local LOG_NOWAIT = 0x10	
local LOG_PERROR = 0x20	

-- facility
local LOG_KERN	   = bit_lshift(0,  3)
local LOG_USER	   = bit_lshift(1,  3)
local LOG_MAIL	   = bit_lshift(2,  3)
local LOG_DAEMON   = bit_lshift(3,  3)
local LOG_AUTH     = bit_lshift(4,  3)
local LOG_SYSLOG   = bit_lshift(5,  3)
local LOG_LPR	   = bit_lshift(6,  3)
local LOG_NEWS     = bit_lshift(7,  3)
local LOG_UUCP     = bit_lshift(8,  3)
local LOG_CRON     = bit_lshift(9,  3)
local LOG_AUTHPRIV = bit_lshift(10, 3)

-- priorities
local LOG_EMERG   = 0       
local LOG_ALERT   = 1       
local LOG_CRIT    = 2       
local LOG_ERR     = 3       
local LOG_WARNING = 4       
local LOG_NOTICE  = 5       
local LOG_INFO    = 6       
local LOG_DEBUG   = 7

function openlog(ident, option, facility)
    C.openlog(ident, option, facility)
end

function syslog(level, format, ...)
    C.syslog(level, format, ...)
end

function closelog()
    C.closelog()
end
