function [matrix_of_infected_people] = S1_starting_condition(population_size,percentage_initial_infected,infection_duration)

    number_of_infected_people = population_size * percentage_initial_infected; % number of infected people initially
    number_of_healthy_people = population_size - number_of_infected_people;
    is_vaccinated = 0;
    is_isolated_1 = 0;
    is_isolated_2 = 1;
    matrix_of_infected_people = [];
    
    for i = 1:number_of_infected_people/2
        x_coordinate = randi([-10 10],1,1);
        y_coordinate = randi([-10 10],1,1);
        the_days_left = infection_duration;
        new_row = [x_coordinate,y_coordinate,the_days_left,is_vaccinated,is_isolated_1];
        matrix_of_infected_people = [matrix_of_infected_people;new_row];
    end

    for i = 1:number_of_infected_people/2
        x_coordinate = randi([-10 10],1,1);
        y_coordinate = randi([-10 10],1,1);
        the_days_left = infection_duration;
        new_row = [x_coordinate,y_coordinate,the_days_left,is_vaccinated,is_isolated_2];
        matrix_of_infected_people = [matrix_of_infected_people;new_row];
    end
    
    %from now on, the code is written to achieve the fact that each cell must
    %contain only one person.
    
    control = 1;
    
    while control == 1
    
        control  =0;
    
        for i =1:number_of_infected_people
             
            for j = i+1:number_of_infected_people
                
                if (matrix_of_infected_people(i,1) == matrix_of_infected_people(j,1) )&& (matrix_of_infected_people(i,2) == matrix_of_infected_people(j,2))
                    x_coordinate = randi([-10 10],1,1);
                    y_coordinate = randi([-10 10],1,1);
                    
                    matrix_of_infected_people(j,1) = x_coordinate;
                    matrix_of_infected_people(j,2) = y_coordinate;
                    
                    control = 1;
                end
            end
        end
    end
end