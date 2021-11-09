# Mid-Term-Project-Zoomcamp
This repo contains the work completed as part of the Mid Term project for the course ML Zoomcamp, conducted by Alexey Grigorev. 
You can take this free course. Links to course mentioned below:
- https://datatalks.club/courses/2021-winter-ml-zoomcamp.html
- https://github.com/alexeygrigorev/mlbookcamp-code/tree/master/course-zoomcamp

## About the Project 
### **Problem Statement:**

- The major objective of this project is to extract actionable insights from the historical match data and make strategic changes to make India win. 
- Primary objective is to create Machine Learning models which correctly predicts a win for the Indian Cricket Team. 
- Once a model is developed then you have to extract actionable insights and recommendation. Also, below are the details of the next 10 matches, India is going to play. You have to predict the result of the matches.
- This is binary classification problem, where depending on the features given we will predict the probability of India winning.

## Sports_Data_Analysis.ipynb.ipynb File Explained:
### Notebook is extensively explained for the steps described below:
- Loading Libraries
- Loading data
- Exploratory Data Analysis (EDA)
  - Missing Values Treatment
  - Outliers Treatment
  - Discrepencies in Data
  - Visualizing the impact of the various features w.r.t target variable.
- Feature Engineering
  - One Hot Encoding (OHE)
- Hypertuning the models 
  - Used Optuna for hypertuning the models
   - Link for understanding Optuna in nutshell: https://www.youtube.com/watch?v=m5YSKPMjkrk&list=PL98nY_tJQXZnP-k3qCDd1hljVSciDV9_N&index=22
- Trained XGBoost and Random Forest and selected the best of the both i.e. Random Forest.
- Evaluation Matrix selected is roc_auc score. But have mentioned classification report with each model in the notebook for reference.
- ``Feature Importance`` is also explained with each model with visualization for refrence 
- requirements.txt - Python package dependencies file. Should be used to install packages required for this project. 



## train_xgb.py 
- This was the first model which was not selected as Random Forest gave the better results.

![image](https://user-images.githubusercontent.com/80937106/139857571-42f1cfa4-4dbf-417e-8479-777b2f2810e5.png)
 
## Prediction on Jupyter Notebook
![image](https://user-images.githubusercontent.com/80937106/139857683-b7580843-f8b9-46a1-838d-78a01c1ec3ec.png)

## Using ``Waitress`` for deployment
![image](https://user-images.githubusercontent.com/80937106/139857735-28264a63-9e6e-484d-921a-75da46dd378a.png)


## Checked the results by running the predict.py file in anaconda prompt 
![image](https://user-images.githubusercontent.com/80937106/139857778-567065e4-9a74-4b74-b07d-3450f1ec5829.png)

# How to use.
## Clone the Repository
![image](https://user-images.githubusercontent.com/80937106/139857803-1d4f2de3-033b-444e-a4da-9c58d2c277aa.png)
### This repository doesnt have model_rf.bin in this as the model trained was 180 mb. to use predict.py to check things we need to run train_rf.py so that we create the model_rf.bin.

## Loaded the Model using train_rf.py file
![image](https://user-images.githubusercontent.com/80937106/139857842-87283b62-2abb-44e3-a74c-e6777ba712fb.png)

## Use ``predict.py`` to run the app and then can check the prediction on the given dictionary of variables and values using ``python predict-test.py``


# Docker:
If you choose to build a docker file locally instead, here are the steps to do so:

- Create a Dockerfile as such:

``FROM python:3.8.12-slim``

``LABEL maintainer="Nikhil Shrestha"``

``ENV PYTHONUNBUFFERED=TRUE``

``RUN pip --no-cache-dir install pipenv``

``WORKDIR /app``

``COPY ["Pipfile", "Pipfile.lock", "./"]``

``RUN set -ex && pipenv install --deploy --system``

``COPY ["predict.py", "model_rf.bin", "./"]``

``EXPOSE 9696``

``ENTRYPOINT ["gunicorn", "--bind=0.0.0.0:9696", "predict:app"]``

- This allows us to install python, run pipenv and its dependencies, run our predict script and our model itself and deploys our model using Flask/gunicorn.

Similarly, you can just use the dockerfile in this repository.

- Build the Docker Container with :

``docker build -t midtermproject_nick .``

- Run the Docker container with:

``Docker run -it -p 9696:9696 midtermproject_nick``

- Now we can use our model through

``python predict_test.py``



# Virtual environment and package dependencies

- To ensure all scripts work fine and libraries used during development are the ones which you use during your deployment/testing, Python venv has been used to manage virtual environment and package dependencies. Follow the below steps to setup this up in your environment.

- The steps to install Python venv will depend on the Operating system you have. Below steps have been provided in reference to installation on Ubuntu, however you can refer to Official documentation at https://docs.python.org/3/tutorial/venv.html to know appropriate steps for your OS.

- Install pip3 and venv if not installed (below sample commands to be used on Ubuntu hav been provided

``sudo apt install -y python3-pip python3-venv``

- Create a virtual environment. Below command creates a virtual environment named mlzoomcamp

``python3 -m venv mlzoomcamp``

- Activate the virtual environment.

``. ./mlzoomcamp/bin/activate``

- Clone this repo

``git clone https://github.com/snikhil17/Mid-Term-Project-Zoomcamp.git``

- Change to the directory that has the required files

``cd mlzoomcamp-midterm-project/``

- Install packages required for this project

``pip install -r requirements.txt``





 
 


