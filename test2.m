
VOLTAGE=5;
range_CURRENT=1.00;
MAX_CURRENT=1.05;
Vmin = -500
Vmin = (Vmin/100)
Vmax = 500
Vmax = (Vmax/100)
time = 15
freq = (1/time)
cyc = 1


close all
clc
clearAllPorts

sp16 = 16;
obj16 = gpib('ni', 0, sp16);

% Create the instrument object for the signal generator.
sp10 = 10;
obj10 = gpib('ni', 0, sp10);

% Create the instrument object for the source meter.
sp21 = 21;
obj21 = gpib('ni', 0, sp21);

%Set the property values.
set(obj21, 'BoardIndex', 0); % index number of GPIB ---> 
                           % set((variable),(property value name),(value))
                           % solamente configurar cuando este desconectado 
                           % el equipo.
set(obj21, 'ByteOrder', 'littleEndian'); % Byte order littleEndian 
                                       % the device stores the first byte 
                                       % in the first memory address.
set(obj21, 'BytesAvailableFcn', ''); % Specify the callback function to 
                                   % execute when a specified
                                   % number of bytes is available in the 
                                   % input buffer, or a terminator is read.
set(obj21, 'BytesAvailableFcnCount', 48); % Specify the number of bytes that 
                                        % must be available in the input 
                                        % buffer to generate a 
                                        % bytes-available event.
set(obj21, 'BytesAvailableFcnMode', 'eosCharCode'); % Specify if the 
                                                  % bytes-available event 
                                                  % is generated after
                                                  % a specified number of 
                                                  % bytes is available in 
                                                  % the input buffer, or 
                                                  % after a terminator is 
                                                  % read. EOSCharCode 
                                                  % replaces \n wherever 
                                                  % it appears in the ASCII 
                                                  % command sent to the 
                                                  % instrument.
set(obj21, 'CompareBits', 8); % Specify number of bits that must match EOS 
                            % character to complete read operation, or to 
                            % assert EOI line.
set(obj21, 'EOIMode', 'on'); % EOSMode specifies when the EOS character is 
                           % used.
set(obj21, 'EOSCharCode', 'LF'); % The default value is LF, which corresponds 
                               % to a line feed.
set(obj21, 'EOSMode', 'read&write'); % EOSMode is read or read&write (reading
                                   % is enabled), then the read operation 
                                   % might terminate when the EOSCharCode 
                                   % value is detected.
set(obj21, 'ErrorFcn', ''); % Specify the callback function to execute when 
                          % an error event occurs.
set(obj21, 'InputBufferSize', 16000); % total number of bytes that can be 
                                    % stored in the input buffer during a 
                                    % read operation. 
set(obj21, 'Name', 'GPIB0-24');
set(obj21, 'OutputBufferSize', 16000); % Size of the output buffer in bytes.
set(obj21, 'OutputEmptyFcn', ''); % Specify the callback function to execute 
                                % when the output buffer is empty.
set(obj21, 'PrimaryAddress', sp21); % Specify primary address of GPIB 
                                % instrument.
set(obj21, 'RecordDetail', 'compact'); % Specify the amount of information 
                                     % saved to a record file. Compact 
                                     % stands for the number of values 
                                     % written to the device, the number of
                                     % values read from the device, the 
                                     % data type of the values, and event 
                                     % information are saved to the record 
                                     % file.
set(obj21, 'RecordMode', 'overwrite'); % Specify whether data and event 
                                     % information are saved to one record 
                                     % file or to multiple record files. 
                                     % The overwrite stands for record file 
                                     % is overwritten.
set(obj21, 'RecordName', 'kei_2400_HEA.txt');
set(obj21, 'SecondaryAddress', 0); % Specify secondary address of GPIB 
                                 % instrument.
set(obj21, 'Tag', ''); % Label to associate with a serial port object.
set(obj21, 'Timeout', 10); % Waiting time to complete a read or write 
                         % operation.
set(obj21, 'TimerFcn', ''); % Specify the callback function to execute when 
                          % a predefined period of time passes.
