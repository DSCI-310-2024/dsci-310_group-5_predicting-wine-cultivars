# csv holding summary statistics for 02 
results/summary_stats.csv: source/02_preprocess.R
	Rscript source/02_preprocess.R --input_dir="data/wine.data" \
		--out_dir="results"

# eda plots 
results/scatterplot.png results/boxplot.png: source/03_eda.R  
	Rscript source/03_eda.R   --input_dir="data/wine.data" \
		--out_dir="results"

# Model evaluation information 
results/accuracy_plot.png results/metrics.csv: source/04_model.R
	Rscript  source/04_model.R	--input_dir="data/wine.data" \
		--out_dir="results"