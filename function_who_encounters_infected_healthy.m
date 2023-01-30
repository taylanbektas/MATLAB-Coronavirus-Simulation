function matrix_of_encounters = function_who_encounters_infected_healthy(matrix_of_infected_people,matrix_of_healthy_people)

    matrix_of_encounters = [];
    
    array = size(matrix_of_infected_people);
    number_of_infected_people = array(1);
    
    array = size(matrix_of_healthy_people);
    number_of_healthy_people = array(1);

    x = 0;

    for i = 1:number_of_infected_people
    
        for j = 1:number_of_healthy_people
            
            if (matrix_of_infected_people(i,1) == matrix_of_healthy_people(j,1)) && (matrix_of_infected_people(i,2) == matrix_of_healthy_people(j,2))
                x = x+1;
                
                matrix_of_encounters(x,1) = matrix_of_infected_people(i,1);
                matrix_of_encounters(x,2) = matrix_of_infected_people(i,2);
            end
        end
    end
end