set(obj21, 'TimerPeriod', 1); % Period of time between timer events.
set(obj21, 'UserData', []); % Data you want to associate with a serial port 
                          % object.

if nargout > 0 
    out = [obj21]; 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(obj16, 'BoardIndex', 0); 
set(obj16, 'ByteOrder', 'littleEndian'); 
set(obj16, 'BytesAvailableFcn', '');
set(obj16, 'BytesAvailableFcnCount', 48);
set(obj16, 'BytesAvailableFcnMode', 'eosCharCode');
set(obj16, 'CompareBits', 8);
set(obj16, 'EOIMode', 'on');
set(obj16, 'EOSCharCode', 'LF');
set(obj16, 'EOSMode', 'read&write');
set(obj16, 'ErrorFcn', '');
set(obj16, 'InputBufferSize', 16000); 
set(obj16, 'Name', 'GPIB0-21');
set(obj16, 'OutputBufferSize', 16000);
set(obj16, 'OutputEmptyFcn', '');
set(obj16, 'PrimaryAddress', sp16);
set(obj16, 'RecordDetail', 'compact');
set(obj16, 'RecordMode', 'overwrite');
set(obj16, 'RecordName', 'kei_2400_HEA.txt');
set(obj16, 'SecondaryAddress', 0);
set(obj16, 'Tag', '');
set(obj16, 'Timeout', 10);
set(obj16, 'TimerFcn', '');
set(obj16, 'TimerPeriod', 1);
set(obj16, 'UserData', []);

if nargout > 0 
    out = [obj16]; 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
set(obj10, 'BoardIndex', 0); 
set(obj10, 'ByteOrder', 'littleEndian'); 
set(obj10, 'BytesAvailableFcn', '');
set(obj10, 'BytesAvailableFcnCount', 48);
set(obj10, 'BytesAvailableFcnMode', 'eosCharCode');
set(obj10, 'CompareBits', 8);
set(obj10, 'EOIMode', 'on');
set(obj10, 'EOSCharCode', 'LF');
set(obj10, 'EOSMode', 'read&write');
set(obj10, 'ErrorFcn', '');
set(obj10, 'InputBufferSize', 16000); 
set(obj10, 'Name', 'GPIB0-21');
set(obj10, 'OutputBufferSize', 16000);
set(obj10, 'OutputEmptyFcn', '');
set(obj10, 'PrimaryAddress', sp10);
set(obj10, 'RecordDetail', 'compact');
set(obj10, 'RecordMode', 'overwrite');
set(obj10, 'RecordName', 'kei_2400_HEA.txt');
set(obj10, 'SecondaryAddress', 0);
set(obj10, 'Tag', '');
set(obj10, 'Timeout', 10);
set(obj10, 'TimerFcn', '');
set(obj10, 'TimerPeriod', 1);
set(obj10, 'UserData', []);

if nargout > 0 
    out = [obj10]; 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fopen(obj10) % Opens the object created for the signal generator
fprintf(obj10,':*RST') % Resets all the parameters from the signal generator
                      % to factory settings.
fprintf(obj10,':*ESE 0') % Sets the standard event register to display any
                        % error during operation.
fprintf(obj10,':*CLS') % Clears all the bits in the standard even register.

%fprintf(obj,'BURS:STAT OFF')

fprintf(obj10,':FUNC RAMP') % Set the function of the signal to be sent to
                          % to the BOP.

fprintf(obj10,':FUNC:RAMP:SYMM 100') % Set the slope value.

fprintf(obj10,':OUTP:LOAD 50') % Set the load impedance in Ohms.

fprintf(obj10,':FREQ %f',freq) % Set the frequency.

fprintf(obj10,'VOLT:LOW %f',Vmin) % Set the lowest value the voltage will
                                % reach. Low level = -5 V

fprintf(obj10,'VOLT:HIGH %f',Vmax) % Set the highest value the voltage will
                                 % reach. High level = 5 V

fprintf(obj10,'BURS:MODE TRIG') % 

%fprintf(obj,'BURS:NCYC %f',cyc)

%fprintf(obj,'BURS:INT:PER %f',time)

