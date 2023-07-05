# GenerateBarcodes
This code generates unique barcodes consisting of n-letter sequences using a set of possible letters for substitution. The generated barcodes are saved to a text file with column counting.

Prerequisites

Before running the code, ensure that you have the following:
MATLAB installed on your system.
Access to the MATLAB command window.

Instructions

Open MATLAB and create a new script file.
Copy and paste the provided code into the script file.
Save the script file with a .m extension.
Run the script in MATLAB.

Code Explanation

The initial lines (clc;, clear all;, close all;) clear the command window and workspace.
The code defines a cell array cellArray to store the generated barcodes and a list of possible letters for substitution (letters).
The variable LenBar is set to 8, indicating the desired length of each barcode.
The variables desiredUniqueCount, uniqueCount, and iteration are initialized. desiredUniqueCount represents the desired number of unique sequences, uniqueCount keeps track of the current count of unique sequences, and iteration counts the number of iterations performed. A while loop is executed until the desired number of unique sequences is reached and there are no duplicated sequences. Inside the loop, the cell array is filled with randomly generated 8-letter sequences. Each sequence is generated by appending random letters from the letters list while ensuring that no more than two consecutive similar letters exist in the sequence.
The generated sequence is checked for more than two consecutive similar letters. If found, the sequence is regenerated until the condition is met. The cell array is then converted to a string array, and duplicated sequences are identified using the unique function. The modified cell array is saved to a text file with column counting. The filename includes the current date. Finally, the number of unique sequences is displayed in the command window, along with a message indicating the successful saving of the sequences to a file. The total number of iterations performed is also displayed.

Output

The number of unique sequences generated. A confirmation message indicating that the sequences with column counting have been saved to a text file named "Barcodes_YYYY-MM-DD.txt", where "YYYY-MM-DD" represents the current date. The number of iterations performed during the generation process.
Please note that the actual output will be displayed in the MATLAB command window.

License

This code is provided under the MIT License. Feel free to modify and use it according to your needs.

Author

This code was written by Davide Ciccarese and is based on an original implementation.
