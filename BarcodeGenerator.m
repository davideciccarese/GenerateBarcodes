
% Davide Ciccarese
% Date of creatinon: 5/07/2022
% Last Modification: 

cd '/PathToFolder/'

% The while loop continues generating sequences until the desired number of
% unique sequences is reached and there are no duplicated sequences. Within
% the for loop that generates each sequence, an additional condition is
% added to check that the current random letter is not the same as the last
% four letters of the sequence when the sequence length is less than four.
% This ensures that there are no more than four consecutive similar letters
% in each sequence.

% The code checks for consecutive identical letters by using the diff
% function on the generated sequence. If there is any difference of 0 in
% consecutive letters, it means there are consecutive identical letters,
% and the sequence is regenerated until the condition is met.


%%

clc;
clear all;
close all;

% Cell array containing 8-letter cells
cellArray = {};

% Possible letters for substitution
letters = {'A', 'C', 'G', 'T'};

%Lenght of Barcode
LenBar = 8;

% Initialize variables
desiredUniqueCount = 192; % Desired number of unique sequences
uniqueCount = 0; % Current count of unique sequences
iteration = 0; % Iteration counter

% Loop until the desired number of unique sequences is reached and there are no duplicated sequences
while uniqueCount < desiredUniqueCount || ~isempty(duplicatedSeq)
    iteration = iteration + 1;
    
    % Fill the cell array with randomly generated 8-letter sequences
    for i = 1:desiredUniqueCount
        % Generate a random 8-letter sequence with no more than 2 consecutive similar letters
        newValue = '';
        while numel(newValue) < LenBar
            randomLetter = letters{randi(4)};
            if numel(newValue) < 2 || ~strcmp(randomLetter, newValue(end-1:end))
                newValue = [newValue, randomLetter];
            end
        end
        
        % Check if the generated sequence has more than 2 consecutive similar letters
        hasMoreThanTwoConsecutive = any(diff(newValue) == 0, 2);
        
        % If the sequence has more than 2 consecutive similar letters, regenerate it
        while hasMoreThanTwoConsecutive
            newValue = '';
            while numel(newValue) < LenBar
                randomLetter = letters{randi(4)};
                if numel(newValue) < 2 || ~strcmp(randomLetter, newValue(end-1:end))
                    newValue = [newValue, randomLetter];
                end
            end
            hasMoreThanTwoConsecutive = any(diff(newValue) == 0, 2);
        end
        
        % Update the cell array with the new value
        cellArray{i} = newValue;
    end
    
    % Convert the modified cell array to a string array
    stringArray = string(cellArray);
    
    % Find duplicated sequences
    [~, uniqueIdx, duplicateIdx] = unique(stringArray);
    duplicateIdx(uniqueIdx) = [];
    duplicatedSeq = stringArray(duplicateIdx);
    
    % Count the unique sequences
    uniqueCount = numel(unique(stringArray));
end

% Generate the filename with the date
fileDate = datestr(now, 'yyyy-mm-dd');
fileName = ['Barcodes_', fileDate, '.txt'];

% Save the cellArray with column counting to a text file
fileID = fopen(fileName, 'w');
for i = 1:numel(cellArray)
    fprintf(fileID, '%d\t%s\n', i, cellArray{i});
end
fclose(fileID);


% Display the number of unique sequences
disp('Number of unique sequences:');
disp(uniqueCount);
disp('Sequences with column counting saved to "sequences.txt" file.');
disp(['Iterations: ', num2str(iteration)]);
