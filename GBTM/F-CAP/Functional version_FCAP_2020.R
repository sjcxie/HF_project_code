########## F-CAP version 1.1.0 ###########
#### (c) Sven L. Klijn, February 2015 ####

############# USER SETTINGS ##############

sas_path <- '"C:/Program Files/SASHome2/SASFoundation/9.4/sas.exe"'          # path to SAS (mind the quotes), e.g. '"C:/SASHome/SASFoundation/9.3/sas.exe"'
excel_template <- "C:/mydocuments/Traj/F-CAP/fcap_template.xlsx"    # path to F-CAP template, e.g. "C:/myfiles/fcap_template.xlsx"
input_directory <- "C:/mydocuments/Traj/F-CAP/"   # path to data directory, e.g. "C:/myfiles/study-A/"
input_file <- "kevin_qol_centered.sas7bdat"   
output_directory <- "C:/mydocuments/Traj/F-CAP/output/"  # folder to which results are written, e.g. "C:/myfiles/output/"


# proc traj variables, also check: http://www.andrew.cmu.edu/user/bjones/
# additional parameters can be included in the model variable as follows:
# model <- "CNORM; MIN 3; MAX 42"
id <- "id"            # variable name of the identifier, e.g. participant number
var <- "o1-o3"          # dependent outcome variables
indep <- "t1-t3"        # independent variables
model <- "CNORM"        # model: "CNORM", "ZIP", or "LOGIT"

groups_min <- 3         # minimum number of groups (k) to test in a model, absolute minimum: 1
groups_max <- 10       # maximum number of groups (k) to test in a model, absolute maximum: 20
poly_order <- 2         # polynomial order: minimum 0, maximum 5

mode <- "ANALYSIS"          # "FULL": Automatically create the F-CAP without need for user interaction
                        # "SAS": Run the proc traj procedures in SAS, stores results in the output-directory
                        # "ANALYSIS": Uses SAS results in the output-directory to create the F-CAP
open_file <- TRUE       # automatically open the file with the resulting F-CAP: TRUE or FALSE

# Note: in case Java is not available, the F-CAP results are written to a .txt-file
# These can be manually copied to the the Excel-template to display the F-CAP graphs

########## END OF USER SETTINGS ##########


# analyse AIC, BIC and L
analyse_bic <- function(){
        # create dataframe for storage
        bic_df <- data.frame("AIC"=numeric(length(groups)),
                "BIC"=numeric(length(groups)), "L"=numeric(length(groups)),
                "Convergence"=numeric(length(groups)), row.names=groups)
        
        for (group in groups){
                # read data
                bic_file <- paste0(output_directory, "fcap_bic_", group, ".csv")
                df <- read.csv(bic_file)
                
                # get AIC, BIC and L
                aic_col <- grep("_AIC_", colnames(df), fixed=TRUE)[1]
                aic <- df[1, aic_col]
                bic_col <- grep("_BIC1_", colnames(df), fixed=TRUE)[1]
                bic <- df[1, bic_col]
                l_col <- grep("_LOGLIK_", colnames(df), fixed=TRUE)[1]
                l <- df[1, l_col]
                conv_col <- grep("_CONVERGE_", colnames(df), fixed=TRUE)[1]
                conv <- df[1, conv_col]
                # store data
                bic_df[toString(group),] <- c(aic, bic, l, conv)
        }
        bic_df
}


