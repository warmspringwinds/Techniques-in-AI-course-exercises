function [ possible_next_step_words ] = word_ladder_possible_next_steps( dictionary, start_word )
    % Find all the possible next step words in word ladder game. Uses word
    % dictionary to find real words eligible for next step.
    % Input:
    % @dictionary - dictionary of eligible words
    % @start_words - word to start next step from
    % Output:
    % @possible_next_step_words - all possible next step words
    
    possible_next_step_words = {};
    regex_basic_match_pattern = '^%s$';
    any_letter_regex_symbol = '.';
    
    word_length = length(start_word);

    for i=1:word_length
        first_half = 1:(i-1);
        second_half = (i+1):word_length;
        regex_final = strcat(start_word(first_half), any_letter_regex_symbol, start_word(second_half));
        regex_final = sprintf(regex_basic_match_pattern, regex_final);
        matches = regexp(dictionary, regex_final, 'match');  % Extract the matches
        words = [matches{:}];
        possible_next_step_words = [possible_next_step_words, words];
    end
    
end

