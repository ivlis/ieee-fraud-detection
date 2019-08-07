KAGGLE=kaggle
DATA_DIR=data
COMP=ieee-fraud-detection
RESULT_FILE=result.csv

download: 
	$(KAGGLE) competitions download -p $(DATA_DIR)  $(COMP)

submit:
	$(KAGGLE) competitions submit $(COMP) -f $(RESULT_FILE) -m "$(MESSAGE)" 

clean:
	rm -f ./$(DATA_DIR)/*.csv.zip
