# - Create a file `timer.r` in the root folder 
#(i.e. the same folder as this README-file). 
#The `timer.r`-file should source the files in `scripts\`, 
#and use tictoc to time them. 

#Include a comment in your final script on which method is fastest, and any idea 
#you might have that explains the result. 
# ----------------

library(tictoc)

script_path <- "scripts/"

solutions <- c("Solution1.r", "Solution2.r", "Solution3.r")

for(solution in solutions) {
  tic(paste("Timing", solution))
  
  # Source the script
  source(paste0(script_path, solution))

  # Stop timer and print results
  toc(log = TRUE)
}

printTicTocLog() %>%
  knitr::kable()

# The third method is the fastest. It is likely due to that is manages to split 
# the work better along the cores. The second solution is the worst.
# This may be due to that is loands in one task at the time, not taking advandage of the
# available cores. It may be that all cores runs the same work.