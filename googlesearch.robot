* Test Cases *
LoginTest
    open browser  https://dem.nopcommerce.com/   chrome
    click link  xpath://a[contains(text(),'Log in')]
    input text  id:Email  saidarao210@gmail.com
    input text  id:Password  India@123
    click element  xpath://body/div[6]/div[3]/div[1]/div[1]/div[1]/div[2]/div[1]/div[2]/form[1]/div[3]/input[1]
    close browser



* Keywords *


