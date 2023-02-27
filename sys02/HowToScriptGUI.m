% How to Use the GUI with a Script
%================Do Not Edit===============================================
% Launch the GUI, which is a singleton
blackBox

% Find handle to hidden figure
temp = get(0,'showHiddenHandles');
set(0,'showHiddenHandles','on');
hfig = gcf;
% Get the handles structure
handles = guidata(hfig);
save("handles");

%================Start Editing=============================================

endTime = '10';

% This will let you pick the Field radio button
set(handles.radioField, 'Value', 1);
% This changes the equation in the Field textbox
% set(handles.input, 'String', '10 + t^2' );
% blackBox('input_Callback',handles.input,[],handles);


% This will let you pick the File radio button
% set(handles.radioFile, 'Value', 1);
% This changes the input file name textbox
set(handles.inputFile, 'String', 'input_file_name' );


% This changes the start time
set(handles.axisStart, 'String', '0');
% This changes the end time
set(handles.axisEnd, 'String', endTime);
% This changes the step size
set(handles.stepSize, 'String', '0.01');
% This changes the refine output
set(handles.refineOutput, 'String', '1');


% This changes the save file name
% set(handles.saveFile, 'String', 'saving_file_name' );
% Use the save button
% blackBox('save_Callback',handles.save,[],handles);
% Use the clear button
% blackBox('clear_Callback',handles.save,[],handles);
% Use the run button
% blackBox('run_Callback',handles.run,[],handles);



% You need to use a string for the equation you want
% name = '10 + t^2';
% Or if you have a variable you can use sprintf which is like the
% printf function in c programming
var_x = linspace(power(10, -4), power(10, 4), 50);

resultTable = zeros([length(var_x), 6]);

for i = 1:length(var_x)
    k = var_x(1,i);
    name = sprintf('sin(%f*t)', k);
    set(handles.input, 'String', name);
    set(handles.refineOutput, 'String', '1');
    set(handles.axisEnd, 'String', string(1/k));
    set(handles.stepSize, 'String', string(0.001*1/k));
    set(handles.saveFile, 'String', 'timeDomain ' + string(k));

    blackBox('input_Callback',handles.input,[],handles);
    blackBox('run_Callback',handles.run,[],handles);
%     blackBox('save_Callback',handles.save,[],handles);
end


% When you go to run the GUI, there is still a bug in the program.
% If you change the equation in the Field textbox, when you Run the GUI
% right afterwards, it runs the old equation. The next Run will use the new
% equation and any subsequent run there after.
% once 
% set(handles.axisEnd, 'String', '1');
% blackBox('run_Callback',handles.run,[],handles);
% set(handles.axisEnd, 'String', endTime);
% blackBox('run_Callback',handles.run,[],handles);

%=======================Do Not Edit========================================
set(0,'showHiddenHandles',temp);