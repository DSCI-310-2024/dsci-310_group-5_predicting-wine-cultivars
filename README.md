# Predicting Wine Cultivars

Contributors:
Zhibek Dzhunusova, Andrea Jackman, Kaylan Wallace, Chuxuan Zhou.

## About 
 
In this project, we will predict what cultivar a wine was derived from based on its chemical properties.  

The data was sourced from the [UCI Machine Learning Repository](https://doi.org/10.24432/C5PC7J) (Aberhard et al. 1991). It contains data about various wines from Italy derived from three different cultivars. Each row represents the chemical and physical properties of a different wine, such as its concentration of alcohol, magnesium level and hue.  

## Usage

To run the analysis:

First run ```docker build -t <image_name> .``` and replace <image_name> with an appropriate name


The run 
```docker run --rm -it <image_name>```

## Dependencies 

R is the main language used for analysis. Package versions are specified in the [Dockerfile]()

## License

MIT License

Copyright (c) 2024 Zhibek Dzhunusova, Andrea Jackman, Kaylan Wallace, Chuxuan Zhou

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## References

Aeberhard,Stefan and Forina,M.. (1991). Wine. UCI Machine Learning Repository. https://doi.org/10.24432/C5PC7J.

