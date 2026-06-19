##
# This module defines a class that models exam questions.
## A question with a text and an answer.
class Question :
## Constructs a question with empty question and answer strings.
    def __init__(self) :
        self._text = ""
        self._answer = ""
## Sets the question text.
# @param questionText the text of this question
    def setText(self, questionText) :
        self._text = questionText
    #def __repr__(self) :
        #return "Question[%s, %s]" % (self._text, self._answer)
## Sets the answer for this question.
# @param correctResponse the answer
    def setAnswer(self, correctResponse) :
        self._answer = correctResponse
## Checks a given response for correctness.
# @param response the response to check
# @return True if the response was correct, False otherwise
#
    def checkAnswer(self, response) :
        return response == self._answer
## Displays this question.
#
    def display(self) :
        print(self._text)
# Create the question and expected answer.
q = Question()
print("Created object:", q)
q.setText("Who is the inventor of Python?")
print("Added the text:", q)
q.setAnswer("Guido van Rossum")
print("Added the answer:", q)
# Display the question and obtain user’s response.
q.display()
response = input("Your answer: ")
print(q.checkAnswer(response))


