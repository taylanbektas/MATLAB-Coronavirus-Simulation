function [output_matrix_of_healthy_people,num_people_vaccinated_this_iteration] = vaccinating_function(matrix_of_healthy_people, rate_of_vaccination_healthy_people)

    healthy_matrix_size = size(matrix_of_healthy_people);
    num_people_healthy = healthy_matrix_size(1);
    %output_matrix_of_healthy_people = matrix_of_healthy_people;

    num_healthy_vaccinable_people = 0;
    num_people_vaccinated_this_iteration = 0;
    matrix_of_not_vaccinated_people = [];
    matrix_of_vaccinated_people = [];
    
    for i = 1 : num_people_healthy

        if matrix_of_healthy_people(i,4) == 0 % if person is not vaccinated
            num_healthy_vaccinable_people = num_healthy_vaccinable_people + 1;
            new_row = [matrix_of_healthy_people(i,1),matrix_of_healthy_people(i,2),matrix_of_healthy_people(i,3),matrix_of_healthy_people(i,4),matrix_of_healthy_people(i,5),matrix_of_healthy_people(i,6),matrix_of_healthy_people(i,7)];
            matrix_of_not_vaccinated_people = [matrix_of_not_vaccinated_people ; new_row];
            matrix_of_healthy_people(i,:) = 100;
        end

    end
    
    rows_to_delete = ((matrix_of_healthy_people(:,1) == 100) & (matrix_of_healthy_people(:,2) == 100)) & (matrix_of_healthy_people(:,3) == 100) & (matrix_of_healthy_people(:,4) == 100);
    matrix_of_healthy_people(rows_to_delete,:) = [];

    num_people_will_vaccinated = floor(rate_of_vaccination_healthy_people * num_healthy_vaccinable_people); 

    % sometimes the ratio will not be integer, to overcome this problem, we
    % use floor function to find how many people will be vaccinated on this
    % iteration. it is assumed that decimals will be neglected.
    
    while num_people_will_vaccinated ~= num_people_vaccinated_this_iteration
        random_index = randi(num_healthy_vaccinable_people);

        if matrix_of_not_vaccinated_people(random_index,4) == 0

            matrix_of_not_vaccinated_people(random_index,4) = 1;
            %output_matrix_of_healthy_people(random_index,4) = 1;
            %new_row = [matrix_of_not_vaccinated_people(random_index,1),matrix_of_not_vaccinated_people(random_index,2),matrix_of_not_vaccinated_people(random_index,3),matrix_of_not_vaccinated_people(random_index,4)];
            %matrix_of_vaccinated_people = [matrix_of_vaccinated_people ; new_row];
            %matrix_of_not_vaccinated_people(random_index,:) = 100; %temp value to delete

            num_people_vaccinated_this_iteration = num_people_vaccinated_this_iteration + 1;
        end
    end
    
    output_matrix_of_healthy_people = [matrix_of_healthy_people;matrix_of_not_vaccinated_people];
    %rows_to_delete = ((matrix_of_not_vaccinated_people(:,1) == 100) & (matrix_of_not_vaccinated_people(:,2) == 100)) & (matrix_of_not_vaccinated_people(:,3) == 100) & (matrix_of_not_vaccinated_people(:,4) == 100);
    %matrix_of_not_vaccinated_people(rows_to_delete,:) = [];

end