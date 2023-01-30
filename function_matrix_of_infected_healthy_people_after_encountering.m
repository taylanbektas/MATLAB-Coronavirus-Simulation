function [matrix_of_infected_people,matrix_of_healthy_people,number_of_infected_people_although_vaccinated_iteration] = function_matrix_of_infected_healthy_people_after_encountering(matrix_of_encounters,infection_probability,infection_probability_healthy_vaccinated,infection_duration,matrix_of_infected_people,matrix_of_healthy_people)

    array = size(matrix_of_encounters);
    number_of_rows = array(1);

    array = size(matrix_of_healthy_people);
    number_of_healthy_people = array(1);

    number_of_infected_people_although_vaccinated_iteration = 0;

    for i = 1:number_of_rows
        control = 0;
         
        for j = 1:number_of_healthy_people
            
            if (matrix_of_healthy_people(j,1) == matrix_of_encounters(i,1)) && (matrix_of_healthy_people(j,2) == matrix_of_encounters(i,2)) && control == 0 %do they have same coords?
            
                if matrix_of_healthy_people(j,3) == 0  %is it before infected?
                    
                    if matrix_of_healthy_people (j,4) == 1 %is it before vaccinated?

                        randomization_for_infection_after_vaccination_probability = rand; %is it 
                        
                        if(randomization_for_infection_after_vaccination_probability <= infection_probability_healthy_vaccinated )
             
                                if matrix_of_healthy_people(j,4) == 1
                                    number_of_infected_people_although_vaccinated_iteration = number_of_infected_people_although_vaccinated_iteration+1;
                                end
                                
                                duration = infection_duration;
                                is_vaccinated = matrix_of_healthy_people(j,4);
                                new_row = [matrix_of_encounters(i,1),matrix_of_encounters(i,2),duration,is_vaccinated];
                                matrix_of_infected_people = [matrix_of_infected_people;new_row];

                                matrix_of_healthy_people(j,:) = [100,100,100,100]; %100 given randomly to determine %out_of_healthy_matrix
                                control = 1;
                     
                        end
                    else
                        randomization_for_infection_probability = rand;
                        if(randomization_for_infection_probability <= infection_probability)

                            if matrix_of_healthy_people(j,4) == 1
                                number_of_infected_people_although_vaccinated_iteration = number_of_infected_people_although_vaccinated_iteration+1;
                            end

                            
                            duration = infection_duration;
                            is_vaccinated = matrix_of_healthy_people(j,4);
                            new_row = [matrix_of_encounters(i,1),matrix_of_encounters(i,2),duration,is_vaccinated];
                            matrix_of_infected_people = [matrix_of_infected_people;new_row];

                            matrix_of_healthy_people(j,:) = [100,100,100,100];
                            control = 1;
                        end
               
             
                    end
                end
            end
        end
  
    end

    rows_to_delete = ((matrix_of_healthy_people(:,1) == 100) & (matrix_of_healthy_people(:,2) == 100)) & (matrix_of_healthy_people(:,3) == 100) & (matrix_of_healthy_people(:,4)==100);
    matrix_of_healthy_people(rows_to_delete,:) = [];
    %deleting the rows which contains full of 100s.
    
    array = size(matrix_of_healthy_people);

    if array(1) == 0 && array(2) == 0
        matrix_of_healthy_people  = zeros(0,4);
    end
    
    array = size(matrix_of_infected_people);
    
    if array(1) == 0 && array(2) == 0
        matrix_of_infected_people = zeros(0,4);
    end

end