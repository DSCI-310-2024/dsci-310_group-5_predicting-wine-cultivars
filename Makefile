
all: data/wine_data.csv \
	results/summary_stats.csv \
  results/scatterplot.png \
	results/boxplot.png \
	results/accuracy_plot.png \
	results/metrics.csv \
	reports/report.html \
	reports/report.pdf
	
# read in the data
data/wine_data.csv: source/01_download_data.R
	Rscript source/01_download_data.R

# csv holding summary statistics for 02 
results/summary_stats.csv: source/02_preprocess.R
	Rscript source/02_preprocess.R --input_dir="data/wine.csv" \
		--output_dir="results" 

# scatter plot
results/scatterplot.png: source/03_scatterplot.R 
	Rscript source/03_scatterplot.R --scatter1=ash --scatter2=proline \
	--input_dir="data/wine.csv"  \
	--output_dir="results"

# box plot
results/boxplot.png: source/04_boxplot.R 
	Rscript source/04_boxplot.R --variable1=alcohol --input_dir="data/wine.csv" \
	--output_dir="results"

# Model evaluation information 
results/accuracy_plot.png results/metrics.csv: source/05_model.R
	Rscript  source/05_model.R	--input_dir="data/wine.csv" \
		--output_dir="results"

# render quarto report in HTML and PDF
reports/report.html: results reports/report.qmd
	quarto render reports/report.qmd --to html

reports/report.pdf: results reports/report.qmd
	quarto render reports/report.qmd --to pdf


# clean
clean:
	rm -rf results
	rm -rf data/wine_data.csv
	rm -rf reports/report.html \
		reports/report.pdf  

	