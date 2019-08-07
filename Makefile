KAGGLE=kaggle
DATA_DIR=data
COMP=ieee-fraud-detection
RESULT_FILE=result.csv

download: 
	$(KAGGLE) competitions download -p $(DATA_DIR)  $(COMP)

preprocess:
	./data2bin.py

submit:
	$(KAGGLE) competitions submit $(COMP) -f $(RESULT_FILE) -m "$(MESSAGE)" 

submissions:
	$(KAGGLE) competitions submissions $(COMP)

clean:
	rm -f ./$(DATA_DIR)/*.csv.zip
