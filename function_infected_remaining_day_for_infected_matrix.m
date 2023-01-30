function matrix_of_infected_people = function_infected_remaining_day_for_infected_matrix(matrix_of_infected_people,heal_probability_after_M_iterations)
     
    array = size(matrix_of_infected_people);
    number_of_infected_people = array(1);
    
    for i = 1:number_of_infected_people

        if matrix_of_infected_people(i,3) == 0
            randomization_for_healing_probability = rand;

            if(randomization_for_healing_probability > heal_probability_after_M_iterations) %died.

                matrix_of_infected_people(i,:) = [];
            end
        end
    end
end

    

            
