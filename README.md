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
- PIPENV - Python package which helps in creating a virtual environment and manage dependencies.  

# How to use.
- Clone the Repository
- Create a virtual environment (recommended but not compulsory) 
- Make sure you are in the Repository folder. 
- Run ``pipenv install`` to install all packages as per the dependencies required for this project. 
- Use ``pipenv run predict.py`` to run the app locally and then can check the prediction on the given dictionary of variables and values using ``pipenv run predict_test.py``


# Docker:

## To use the already created image and run on local machine:

#### **Download the image running following command on anaconda promt or terminal (MAC or Linux)**
- ``docker pull snikhil17/cricket_win_prediction``
#### **Use following command on anaconda promt or terminal (MAC or Linux) to run the image locally i.e. to run the application (we are using Flask and waitress to serve the app).**
- ``docker run -it --rm -p 9696:9696 snikhil17/cricket_win_prediction``
#### **Open another anaconda promt or terminal (MAC or Linux) and navigate to the same location as above and then use following command to get the results as per the variables specified in ``predict_test.py``**
- ``python predict_test.py``

### If you choose to build a docker file locally instead, here are the steps to do so:
- This allows us to install python, run pipenv and its dependencies, run our predict script and our model itself and deploys our model using Flask/gunicorn.

- Create a Dockerfile as such:
  - ``FROM python:3.8.12-slim``
  - ``RUN pip --no-cache-dir install pipenv``
  - ``WORKDIR /app``
  - ``COPY . /app``
  - ``RUN pipenv install --deploy --system``
  - ``EXPOSE 9696``
  - ``ENTRYPOINT ["waitress-serve", "--listen=0.0.0.0:9696", "predict:app"]``

### Similarly, you can just use the dockerfile in this repository.
- Build the Docker Container with (can use custom name):
  - ``docker build -t cricket_win_prediction .``
- Run the Docker container with (use the same name as which you mentioned above):
  - ``Docker run -it -p 9696:9696 cricket_win_prediction``
- Now open another terminal (navigate to same folder as above) and now we can use our model through
  - ``python predict_test.py``



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





 
 


