

FROM interest_rate_docker

WORKDIR /app

ADD . /app

RUN apt-get update     && apt-get install -y libgomp1     && apt-get clean

RUN pip install -r requirements.txt

EXPOSE 8000

CMD ["uvicorn", "Pipeline(memory=Memory(location=None),
         steps=[('numerical_imputer',
                 TransformerWrapper(include=['Number_Trades_24_Months',
                                             'Annual_Income', 'Total_Open_Buy',
                                             'Number_Delinquent_2_Years',
                                             'Delinquent_Amount',
                                             'Debt_To_Income_Ratio',
                                             'Employment_Length_In_Years',
                                             'Loan_Amount', 'Risk_Score',
                                             'Inquiries_6_Months',
                                             'Mortgage_Accounts', 'Open_Trades',
                                             'Revolving_Acco...
                              feature_types=None, gamma=None, grow_policy=None,
                              importance_type=None,
                              interaction_constraints=None, learning_rate=0.15,
                              max_bin=None, max_cat_threshold=None,
                              max_cat_to_onehot=None, max_delta_step=None,
                              max_depth=7, max_leaves=None, min_child_weight=3,
                              missing=nan, monotone_constraints=None,
                              multi_strategy=None, n_estimators=290, n_jobs=-1,
                              num_parallel_tree=None, random_state=123, ...))]):app", "--host", "0.0.0.0", "--port", "8000"]

