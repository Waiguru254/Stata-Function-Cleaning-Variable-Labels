    *** Labelling 
    qui ds *
    foreach var of varlist  `r(varlist)' {
        if regexm("$`var'","choice=") {
             *** Extract the variable name
            local variable_name  = substr("`var'", 1, strpos("`var'", "___") - 1)
            cap gen `variable_name' = ""

            *** Extract the variable label 
            local variable_label = substr("$`var'", 1, strpos("$`var'", "(") - 1)
            cap lab var `variable_name' "`variable_label'"

            *** Extract the checkbox variable labels
            local extracted_text = subinstr(substr("$`var'", strpos("$`var'", "(") + 1, strrpos("$`var'", ")") - strpos("$`var'", "(") - 1),"choice=","",1)

            * Display the extracted text
            cap lab var `var' "`extracted_text'"
        }
    }
