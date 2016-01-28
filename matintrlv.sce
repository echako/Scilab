function intrlvdmat = matintrlv(mat, Nrows, Ncols)
    //Check the number of input arguments.
    [op ip] = argn(0);
    if ip ~= 3 then
        error("Not enough input arguments.");
    end
    
    //Check if the data size is same as that of the Nrows*Ncols.
    dimMat = size(mat);
    if [ dimMat(1) ~= Nrows * Ncols] then
        error("The product of Nrows and Ncols must equal the length of the sequence in DATA");
    end
    
    //Now rearrange the data into tmp matirix.
    
    for i = 1:dimMat(2)             //If mutiple columns are there go through each columns of data.
        tmpMatRow = 1;
        tmpMatCol = 1;
        for j = 1:dimMat(1)         //Read the data from columns.
            if tmpMatRow <= Nrow then
                tmpMat(tmpMatRow,tmpMatCol) = mat(j,i);
                tmpMatRow = tmpMatRow + 1;
            else
                tmpMatRow = 1;
                tmpMatCol = tmpMatCol + 1;
                tmpMat(tmpMatRow,tmpMatCol) = mat(j,i);
                tmpMatRow = tmpMatRow + 1;
            end
        end
        for k = 1:Ncols
            tmpData =  tmpMat(:,k);
        end
        intrlvdmat(:, i) = tmpData';
endfunction
