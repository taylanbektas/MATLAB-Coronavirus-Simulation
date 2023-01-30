function [output_matrix_of_healthy_people,num_people_second_vaccinated_this_iteration] = second_vaccinating_function(matrix_of_healthy_people)
    
    healthy_matrix_size = size(matrix_of_healthy_people);
    num_people_healthy = healthy_matrix_size(1);
    num_people_second_vaccinated_this_iteration = 0;
    
    for i = 1 : num_people_healthy

        if matrix_of_healthy_people(i,7) == 0

            if (matrix_of_healthy_people(i,6) == 3) && (matrix_of_healthy_people(i,4) == 1) % if person is vaccinated once
    
                if rand < 0.8
                    matrix_of_healthy_people(i,4) = 2;
                    num_people_second_vaccinated_this_iteration = num_people_second_vaccinated_this_iteration + 1;
                    matrix_of_healthy_people(i,6) = 2000;
                else
                    matrix_of_healthy_people(i,6) = 1000;
                end

            end
        else
           matrix_of_healthy_people(i,6) = 2000;
        end
    end

    output_matrix_of_healthy_people = matrix_of_healthy_people;
end