function [obj]=faraday(sp)
% Keithley Instruments Inc. March 4, 2003 --> solo emite hasta 200V

% This program is generated using Intrument Creation Tool from
% Instrument Control Toolbox v2.2 Matlab 6.5 (R13)
% Set up for CEC GPIB card with Keithley Model 2400 source Meter
% If you have a different GPIB card, use the instrument creation tool
% to generate the first portion of the code.
% You can then copy Model 2400 Specific Functions into your mfile.
% or you may just try to change the GPIB maufacturer name in the GPIB
% object.


% Create the instrument object.
obj = gpib('ni', 0, sp);

%Set the property values.
set(obj, 'BoardIndex', 0);             %index number of GPIB ---> set(h(variable),property value(name),0(value))
%solamente configurar cuando este desconectado el equipo
set(obj, 'ByteOrder', 'littleEndian'); % byte order littleEndian (los primeros dos bytes de la primera memoria)
%bigEndian (los primeros dos bytes de la primera memoria.
set(obj, 'BytesAvailableFcn', '');
set(obj, 'BytesAvailableFcnCount', 48);
set(obj, 'BytesAvailableFcnMode', 'eosCharCode');
set(obj, 'CompareBits', 8);
set(obj, 'EOIMode', 'on');
set(obj, 'EOSCharCode', 'LF');
set(obj, 'EOSMode', 'read&write');
set(obj, 'ErrorFcn', '');
set(obj, 'InputBufferSize', 16000); %total number of bytes that can be stored in the input buffer(espacio de memoria) during a read operation. 
set(obj, 'Name', 'GPIB0-24');
set(obj, 'OutputBufferSize', 16000);
set(obj, 'OutputEmptyFcn', '');
set(obj, 'PrimaryAddress', sp);
set(obj, 'RecordDetail', 'compact');
set(obj, 'RecordMode', 'overwrite');
set(obj, 'RecordName', 'kei_2400_HEA.txt');
set(obj, 'SecondaryAddress', 0);
set(obj, 'Tag', '');
set(obj, 'Timeout', 10);
set(obj, 'TimerFcn', '');
set(obj, 'TimerPeriod', 1);
set(obj, 'UserData', []);

if nargout > 0 
    out = [obj]; 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VOLTAGE=67.5;
range_CURRENT=1.00;
MAX_CURRENT=1.05;

% Model 2400 Specific Functions
% Sweep voltage and measure back current
fopen(obj)
fprintf(obj,':*RST') 
fprintf(obj,':*ESE 0')
fprintf(obj,':*CLS')
fprintf(obj,':STAT:MEAS:ENAB 512')
fprintf(obj,':*SRE 1')
fprintf(obj,':TRAC:CLE')                          %clear the buffer
fprintf(obj,':SOUR:FUNC:MODE VOLT')     %select source funcion
fprintf(obj,':SOUR:VOLT:MODE FIXED')
fprintf(obj,':SENS:FUNC "CURR"')
fprintf(obj,':SOUR:VOLT %f', VOLTAGE) %VOLTAGE
fprintf(obj,':SENS:CURR:PROT %f',MAX_CURRENT) %CURRENT PROTECTION
fprintf(obj,':SENS:CURR:RANG %f',range_CURRENT) %CURRENT RANGE
fprintf(obj,':FORM:ELEM CURR') %ONLY READ CURRENT COMMAND
fprintf(obj,':OUTP ON') %TURN ON VOLTAGE BEFORE READING
fprintf(obj,':READ?') %READ CURRENT OF THE FARADAY CUP

fprintf(obj,':OUTP OFF') %TURN OFF THE VOLTAGE AFTER READING


end