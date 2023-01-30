function [matrix_of_infected_people,matrix_of_healthy_people] = function_matrix_of_infected_healthy_people_after_encountering(matrix_of_encounters,infection_probability,isolation_probability,infection_duration,matrix_of_infected_people,matrix_of_healthy_people)

    array = size(matrix_of_encounters);
    number_of_rows = array(1);

    array = size(matrix_of_healthy_people);
    number_of_healthy_people = array(1);

    for i = 1:number_of_rows
        control = 0;
         
        for j = 1:number_of_healthy_people

            if (matrix_of_healthy_people(j,1) == matrix_of_encounters(i,1)) && (matrix_of_healthy_people(j,2) == matrix_of_encounters(i,2)) && control == 0 %do they have same coords?
            
                if matrix_of_healthy_people(j,3) == 0  %is it before infected?
                    
                    randomization_for_infection_probability = rand;
                    if(randomization_for_infection_probability <= infection_probability)
                        matrix_of_healthy_people(j,:) = [100, 100, 100];
                        control = 1;

                        randomization_for_isolation_probability = rand;
                        if(randomization_for_isolation_probability <= isolation_probability)
                            is_isolated = 1;
                            the_days_left = infection_duration;
                            new_row = [matrix_of_encounters(i,1),matrix_of_encounters(i,2),the_days_left,is_isolated];
                            matrix_of_infected_people = [matrix_of_infected_people;new_row];
                        else
                            is_isolated = 0;
                            the_days_left = infection_duration;
                            new_row = [matrix_of_encounters(i,1),matrix_of_encounters(i,2),the_days_left,is_isolated];
                            matrix_of_infected_people = [matrix_of_infected_people;new_row];
                        end
                    end
                end
            end
        end
    end

    rows_to_delete = ((matrix_of_healthy_people(:,1) == 100) & (matrix_of_healthy_people(:,2) == 100)) & (matrix_of_healthy_people(:,3) == 100);
    matrix_of_healthy_people(rows_to_delete,:) = [];
    %deleting the rows which contains full of 100s.
end
