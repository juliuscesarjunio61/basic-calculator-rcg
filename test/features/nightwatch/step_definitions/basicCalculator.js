const {Given, Then} = require('@cucumber/cucumber');
const reader = require('xlsx');

Given(/^I navigate to "(.*?)"$/, (calculatorUrl) => {
    return browser.navigateTo(calculatorUrl);
});

Then(/^the homepage is displayed$/, () => {
    return browser.isVisible({
        selector: '#page-top',
        suppressNotFoundErrors: true
    });
});

Then(/^I select "(.*?)" in the build dropdown list$/, (build) => {
    return browser
        .useXpath()
        .click('//select[@id="selectBuild"]')
        .click(`//option[text()="${build}"]`)
});

Then(/^I enter "(.*?)" in the first number textfield$/, (firstNumber) => {
    return browser
    .useXpath()
    .clearValue('//input[@id="number1Field"]')
    .setValue('//input[@id="number1Field"]', firstNumber)
});

Then(/^I enter "(.*?)" in the second number textfield$/, (secondNumber) => {
    return browser
    .useXpath()
    .clearValue('//input[@id="number2Field"]')
    .setValue('//input[@id="number2Field"]', secondNumber)
});

Then(/^I select "(.*?)" in the operations dropwdown list$/, (operator) => {
    return browser
        .useXpath()
        .click('//select[@id="selectOperationDropdown"]')
        .click(`//option[text()="${operator}"]`)
});

Then(/^I click the calculate button$/, () => {
    return browser
        .useXpath()
        .click('//input[@id="calculateButton"]')
});

Then(/^I click the clear button$/, () => {
    return browser
        .useXpath()
        .pause(2000)
        .moveToElement('//input[@id="clearButton"]', 10, 10)
        .click('//input[@id="clearButton"]')
});

Then(/^error message for number "(.*?)" is displayed$/, (number) => {
    return browser
        .useXpath()
        .isVisible('//label[@id="errorMsgField"]')
        .assert.textContains('//label[@id="errorMsgField"]', `Number ${number} is not a number`)
        .pause(2000)
});

Then(/^the answer is correct as "(.*?)" for "(.*?)" operation of "(.*?)" and "(.*?)"$/, (numType, operator, num1, num2) => {
    let output;
    if(numType === 'integer') {
        browser
        .useXpath()
        .click('//input[@id="integerSelect"]')
    }
    if(operator) {
        if(operator === 'Add') {
            output = +num1 + +num2
        }
        if(operator === 'Subtract') {
            output = +num1 - +num2
        }
        if(operator === 'Multiply') {
            output = +num1 * +num2
        }
        if(operator === 'Divide') {
            output = +num1 / +num2
        }
        newOutput = numType === 'integer' ? Math.floor(output) : output
        browser
        .useXpath()
        .getValue('//input[@id="numberAnswerField"]', function(result){
            let resValue = numType === 'integer' ? Math.floor(+result.value) : +result.value
            if(newOutput === resValue){
                browser
                .useXpath()
                .pause(5000)
                .moveToElement('//input[@id="clearButton"]', 10, 10)
                .click('//input[@id="clearButton"]')
                console.log('Correct Answer!!!')
            } else {
                throw new Error("Incorrect Answer!!")
            }
        })
    }
    return browser
        .pause(2000) 
});

Then(/^the answer is correct for concatenation of "(.*?)" and "(.*?)"$/, (num1, num2) => {
    let output = num1 + num2;
    browser
    .useXpath()
    .getValue('//input[@id="numberAnswerField"]', function(result){
        if(output === result.value){
            browser
            .useXpath()
            .pause(5000)
            console.log('Correct Answer!!!')
        } else {
            throw new Error("Incorrect Answer!!")
        }
    })
    return browser
        .pause(5000) 
});

Then(/^the integer checkbox is not displayed$/, () => {
    return browser
        .useXpath()
        .expect.element('//input[@id="integerSelect"]').to.not.be.visible
});

Then(/^the integer checkbox is enabled$/, () => {
    return browser
        .useXpath()
        .assert.attributeEquals('//input[@id="integerSelect"]', 'disabled', null)
});

//This will get the test data from excel file
//The problem is I'm not able to pass these data in the data set of the feature file
// const file = reader.readFile('./sampleData.xlsx');
//     const sheets = file.SheetNames;
//     let data = [];
//     for(let i = 0; i < sheets.length; i++) {
//         const temp = reader.utils.sheet_to_json(
//             file.Sheets[file.SheetNames[i]], {header: "A"}
//         )
//         temp.forEach((res) => {
//             data.push(res)
//         })
//     }