% cerner_2^5_2018
% This is a simple language parser.
% You can run this code here: https://swish.swi-prolog.org/
% input : sentence([cat,ki,dog,antey,istam],X).
% Output: X=[] valid sentence in your language.
% 		  false not valid sentence in your language.

% My Language grammer.
sentence --> noun_phrase, verb_phrase.
noun_phrase --> noun, adverb. 
verb_phrase --> noun_phrase, verb.
verb_phrase --> verb, sentence.

% List words for the terminals in your grammer.
adverb --> [ki].
adverb --> [antey].
noun --> [cat].
noun --> [dog].
verb --> [istam].