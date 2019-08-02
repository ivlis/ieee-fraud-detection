KAGGLE=kaggle
DATA_DIR=data
COMP=ieee-fraud-detection

download: 
	$(KAGGLE) competitions download -p $(DATA_DIR)  $(COMP)

clean:
	rm -f ./$(DATA_DIR)/*.csv.zip
