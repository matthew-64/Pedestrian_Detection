function [test_dataset] = import_test_dataset()
%% Setup the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 58);

% Specify range and delimiter
opts.DataLines = [3, Inf];
opts.Delimiter = "  ";

% Specify column names and types
opts.VariableNames = ["ImageDataset", "VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29", "VarName30", "VarName31", "VarName32", "VarName33", "VarName34", "VarName35", "VarName36", "VarName37", "VarName38", "VarName39", "VarName40", "VarName41", "VarName42", "VarName43", "VarName44", "VarName45", "VarName46", "VarName47", "VarName48", "VarName49", "VarName50", "VarName51", "VarName52", "VarName53", "VarName54", "VarName55", "VarName56", "VarName57", "VarName58"];
opts.VariableTypes = ["string", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, "ImageDataset", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "ImageDataset", "EmptyFieldRule", "auto");
opts = setvaropts(opts, ["VarName6", "VarName10", "VarName14", "VarName18", "VarName22", "VarName26", "VarName30", "VarName34", "VarName38", "VarName42", "VarName46", "VarName50", "VarName54", "VarName58"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["VarName6", "VarName10", "VarName14", "VarName18", "VarName22", "VarName26", "VarName30", "VarName34", "VarName38", "VarName42", "VarName46", "VarName50", "VarName54", "VarName58"], "ThousandsSeparator", ",");

% Import the data
test_dataset = readtable("test.dataset", opts);


%% Clear temporary variables
clear opts
end