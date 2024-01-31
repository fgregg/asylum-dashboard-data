.PHONY : all
all : data/housing_census.csv data/movement_to_date.csv

data/housing_census.csv :
	wget -O $@ "https://docs.google.com/spreadsheets/d/e/2PACX-1vS1mJPaYOGURV6AjYOMEAAS03vAa3ZUpgKeS8UJHV_3xcx141VSTX3MRnHXp_Y7TeD9jFJF4iCHjXYI/pub?output=csv&gid=0"

data/movement_to_date.csv :
	wget -O $@ "https://docs.google.com/spreadsheets/d/e/2PACX-1vS1mJPaYOGURV6AjYOMEAAS03vAa3ZUpgKeS8UJHV_3xcx141VSTX3MRnHXp_Y7TeD9jFJF4iCHjXYI/pub?output=csv&gid=1910089974"
