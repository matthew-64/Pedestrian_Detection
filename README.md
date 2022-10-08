# Introduction

Through a series of preprocessing image data, dimensionality reduction, and hyper paramater optomisations on machine learning models, a pedestrian detector was created with the following results:
- Overall Accuracy 0.6881
- Recall 0.5702
- Precision 0.7093
- F Measure 0.6322

Please see the youtube video below.


**For the full report on the training, testing, results, analysis and conclusions, please see [`report.pdf`](./report.pdf)**

### Resulting Pedestrian detection

[![Alt text](./readme_resources/demo_thumbnail.png?raw=true "Title")](https://youtu.be/1pGwMrYjyYQ)

# Topics covered in [`report.pdf`](./report.pdf)

**Training**
- Preprocessing Overview
  - Histogram Equalisation
  - Power Law
  - Linear Stretching
  - Feature Extraction using Histogram of Gradients
- Dimensionality Reduction using PCA and LDA
- Potential Learning Model Candidates - SVM, RF & NN/KNN
- Hyperparameter Optimisations
- Pretesting Formulation of Hypothesis

**Testing**

- Testing Overview
  - Hold-Out
  - K-Fold
- Quantitative Analysis of Cross-Validation Results
  - ROC graphs for models
- Post-testing Evaluation of Hypothesis
- Chosen Method

**Detection**

- Sliding Window
- Non-Maxima Suppression
- Visual Analysis of Detection Results
- Quantitative Analysis of Detection Results vs Ground Truth

**Conclusion**
