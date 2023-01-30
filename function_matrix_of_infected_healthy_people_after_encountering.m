function [matrix_of_infected_people ,matrix_of_healthy_people,number_of_infected_people_although_vaccinated_iteration] = function_matrix_of_infected_healthy_people_after_encountering(matrix_of_encounters,isolation_probability,infection_probability,infection_probability_healthy_vaccinated,infection_duration,matrix_of_infected_people,matrix_of_healthy_people,iterations_between_vaccines)

    array = size(matrix_of_encounters);
    number_of_rows = array(1);

    array = size(matrix_of_healthy_people);
    number_of_healthy_people = array(1);
    
    number_of_infected_people_although_vaccinated_iteration = 0;
    for i = 1:number_of_rows
        control = 0;
         
        for j = 1:number_of_healthy_people

            if (matrix_of_healthy_people(j,1) == matrix_of_encounters(i,1)) && (matrix_of_healthy_people(j,2) == matrix_of_encounters(i,2)) && control == 0 %do they have same coords?

                randomization = rand;
                if(randomization <= matrix_of_healthy_people(j,5)) && control == 0 %infected
                    the_days_left = infection_duration;
                    randomization_isolation = rand;
                    if matrix_of_healthy_people(j,4) == 1
                        number_of_infected_people_although_vaccinated_iteration = number_of_infected_people_although_vaccinated_iteration +1;
                    end
                    if(randomization_isolation <= isolation_probability) %isolated
                        is_isolated = 1;
                        new_row = [matrix_of_healthy_people(j,1),matrix_of_healthy_people(j,2),the_days_left,matrix_of_healthy_people(j,4),is_isolated];
                        matrix_of_infected_people = [matrix_of_infected_people;new_row];
                        control = 1;
                    else
                        is_isolated = 0;
                        new_row = [matrix_of_healthy_people(j,1),matrix_of_healthy_people(j,2),the_days_left,matrix_of_healthy_people(j,4),is_isolated];
                        matrix_of_infected_people = [matrix_of_infected_people;new_row];
                        control = 1;
                        
                    end
                    matrix_of_healthy_people(j,:) = [100 100 100 100 100 100 100];
                end
                

            end
        end


           
  
    end
    rows_to_delete = ((matrix_of_healthy_people(:,1) == 100) & (matrix_of_healthy_people(:,2) == 100)) & (matrix_of_healthy_people(:,3) == 100) & (matrix_of_healthy_people(:,4)==100) & matrix_of_healthy_people(:,5)==100 & matrix_of_healthy_people(:,6) == 100 & matrix_of_healthy_people(:,7) == 100;
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
