'''
	cerner_2^5_2018
	This is a service that take firstName as path variable and predicts if the name is male/female.
'''
from flask import Flask, jsonify
import nltk

def getFeatures(firstName):
    return {'last_letter': firstName.lower()[-1]}

def getGenderClassifier():
    return nltk.NaiveBayesClassifier.train([(getFeatures(firstName), gender) for (firstName, gender) in
                      [(firstName, 'male') for firstName in nltk.corpus.names.words('male.txt')]] + [(getFeatures(firstName), gender) for (firstName, gender) in
                        [(firstName, 'female') for firstName in nltk.corpus.names.words('female.txt')]])

genderClassifier = getGenderClassifier()
app = Flask(__name__)

@app.route('/<firstName>', methods=['GET'])
def genderPredictor(firstName):
    return jsonify({"status": "ok", "firstname": firstName, "gender": genderClassifier.classify(getFeatures(firstName))})

if __name__ == '__main__':
    app.run(port=5002)