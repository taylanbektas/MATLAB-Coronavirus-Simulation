function matrix_of_healthy_people= infection_probability_calculator(matrix_of_healthy_people_input,iterations_between_vaccines,infection_probability,infection_probability_healthy_vaccinated)
        
    matrix_of_healthy_people = matrix_of_healthy_people_input;
    
    array = size(matrix_of_healthy_people);
    it = array(1);

    for j =1:it
    
        if matrix_of_healthy_people(j,4) == 2 || matrix_of_healthy_people(j,7) == 1 || matrix_of_healthy_people(j,3) == 1i
            matrix_of_healthy_people(j,5) =0;
        elseif matrix_of_healthy_people(j,6) == 2000
            matrix_of_healthy_people(j,5) = 0;
        
        elseif matrix_of_healthy_people(j,6) == 1000 && matrix_of_healthy_people(j,4) == 1 %1 vaccinated but no 2 vaccinated at all.
            matrix_of_healthy_people(j,5) = infection_probability;
        
        elseif matrix_of_healthy_people(j,6) < iterations_between_vaccines && matrix_of_healthy_people(j,4) == 1 %1 vaccinated might be 2 vaccinated too.
            matrix_of_healthy_people(j,5) = infection_probability_healthy_vaccinated;
       
        elseif matrix_of_healthy_people(j,4) == 0  && matrix_of_healthy_people(j,3) == 0 && matrix_of_healthy_people(j,7) == 0 %not vaccinated not infected before vaccine 
            matrix_of_healthy_people(j,5) = infection_probability;
        
        elseif matrix_of_healthy_people(j,3) == 1
            matrix_of_healthy_people(j,5) = 0;
        end
    end
end
    
    