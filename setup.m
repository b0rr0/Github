function [obj,clk,startTime]=setup (NPLC,compliance_I,source_delay,triger_delay,sp)
% Keithley Instruments Inc. March 4, 2003 --> solo emite hasta 200V

% This program is generated using Intrument Creation Tool from
% Instrument Control Toolbox v2.2 Matlab 6.5 (R13)
% Set up for CEC GPIB card with Keithley Model 2400 source Meter
% If you have a different GPIB card, use the instrument creation tool
% to generate the first portion of the code.
% You can then copy Model 2400 Specific Functions into your mfile.
% or you may just try to change the GPIB maufacturer name in the GPIB
% object.

clk=fix(clock)
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
set(obj, 'RecordName', 'kei_2400.txt');
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
PROTECTION_VOLTAGE=210;
start_voltage=-200;
end_voltage=200;
number_points=500;

% Model 2400 Specific Functions
% Sweep voltage and measure back current
fopen(obj)
fprintf(obj,':*RST')
% setup the 2400 to generate an SRQ on buffer full 
fprintf(obj,':*ESE 0')
fprintf(obj,':*CLS')
fprintf(obj,':STAT:MEAS:ENAB 512')
fprintf(obj,':*SRE 1')
% buffer set up
fprintf(obj,':TRAC:CLE')                          %clear the buffer
% Set up the Sweep
fprintf(obj,':SOUR:FUNC:MODE VOLT')     %select source funcion                %Lineal and logarithmic sweeps
fprintf(obj,':SOUR:VOLT:PROT:LEV %f', PROTECTION_VOLTAGE) %PROTECTION LEVEL
fprintf(obj,':SOUR:VOLT:STAR %f', start_voltage)  % start voltage
fprintf(obj,':SOUR:VOLT:STOP %f', end_voltage)    % stop voltage
volt_step = (end_voltage - start_voltage)/(number_points);
fprintf(obj,':SOUR:VOLT:STEP %f', volt_step)     % 
fprintf(obj,':SOUR:VOLT:MODE SWE')
fprintf(obj,':SOUR:CLE:AUTO OFF') 
fprintf(obj,':SOUR:SWE:SPAC LIN')                % Select sweep escala Linear
fprintf(obj,':SOUR:DEL:AUTO OFF')                %Disable auto delay 
fprintf(obj,':SOUR:DEL %f', source_delay)         % Set source delay  0 - 9999.9980 sec


fprintf(obj,':FORM:ELEM:SENS VOLT,CURR')

fprintf(obj,':TRIG:COUN %f', number_points)          %Number of point in sweep
fprintf(obj,':TRIG:DEL %f',triger_delay)                        %Set tiger delay
fprintf(obj,':SYST:AZER:STAT ON')                %Disable auto zero. When  auto zero is disabled , speed is increasing at the expense of accurancy
fprintf(obj,':SYST:TIME:RES:AUTO ON')             %This action is used to reset timestamp to 0 seconds
fprintf(obj,':TRAC:TST:FORM ABS')                 %Select timesta,mp format Name = ABSolute (reference to fist buffer reading
fprintf(obj,':TRAC:FEED:CONT NEXT')               %Enable/ disable buffer NEXT fill buffer and stop
fprintf(obj,':OUTP ON')
fprintf(obj,':INIT')
tic;
startTime=datestr(now,'HH:MM:SS')
end