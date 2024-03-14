
all: results/variable_stats.csv \
	results/summary_stats.csv \
	results/scatterplot.png \
	results/boxplot.png \
	results/accuracy_plot.png \
	results/metrics.csv \
	reports/report.html \
	reports/report.pdf

# summary statistics for an individual variable
results/variable_stats.csv: source/01_download_data.R
	Rscript source/01_download_data.R \
		--input_dir="data/wine.data" \
		--output_dir="results"

# csv holding summary statistics for 02 
results/summary_stats.csv: source/02_preprocess.R
	Rscript source/02_preprocess.R --input_dir="data/wine.data" \
		--output_dir="results" \
		--columns="all"

# eda plots 
results/scatterplot.png results/boxplot.png: source/03_eda.R  
	Rscript source/03_eda.R   --input_dir="data/wine.data" \
		--output_dir="results"

# Model evaluation information 
results/accuracy_plot.png results/metrics.csv: source/04_model.R
	Rscript  source/04_model.R	--input_dir="data/wine.data" \
		--output_dir="results"

# render quarto report in HTML and PDF
reports/report.html: results reports/report.qmd
	quarto render reports/report.qmd --to html

reports/report.pdf: results reports/report.qmd
	quarto render reports/report.qmd --to pdf


# clean
clean:
	rm -rf results
	rm -rf reports/report.html \
		reports/report.pdf  