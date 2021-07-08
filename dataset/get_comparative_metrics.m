function [output_metrics] = get_comparative_metrics(total_objects)
    %% Import the test dataset
    [test_dataset] = import_test_dataset();
 
    output_metrics = [];
    metrics = zeros(100, 29);
    potential_detections = [];
    detections = [];
    %% Calculate centres
    for j = 1:100
        % segment rows into fours based on n windows
        n_windows = test_dataset{j, 2};
        for k = 1:n_windows
            % for each window index, get x, y, width and height
            window_index = 2 + (4 * k);
            x = test_dataset{j, window_index - 3};
            y = test_dataset{j, window_index - 2};
            width = test_dataset{j, window_index - 1};
            height = test_dataset{j, window_index};
         
            metrics(j, 1) = n_windows;
            other_index = 1 + (2 * k);
            metrics(j, other_index - 1) = x;
            metrics(j, other_index) = y;
        end
     
        n_windows_test = sum(total_objects(j, :) > 0) / 5;
        for k = 1:n_windows_test
            window_index_b = 5 * k;
            x = total_objects(j, window_index_b - 4);
            y = total_objects(j, window_index_b - 3);
            width = total_objects(j, window_index_b - 2);
            height = total_objects(j, window_index_b - 1);
         
            if x > 0 && y > 0 && width > 0 && height > 0
                centre_x = x + (width / 2);
                centre_y = y + (height / 2);
             
                metrics_b(j, 1) = n_windows_test;
                other_index = 1 + (2 * k);
                metrics_b(j, other_index - 1) = centre_x;
                metrics_b(j, other_index) = centre_y;
            else
                metrics_b(j, 1) = 0;
                other_index = 1 + (2 * k);
                metrics_b(j, other_index - 1) = 0;
                metrics_b(j, other_index) = 0;
            end
        end
    end
 
    %% get distances
    for k = 1:100
        for i = 1:metrics(k, 1)
            index = 1 + (2 * i);
            x_1 = metrics(k, index - 1);
            y_1 = metrics(k, index);
         
            for j = 1:metrics_b(k, 1)
                index = 1 + (2 * j);
                x_2 = metrics_b(k, index - 1);
                y_2 = metrics_b(k, index);
             
                coords = [x_1, y_1; x_2, y_2];
                d = pdist(coords, 'euclidean');
             
                width_index = (5 * j) - 2;
                width = total_objects(k, width_index) / 2;
             
                % Dynamic threshold
                if d < width
                    potential_detections = [potential_detections; [k, d, x_1, y_1, x_2, y_2]];
                end
            end
        end
     
        % Treat duplicate detections as false positives
        firstColumn = potential_detections(:, 1);
        rowsByK = potential_detections(firstColumn == k, :);
     
        [~, ia] = unique(rowsByK(:, 3:4), 'rows');
        detections = [detections; rowsByK(ia, :)];
     
        peds_detected = sum(detections(:, 1) == k) / metrics(k, 1);
        
        % Calculate metrics
        TP = sum(detections(:, 1) == k);
        unique_vals = size(unique(rowsByK(:, 5:6), 'rows'),1);
        FP = metrics_b(k,1) - unique_vals;
        FN = metrics(k, 1) - sum(detections(:, 1) == k);
        
        output_metrics = [output_metrics; peds_detected, TP, FP, FN];
    end
end