# analyse APPA (avePP), OCC, mismatch, SD and smallest group
analyse_prob <- function(){
        # create dataframe for storage
        prob_df <- data.frame("avePP"=numeric(length(groups)),
                "avePPm"=numeric(length(groups)),
                "OCC"=numeric(length(groups)), "OCCm"=numeric(length(groups)),
                "mis"=numeric(length(groups)), "mism"=numeric(length(groups)),
                "SD"=numeric(length(groups)), "SDm"=numeric(length(groups)),
                "smallAss"=numeric(length(groups)),
                "smallEst"=numeric(length(groups)), row.names=groups)
        
        for (group in groups){
                # read data
                prob_file <- paste0(output_directory, "fcap_prob_", group,
                        ".csv")
                df <- read.csv(prob_file)
                
                # find posterior probabilities for each group
                group_probs <- vector("list", group)
                for (row in 1:nrow(df)){
                        g <- df[row, "GROUP"]
                        group_probs[[g]] <- c(group_probs[[g]],
                                df[row, paste0("GRP", g, "PRB")])
                }
                
                # calculate APPA
                group_prob_means <- vector()
                for (i in 1:group){
                        if (!is.null(group_probs[[i]])){
                                group_prob_means <- c(group_prob_means,
                                        mean(group_probs[[i]], na.rm=TRUE))
                        } else{
                                # emtpy group
                                group_prob_means <- c(group_prob_means, NA)
                        }
                }
                prob_df[toString(group), "avePP"] <- mean(group_prob_means,
                        na.rm=TRUE)
                prob_df[toString(group), "avePPm"] <- min(group_prob_means,
                        na.rm=TRUE)
                
                # calculate mismatch and smallest group
                prob_cols <- grep("GRP", colnames(df), fixed=TRUE)
                if (group == 1){
                        estimated <- mean(df[,prob_cols])
                } else{
                        estimated <- colMeans(df[, prob_cols], na.rm=TRUE)
                }
                assigned <- vector()
                mismatch <- vector()
                for (i in 1:group){
                        if (!is.null(group_probs[[i]]) > 0){
                                assigned <- c(assigned,
                                        length(group_probs[[i]]) / nrow(df))
                        } else{
                                assigned <- c(assigned, 0)
                        }
                        mismatch <- c(mismatch, abs(estimated[i] - assigned[i]))
                }
                prob_df[toString(group), "mis"] <- mean(mismatch, na.rm=TRUE)
                prob_df[toString(group), "mism"] <- max(mismatch, na.rm=TRUE)
                prob_df[toString(group), "smallAss"] <- max(1e-4, min(assigned,
                        na.rm=TRUE))
                prob_df[toString(group), "smallEst"] <- max(1e-4, min(estimated,
                        na.rm=TRUE))
                
                # calculate OCC
                if (group == 1){
                        prob_df[toString(group), "OCC"] <- 999
                        prob_df[toString(group), "OCCm"] <- 999
                } else{
                        occs <- vector()
                        for (i in 1:group){
                                numer <- group_prob_means[i] /
                                        (1 - group_prob_means[i])
					  denom <- estimated[i]
                                occs <- c(occs, numer/denom)
                        }
                        occ <- mean(occs, na.rm=TRUE)
                        if (occ > 999){
                                occ <- 999
                        }
                        occm <- min(occs, na.rm=TRUE)
                        if (occm > 999){
                                occm <- 999
                        }
                        prob_df[toString(group), "OCC"] <- occ
                        prob_df[toString(group), "OCCm"] <- occm
                }

                # calculate SD
                sd <- vector()
                for (i in 1:group){
                        sd <- c(sd, sd(group_probs[[i]]))
                }
                prob_df[toString(group), "SD"] <- mean(sd, na.rm=TRUE)
                prob_df[toString(group), "SDm"] <- max(sd, na.rm=TRUE)
        }
        prob_df
}


# write output
create_excel <- function(bic_df, prob_df){
        # create copy of template file
        file.copy(excel_template, output_file)

        # read excel file
        workbook <- loadWorkbook(output_file)
        sheet <- getSheets(workbook)[[2]]

        # insert data
        cells <- CellBlock(sheet, groups_min + 2, 2, length(groups), 13)
        for(col in 1:10){
                CB.setColData(cells, prob_df[,col], col)
        }
        for(col in 1:3){
                CB.setColData(cells, bic_df[,col], col+10)
        }
        
        # save excel file
        workbook$setForceFormulaRecalculation(TRUE)
        saveWorkbook(workbook, output_file)
}


# create instructions for SAS
create_sas <- function(){
        # automatically determine MIN and MAX for CNORM models, if not defined
        if (grepl("CNORM", model, ignore.case=TRUE)){
                min <- TRUE
                max <- TRUE
                if (!grepl("MIN", model, ignore.case=TRUE)){
                        min <- FALSE
                }
                if (!grepl("MAX", model, ignore.case=TRUE)){
                        max <- FALSE
                }
                if (!(min && max)){
                        # find column names
                        vars <- strsplit(var, " ", fixed=TRUE)
                        cols <- vector()
                        for (v in vars[[1]]){
                                if (v == ""){
                                        next
                                }
                                if (grepl("-", v)){
                                        sub <- strsplit(v, "-", fixed=TRUE)
                                        sub_low <- as.numeric(gsub("\\D", "",
                                                sub[[1]][1]))
                                        sub_high <- as.numeric(gsub("\\D", "",
                                                sub[[1]][2]))
                                        sub_text <- gsub("\\d", "", sub[[1]][1])
                                        for (i in sub_low:sub_high){
                                                cols <- c(cols, paste0(sub_text,
                                                i))
                                        }
                                } else{
                                        cols <- c(cols, v)
                                }
                        }
                        # find minimum and/or maximum
                        df <- read.sas7bdat(paste0(input_directory, input_file))
                        col_match <- vector(length=length(colnames(df)))
                        for (col in cols){
                                col_match <- grepl(col, colnames(df),
                                        ignore.case=TRUE) | col_match
                        }
                        if (!min){
                                min <- as.integer(min(df[,col_match],
						    na.rm=TRUE))
					  if(min(df[,col_match], na.rm=TRUE) < min){
						    min <- min - 1
					  }
                                model <- paste0(model, "; MIN ", min)
                                cat("Automatically determined MIN:", min, "\n")
                        }
                        if (!max){
                                max <- as.integer(max(df[,col_match],
						    na.rm=TRUE))
					  if(max(df[,col_match], na.rm=TRUE) > max){
						    max <- max + 1
					  }
                                model <- paste0(model, "; MAX ", max)
                                cat("Automatically determined MAX:", max, "\n")
                        }
                }
        }
        
        # instructions
        fcap_sas <- "options nonotes nosource nosource2 errors=0;\n"
        fcap_sas <- paste0(fcap_sas, "libname fcap '", input_directory,
                "';\n\n")
        for (group in groups){
                # proc traj procedure
                fcap_sas <- paste0(fcap_sas, "PROC TRAJ DATA=fcap.",
                        input_filename,
                        " OUTPLOT=OP OUTSTAT=OS OUT=OF OUTEST=OE;\n")
                fcap_sas <- paste0(fcap_sas, "ID ", id, "; VAR ", var,
                        "; INDEP ", indep, ";\n")
                order <- gsub(",", "", toString(rep.int(poly_order, group)))
                fcap_sas <- paste0(fcap_sas, "MODEL ", model, "; NGROUPS ",
                        group, "; ORDER ", order, ";\n")
                fcap_sas <- paste0(fcap_sas, "RUN;\n")
                # export probabilities table
                fcap_sas <- paste0(fcap_sas,
                        "PROC EXPORT DATA=Work.Oe OUTFILE='", output_directory,
                        "fcap_bic_", group, ".csv' DBMS=CSV;\n")
                fcap_sas <- paste0(fcap_sas,
                        "PROC EXPORT DATA=Work.Of OUTFILE='", output_directory,
                        "fcap_prob_", group, ".csv' DBMS=CSV;\n")
                fcap_sas <- paste0(fcap_sas, "RUN;\n\n")
        }
        
        # save to SAS programme file
        output_file <- paste0(output_directory, "fcap.sas")
        write(fcap_sas, file=output_file)
}