fprintf(obj10,'BURS:PHAS -180') % To set the starting point for the sweep 
                               % simulation 

fprintf(obj10,'TRIG:SOUR IMM') % Set to automatically start the trigger when
                              % when the sweep is initiated.

fprintf(obj10,'BURS:STAT ON') % Set to start the burst mode.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fopen(obj21) % Opens the object created for the source meter 
fprintf(obj21,':*RST') % Resets all the parameters from the source meter to
                     % factory settings.
fprintf(obj21,':*ESE 0') % Sets the standard event register to display any
                       % error during operation.
fprintf(obj21,':*CLS') % Clears all the bits in the standard even register.
fprintf(obj21,':STAT:MEAS:ENAB 512') % Enables measurements event register
                                   % with full buffer.
fprintf(obj21,':*SRE 1') % Programs the Service Request Enable Register.
fprintf(obj21,':TRAC:CLE')  % Clear readings from buffer.
fprintf(obj21,':TRAC:FEED SENS') % Store raw readings in buffer.
fprintf(obj21,':TRAC:POIN 350') % Store 350 readings in buffer.
fprintf(obj21,':TRAC:FEED:CONT NEXT') % Enable buffer.
fprintf(obj21,':TRIG:COUN 350') % Trigger count is 350.
fprintf(obj21,':SOUR:FUNC:MODE VOLT') % select source funcion
fprintf(obj21,':SOUR:VOLT:MODE FIXED') % Fixed voltage source mode.
fprintf(obj21,':SENS:FUNC "CURR"') % Current measure function.
fprintf(obj21,':SOUR:VOLT %f', VOLTAGE) % Output voltage selected above.
fprintf(obj21,':SENS:CURR:PROT %f',MAX_CURRENT) % 1.05A current compliance.
fprintf(obj21,':SENS:CURR:RANG %f',range_CURRENT) % Set 1A Current Measure
                                                % Range.
fprintf(obj21,':FORM:ELEM CURR') % Current reading only.
fprintf(obj21,':OUTP ON') % Output on before measuring current.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fopen(obj16) % Opens the object created for the multimeter 
fprintf(obj16,':*RST') % Resets all the parameters from the source meter to
                     % factory settings.
fprintf(obj16,':*ESE 0') % Sets the standard event register to display any
                       % error during operation.
fprintf(obj16,':*CLS') % Clears all the bits in the standard even register.
fprintf(obj16,':STAT:MEAS:ENAB 512') % Enables measurements event register
                                  % with full buffer.
fprintf(obj16,':*SRE 1') % Programs the Service Request Enable Register.
fprintf(obj16,':TRAC:CLE')  % Clear readings from buffer.
fprintf(obj16,':TRAC:FEED SENS') % Store raw readings in buffer.
fprintf(obj16,':TRAC:POIN 350') % Store 350 readings in buffer.
fprintf(obj16,':TRAC:FEED:CONT NEXT') % Enable buffer.
fprintf(obj16,':TRIG:COUN 350') % Trigger count is 350.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

corriente = 0;
voltaje = 0;
fprintf(obj16,':INIT') % Output on before measuring current.
fprintf(obj21,':INIT') % Initiate the current readings.
fprintf(obj10,'OUTP ON') % Output on sent to the BOP.

n=0;
tic
for i=1:1100000
   n=n+i
end
toc
 fprintf(obj10,'OUTP OFF') % Output off sent to the BOP.
 
 fprintf(obj21,':TRAC:DATA?') % Access previously stored buffer readings.
% corriente = scanstr(obj,',','%f')
corriente = scanstr(obj21) % To display the current readings.

fprintf(obj16,':TRAC:DATA?') % Access previously stored buffer readings.

voltaje = scanstr(obj16) % To display the voltage readings.


% save('Measures.mat','corriente')
% 
% 
% filename = 'Measure-Table.mat';
% f=fopen(filename,'a+');
% 
% fprintf(f,'%s \n','Current');
% i=1;
% 
% while (i<=Num_Point)
% fprintf(f,'%f \n',corriente(i));
% 
% i=i+1;
% end
% fclose(f);