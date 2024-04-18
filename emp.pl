% Define employees and their attributes with ratings
employee(john, [hard_working-8, team_player-9, punctual-7, creative-8]).
employee(sarah, [team_player-7, punctual-8, analytical-9]).
employee(mike, [hard_working-7, punctual-8, creative-7]).

% Define criteria for evaluation
criteria(hard_working).
criteria(team_player).
criteria(punctual).
criteria(creative).
criteria(analytical).

% Define rules for evaluating employees
% Rule 1: Calculate overall score for an employee
calculate_overall_score(Employee, Score) :-
    employee(Employee, Attributes),
    calculate_score(Attributes, 0, Score).

calculate_score([], Score, Score).
calculate_score([Attribute-Rating|Rest], Acc, Score) :-
    Acc1 is Acc + Rating,
    calculate_score(Rest, Acc1, Score).

% Rule 2: Classify employees based on overall score
classify(Employee, excellent) :-
    calculate_overall_score(Employee, Score),
    Score >= 35. % Adjust this threshold based on your requirements

classify(Employee, good) :-
    calculate_overall_score(Employee, Score),
    Score >= 30,
    Score < 35.

classify(Employee, average) :-
    calculate_overall_score(Employee, Score),
    Score >= 25,
    Score < 30.

classify(Employee, poor) :-
    calculate_overall_score(Employee, Score),
    Score < 25.

% Example usage:
% classify(john, Result).