# write output
create_txt <- function(bic_df, prob_df){
        # create copy of template file
        file.copy(excel_template, output_file)
        
        # merge dataframes
        total <- merge(prob_df, bic_df, by=0, all=TRUE, sort=FALSE)
        total <- total[, 2:ncol(total)]
        
        # write dataframe to txt file
        write.table(total, output_txt, sep="\t", row.names=FALSE,
                col.names=FALSE)
}



# controller hub
main <- function(mode='FULL'){
        # check what needs to be done
        do_sas <- FALSE
        do_analysis <- FALSE
        step <- 0
        if (mode == 'FULL'){
                total <- "4"
                do_sas <- TRUE
                do_analysis <- TRUE
        } else if (mode == 'SAS'){
                total <- "2"
                do_sas <- TRUE
        } else{ #if (mode == 'ANALYSIS')
                total <- "2"
                do_analysis <- TRUE
        }
        
        
        pre_process(do_sas, do_analysis)
        if (do_sas){
                step <- step + 1
                cat(paste0("[", step, "/", total,
                        "] Creating instructions for SAS\n"))
                create_sas()
                step <- step + 1
                cat(paste0("[", step, "/", total,
                        "] Running proc traj in SAS (this can take long)\n"))
                system(paste0(sas_path, " -nosplash -nolog -noprint 
-nostepchkpt -nosyntaxcheck -noverbose -SYSIN ", output_directory, "fcap.sas"))
        }
        if (do_analysis){
                step <- step + 1
                cat(paste0("[", step, "/", total,
                        "] Analysing proc traj outcomes\n"))
                bic_df <- analyse_bic()
                prob_df <- analyse_prob()
                step <- step + 1
                cat(paste0("[", step, "/", total, "] Writing output file\n"))
                if (xlsx_output){
                        create_excel(bic_df, prob_df)
                        if (open_file){
                                shell.exec(output_file)
                        }
                } else{
                        create_txt(bic_df, prob_df)
                        if (open_file){
                                shell.exec(output_file)
                                shell.exec(output_txt)
                        }
                }
        }
        cat("Finished") 
}


# convert input data
pre_process <- function(do_sas, do_analysis){
        library(tools)
        if (do_sas){
                if (!"sas7bdat" %in% rownames(installed.packages())){
                        install.packages("sas7bdat")
                }
                suppressMessages(suppressWarnings(library(sas7bdat)))
                if (substr(model, nchar(model), nchar(model)) == ";"){
                        assign("model", substr(model, 1, nchar(model) - 1),
                                .GlobalEnv)
                }
        }
        time <- strftime(Sys.time(), format="%Y_%m_%d_%H_%M_%S")
        if (do_analysis){
                if (!"xlsx" %in% rownames(installed.packages())){
                        install.packages("xlsx")
                }
                tryCatch({
                        suppressMessages(suppressWarnings(library(xlsx)))
                        assign("xlsx_output", TRUE, .GlobalEnv)
                }, error=function(condition){
                        # (correct version of) java is probably not available
                        assign("xlsx_output", FALSE, .GlobalEnv)
                        assign("output_txt", paste0(output_directory, "FCAP_",
                                time, ".txt"), .GlobalEnv)
                })
        }
        assign("input_filename", file_path_sans_ext(input_file), .GlobalEnv)
        assign("groups", max(1, groups_min) : min(20, groups_max), .GlobalEnv)
        assign("poly_order", min(4, max(0, poly_order)), .GlobalEnv)
        assign("output_file", paste0(output_directory, "FCAP_", time, ".xlsx"),
               .GlobalEnv)
}

        
main(mode)


