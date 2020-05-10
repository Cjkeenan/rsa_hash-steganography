% Python Code
% def e3pEC():
%     print("\nExercise 3, Extra Credit")
%     e = 13
%     n = 2881
%     d = generatePrivate(e,n)
%     text = "To be, or not to be- that is the question: Whether 'tis nobler in the mind to suffer The slings and arrows of outrageous fortune Or to take arms against a sea of troubles, And by opposing end them. To die- to sleep- No more; and by a sleep to say we end The heartache, and the thousand natural shocks That flesh is heir to. 'Tis a consummation Devoutly to be wish'd. To die- to sleep. To sleep- perchance to dream: ay, there's the rub!"
%     textEncoded = list(text.encode())
% 
%     textEncrypted = []
%     for i in range(0,len(textEncoded)):
%         textEncrypted.append(encryptRSA(textEncoded[i],e,n))
% 
%     textDecrypted = []
%     for i in range(0,len(textEncrypted)):
%         textDecrypted.append(decryptRSA(textEncrypted[i],d,n))
% 
%     textDecryptedPT = bytes(textDecrypted).decode()
%     print("Original Text: {0}" .format(text))
%     print("Encoded Text: {0}" .format(textEncoded))
%     print("Encrypted Encoded Text: {0}" .format(textEncrypted))
%     print("Decrypted Encoded Text: {0}" .format(textDecrypted))
%     print("Decrypted Decoded Text: {0}" .format(textDecryptedPT))

clear; close all;
%image to be read
I = imread('image.jpg');
% % N = 259
% p = 7;
% q = 37;
p = 215417;
q = 124513;
bits = 64;
[e,d,n] = generateRSAkeys(p,q,bits);
% text = "hello";
text = "To be, or not to be- that is the question: Whether 'tis nobler in the mind to suffer The slings and arrows of outrageous fortune Or to take arms against a sea of troubles, And by opposing end them. To die- to sleep- No more; and by a sleep to say we end The heartache, and the thousand natural shocks That flesh is heir to. 'Tis a consummation Devoutly to be wish'd. To die- to sleep. To sleep- perchance to dream: ay, there's the rub!";
textEncoded = double(char(text));
textEncrypted = encryptRSA(textEncoded,e,n);
%convert to uint64 to save char space
textEncryptedL = uint64(textEncrypted);
[a,b] = size(textEncryptedL);
%null string to store everything
totalStr = ""; 
for i = 1:1:b
    totalStr =strcat(totalStr,num2str(textEncrypted(i))," ");
end
sM = char(totalStr);
[Ix, sizeX] = Picencode(I,sM);
textEncChar = Picdecode(Ix,sizeX);
textEncStr = convertCharsToStrings(textEncChar);
textEncSplit = split(textEncStr);
[c,e] = size(textEncSplit);
textEnc = str2double(textEncSplit);
textEnc(436) = [];
textEnc = textEnc.';
textDecrypted = decryptRSA(textEnc,d,n);
textDecoded = string(char(textDecrypted));