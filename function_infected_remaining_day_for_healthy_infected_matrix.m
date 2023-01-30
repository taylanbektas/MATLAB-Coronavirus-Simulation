function [matrix_of_healthy_people,matrix_of_infected_people,died_although_vaccinated_iteration] = function_infected_remaining_day_for_healthy_infected_matrix(matrix_of_healthy_people,matrix_of_infected_people,heal_probability_after_M_iterations)
        
    array = size(matrix_of_infected_people);
    number_of_infected_people = array(1);

    died_although_vaccinated_iteration = 0;

    for i = 1:number_of_infected_people

        if matrix_of_infected_people(i,3) == 0
            randomization_for_healing_probability = rand;

            if(randomization_for_healing_probability <= heal_probability_after_M_iterations) %healed.

                is_vaccinated = matrix_of_infected_people(i,4);
                if(is_vaccinated == 1)
                    is_infected_after_vaccine = 1;
                    is_infected_before_vaccine = 0;
                else
                    is_infected_before_vaccine = 1;
                    is_infected_after_vaccine = 0;
                end
                infection_probability = 0;
                the_day_after_vaccine = 2000;
                new_row = [matrix_of_infected_people(i,1),matrix_of_infected_people(i,2),is_infected_before_vaccine,is_vaccinated,infection_probability,the_day_after_vaccine,is_infected_after_vaccine];
                matrix_of_healthy_people = [matrix_of_healthy_people;new_row];
                matrix_of_infected_people(i,:) = [100 100 100 100 100]; %given randomly 100s.

            else %died.
                if(matrix_of_infected_people(i,4) == 1)
                    died_although_vaccinated_iteration = died_although_vaccinated_iteration  +1;
                end
                matrix_of_infected_people(i,:) = [100 100 100 100 100]; %given randomly 100s.
                
                
            end
        end
    end

    
    rows_to_delete = ((matrix_of_infected_people(:,1) == 100) & (matrix_of_infected_people(:,2) == 100)) & (matrix_of_infected_people(:,3) == 100) & (matrix_of_infected_people(:,4) == 100) & (matrix_of_infected_people(:,5) == 100);
    matrix_of_infected_people(rows_to_delete,:) = [];
    %deleting the rows which contains full of 100s.
end