CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo "file found"
else
    echo "file not found"
    exit
fi

cp student-submission/ListExamples.java TestListExamples.java grading-area
cp -r lib grading-area

cd grading-area
javac -cp $CPATH *.java

if [[ $? -eq 0 ]];
then
    echo "compilation successfull"
else 
    echo "compilation was not succesfull"
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples\ > junit-output.txt
$(cat junit-output.txt | tail -n 2 | head -n 1) > filtered.txt
grep -o "/." filtered.text.txt > dots.txt
lastline=$(cat junit-output.txt | tail -n 2 | head -n 1)
tests=$(echo $lastline | awk -F'[, ]' '{print $3}')
failures=$(echo $lastline | awk -F'[, ]' '{print $6}')
successes=$((tests - failures))

echo "Your score is $successes / $tests"



# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
