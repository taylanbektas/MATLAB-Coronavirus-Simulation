function [number_of_newly_infected_people,total_num_of_infected_people,number_of_newly_healed_people,total_num_of_healed_people_output,number_of_died_people,total_num_of_died_people_output]= function_reporting_purposes(healthy_matrix_at_the_beginning,infected_matrix_at_the_beginning,healthy_matrix_after_encountering,infected_matrix_after_encountering,healthy_matrix_after_remaining_day,infected_matrix_after_remaining_day,total_num_of_healed_people_input,total_num_of_died_people_input)

    array = size(infected_matrix_after_encountering);
    row_number_of_infected_matrix_after_encountering = array(1);

    array = size(infected_matrix_at_the_beginning);
    row_number_of_infected_matrix_at_the_beginning = array(1);

    array = size(healthy_matrix_at_the_beginning);
    row_number_of_healthy_matrix_at_the_beginning = array(1);

    array = size(healthy_matrix_after_remaining_day);
    row_number_of_healthy_matrix_after_remaining_day = array(1);

    array = size(healthy_matrix_after_encountering);
    row_number_of_healthy_matrix_after_encountering = array(1);

    array = size(infected_matrix_after_remaining_day);
    row_number_of_infected_matrix_after_remaining_day = array(1);

    number_of_newly_infected_people = row_number_of_infected_matrix_after_encountering-row_number_of_infected_matrix_at_the_beginning; %last-first
    total_num_of_infected_people = row_number_of_infected_matrix_at_the_beginning;    %iteration'un başlangıcındaki matrixten hesaplanır.
    number_of_newly_healed_people = row_number_of_healthy_matrix_after_remaining_day-row_number_of_healthy_matrix_after_encountering; 
    total_num_of_healed_people_output = total_num_of_healed_people_input+number_of_newly_healed_people;
    number_of_died_people = row_number_of_infected_matrix_after_encountering-row_number_of_infected_matrix_after_remaining_day-number_of_newly_healed_people; %total change in num of infected-newly_healed_people
    total_num_of_died_people_output = total_num_of_died_people_input+number_of_died_people;

end