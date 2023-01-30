function [matrix_of_healthy_people_after_movement, matrix_of_infected_people_after_movement] = general_movement_function(matrix_of_healthy_people,matrix_of_infected_people)

    array_healthy = size(matrix_of_healthy_people);
    num_healthy_people = array_healthy(1);

    array_infected = size(matrix_of_infected_people);
    num_infected_people = array_infected(1);
    
    matrix_of_healthy_people_after_movement = [];
    matrix_of_infected_people_after_movement = [];

    for healthy_person = 1 : num_healthy_people % loop for healthy people

        x_coordinate = matrix_of_healthy_people(healthy_person,1); % healthy person's x coordinate
        y_coordinate = matrix_of_healthy_people(healthy_person,2); % healthy person's y coordinate
        before_infected = matrix_of_healthy_people(healthy_person,3);
        is_vaccinated_healthy = matrix_of_healthy_people(healthy_person,4);

        for steps = 1 : 3
            
            if x_coordinate == 10 && y_coordinate == 10 %if the healthy person is on the top right corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                end
    
            elseif x_coordinate == -10 && y_coordinate == 10 %if the healthy person is on the top left corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif x_coordinate == -10 && y_coordinate == -10 %if the healthy person is on the bottom left corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                end
    
            elseif x_coordinate == 10 && y_coordinate == -10 %if the healthy person is on the bottom right corner
                
                random_number = randi(3);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                end
    
            elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the healthy person is on the right boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                end
    
            elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the healthy person is on the left boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif (y_coordinate == 10 && x_coordinate ~= 10) && (y_coordinate == 10 && x_coordinate ~= -10) % if the healthy person is on the upper boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 2
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the healthy person is on the bottom boundary, except corners
    
                random_number = randi(6);
                
                if random_number == 1
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 2
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                end
           
            else % all the other places on the 20x20 grid

                random_number = randi(9);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 3
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 4
                    y_coordinate = y_coordinate -1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 6
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 7
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 8
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            end
        end

        matrix_of_healthy_people_after_movement(healthy_person,1) = x_coordinate;
        matrix_of_healthy_people_after_movement(healthy_person,2) = y_coordinate;
        matrix_of_healthy_people_after_movement(healthy_person,3) = before_infected;
        matrix_of_healthy_people_after_movement(healthy_person,4) = is_vaccinated_healthy;

        % the updated matrix of healthy people includes :
        % the new x and y coordinates of the infected person (column 1 and 2)

    end

    for infected_person = 1 : num_infected_people % loop for 12 different infected person

        x_coordinate = matrix_of_infected_people(infected_person, 1); % infected person's x coordinate
        y_coordinate = matrix_of_infected_people(infected_person, 2); % infected person's y coordinate
        the_days_left = matrix_of_infected_people(infected_person,3);
        is_vaccinated_infected = matrix_of_infected_people(infected_person,4);

        for steps = 1 : 3
            
            if x_coordinate == 10 && y_coordinate == 10 %if the infected person is on the top right corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                end
    
            elseif x_coordinate == -10 && y_coordinate == 10 %if the infected person is on the top left corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif x_coordinate == -10 && y_coordinate == -10 %if the infected person is on the bottom left corner
                
                random_number = randi(4);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                end
    
            elseif x_coordinate == 10 && y_coordinate == -10 %if the infected person is on the bottom right corner
                
                random_number = randi(3);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                end
    
            elseif (x_coordinate == 10 && y_coordinate ~= 10) && (x_coordinate == 10 && y_coordinate ~= -10) % if the infected person is on the right boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                end
    
            elseif (x_coordinate == -10 && y_coordinate ~= 10) && (x_coordinate == -10 && y_coordinate ~= -10) % if the infected person is on the left boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 3
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif (y_coordinate == 10 && x_coordinate ~= 10) || (y_coordinate == 10 && x_coordinate ~= -10) % if the infected person is on the upper boundary, except corners
                
                random_number = randi(6);
                
                if random_number == 1
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 2
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            
            elseif (y_coordinate == -10 && x_coordinate ~= 10) && (y_coordinate == -10 && x_coordinate ~= -10) % if the infected person is on the bottom boundary, except corners
    
                random_number = randi(6);
                
                if random_number == 1
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 2
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 3
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 4
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                end
           
            else % all the other places on the 20x20 grid

                random_number = randi(9);
                
                if random_number == 1
                    x_coordinate = x_coordinate + 1;
                elseif random_number == 2
                    x_coordinate = x_coordinate - 1;
                elseif random_number == 3
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 4
                    y_coordinate = y_coordinate -1;
                elseif random_number == 5
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 6
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate + 1;
                elseif random_number == 7
                    x_coordinate = x_coordinate - 1;
                    y_coordinate = y_coordinate - 1;
                elseif random_number == 8
                    x_coordinate = x_coordinate + 1;
                    y_coordinate = y_coordinate - 1;
                end
            end
        end

        matrix_of_infected_people_after_movement(infected_person,1) = x_coordinate;
        matrix_of_infected_people_after_movement(infected_person,2) = y_coordinate;
        matrix_of_infected_people_after_movement(infected_person,3) = the_days_left;
        matrix_of_infected_people_after_movement(infected_person,4) = is_vaccinated_infected;

        % the updated matrix of infected people includes :
        % the new x and y coordinates of the infected person (column 1 and 2)
    end
end