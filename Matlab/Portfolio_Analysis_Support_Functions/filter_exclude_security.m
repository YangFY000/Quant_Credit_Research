function [idx] = filter_exclude_security(auxH0A0Ana)


%% Exclude High Political Risk - Use EM as a proxy
%idx = idx | auxH0A0Ana.dm_em == 'EM';
idx = auxH0A0Ana.dm_em == 'EM';


%% Exclude industries
idx = idx | ...
        auxH0A0Ana.bbrg_ind == 'Internet' &  ...
        ~(auxH0A0Ana.bbrg_subind == 'E-Commerce/Services');
     
idx = idx | ...
        auxH0A0Ana.bbrg_ind == 'Apparel' & ...
        ~(auxH0A0Ana.bbrg_subind == 'Apparel Manufacturers');
    
idx = idx | ...
        auxH0A0Ana.bbrg_ind == 'Distribution/Wholesale' & ...
        ~(auxH0A0Ana.bbrg_subind == 'Import/Export');
    
idx = idx | ...
        auxH0A0Ana.bbrg_ind == 'Retail' & ...
        ~(auxH0A0Ana.bbrg_subind == 'Retail-Apparel/Shoe' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Automobile' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Discount' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Drug Store' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Mail Order' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Propane Distrib' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Regnl Dept Store' |  ...
        auxH0A0Ana.bbrg_subind == 'Retail-Restaurants' );  
        % H0A0Ana.bbrg_industry_subgroup == 'Retail-Auto Parts' |  ...
        %H0A0Ana.bbrg_industry_subgroup == 'Retail-Propane Distrib' |  ...

idx = idx | ...
        auxH0A0Ana.bbrg_ind == 'Healthcare-Products' & ...
        ~(auxH0A0Ana.bbrg_subind == 'Diagnostic Kits' |  ...
        auxH0A0Ana.bbrg_subind == 'Hospital Beds/Equipment' |  ...
        auxH0A0Ana.bbrg_subind == 'Medical Instruments' |  ...
        auxH0A0Ana.bbrg_subind == 'Medical Products' |  ...
        auxH0A0Ana.bbrg_subind == 'Optical Supplies' |  ...
        auxH0A0Ana.bbrg_subind == 'X-Ray Equipment' |  ...
        auxH0A0Ana.bbrg_subind == 'Dialysis Centers' |  ...
        auxH0A0Ana.bbrg_subind == 'Medical Labs&Testing Srv' |  ...        
        auxH0A0Ana.bbrg_subind == 'Medical-Hospitals' );  
    
    
idx = idx | ...
        auxH0A0Ana.bbrg_ind == 'Pharmaceuticals' & ...
        ~(auxH0A0Ana.bbrg_subind == 'Medical-Drugs' |  ...
        auxH0A0Ana.bbrg_subind == 'Medical-Generic Drugs' |  ...
        auxH0A0Ana.bbrg_subind == 'Pharmacy Services' |  ...
        auxH0A0Ana.bbrg_subind == 'Vitamins&Nutrition Prod' );  
    
idx = idx | ...
        auxH0A0Ana.bbrg_sec == 'Technology' & ...
        ~(auxH0A0Ana.bbrg_subind == 'Computer Services' |  ...
        auxH0A0Ana.bbrg_subind == 'Computers' |  ...
        auxH0A0Ana.bbrg_subind == 'Computers-Integrated Sys' |  ...
        auxH0A0Ana.bbrg_subind == 'Office Automation&Equip' |  ...
        auxH0A0Ana.bbrg_subind == 'Electronic Compo-Semicon' | ...
        auxH0A0Ana.bbrg_subind == 'Semiconductor Equipment' |  ...
        auxH0A0Ana.bbrg_subind == 'Applications Software' |  ...
        auxH0A0Ana.bbrg_subind == 'Data Processing/Mgmt' |  ...
        auxH0A0Ana.bbrg_subind == 'Enterprise Software/Serv' );          
    
idx = idx | ...
        auxH0A0Ana.bbrg_sec == 'Utilities' & ...
        (auxH0A0Ana.bbrg_subind == 'Water' | ...
        auxH0A0Ana.bbrg_subind == 'Electric-Transmission' | ...
        auxH0A0Ana.bbrg_subind == 'Gas-Transportation');

 % for each level3 group exclude issues with lower and higher
 % quartiles by price
 % 'grp_flt' function returns idx to records within specified quartile
 % so need to negate the index to obtain records to exclude.
 [s_idx] = grp_flt(auxH0A0Ana,9,18,25,75);  
    
% [~, I] = sort(double(H0A0Ana.price,8,17,25,75));
% l = length(I);
% s_idx = I>0.25*l & I<0.75*l;

% idx has the issue to exclude
idx = idx | ~s_idx;


