function [matrix_of_healthy_people,matrix_of_infected_people,number_of_died_people_although_vaccinated] = function_infected_remaining_day_for_healthy_infected_matrix(matrix_of_healthy_people,matrix_of_infected_people,heal_probability_after_M_iterations)
        
    number_of_died_people_although_vaccinated = 0;

    array = size(matrix_of_infected_people);
    number_of_infected_people = array(1);

    for i = 1:number_of_infected_people

        if matrix_of_infected_people(i,3) == 0
            randomization_for_healing_probability = rand;

            if(randomization_for_healing_probability <= heal_probability_after_M_iterations) %healed.

                before_infected = 1;
                is_vaccinated = matrix_of_infected_people(i,4);
                new_row = [matrix_of_infected_people(i,1),matrix_of_infected_people(i,2),before_infected,is_vaccinated];
                matrix_of_healthy_people = [matrix_of_healthy_people;new_row];
                matrix_of_infected_people(i,:) = [100 100 100 100]; %given randomly 100s.

            else %died.

                if matrix_of_infected_people(i,4) == 1
                    number_of_died_people_although_vaccinated = number_of_died_people_although_vaccinated +1;
                end

                matrix_of_infected_people(i,:) = [100 100 100 100]; %given randomly 100s.
            end
        end
    end
    
    rows_to_delete = ((matrix_of_infected_people(:,1) == 100) & (matrix_of_infected_people(:,2) == 100)) & (matrix_of_infected_people(:,3) == 100) & (matrix_of_infected_people(:,4) == 100);
    matrix_of_infected_people(rows_to_delete,:) = [];
    %deleting the rows which contains full of 100s.
end