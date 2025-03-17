# repro_R

Example solution for workshop "Open and Reproducible Science in R and RStudio" based on the provided example code and data.
Note that this is only one possible way to make the code more open and reproducible, and many other equally valid approaches are possible.

## Author

__Niklas Hohmann__
Utrecht University  
email: n.h.hohmann [at] uu.nl  
Web page: [www.uu.nl/staff/NHohmann](https://www.uu.nl/staff/NHHohmann)  
ORCID: [0000-0003-1559-1838](https://orcid.org/0000-0003-1559-1838)

## Requirements

R version 4.2 or larger and the RStudio IDE

## Usage

Open the file "solution.Rproj" in the RStudio IDE. This will open the project, set all paths correctly, and install the `renv` package (if not already installed).
Then, run

```{r}
renv::restore()
```

to install all required packages in their correct versions. Now you can interact with the code. To run the analysis, run

```{r}
source("code/analysis.r")
```

in the console. This will save bootstrap results in the file `data/bootstrap.RData`. To generate the figures, run

```{r}
source("code/make_figs.r")
```

after running the analyses. This will generate all figures and store them under `figs/`.

## License

Apache 2.0, see LICENCE file for full text

## Repository structure

* code: folder with R scripts
  * analysis.R : example code, loads data and performs bootstrap analyses. Saves results in `data/bootstrap_data.RData`
  * make_figs.R : plots results of bootstrap analyses, saves plots in `figs/`
* data: data folder
  * raw: folder for raw data - READ ONLY
    * dummy_data.csv : example data
  * bootstrap_sd.RData: results of the bootstrap analysis of the standard deviation. Generated after `code/analysis.R` is run
* figs: folder for figures. Initially empty, filled after `code/make_figs.R` is run
* LICENSE: Apache 2.0 license text
* README.md : readme file
* .Rprofile : R session settings
* renv : folder for `renv` package
* renv.lock : lockfile for `renv` package
* .gitignore : utracked files

## Citation

Not published yet. In published form, this would look like

* Hohmann, N. (2025). Example solution for workshop "Open and Reproducible Science in R and RStudio" (v1.0.0). Zenodo. https://doi.org/some_DOI_goes_here
  