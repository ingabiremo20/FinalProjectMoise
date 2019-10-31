function validateName(x) {
    // Validation rule
    var re = /^\b(?:[A-Z]\w+\b(?:\s*)?)+$/;
    // Check input
    if (re.test(document.getElementById(x).value)) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
function validatePlace(x) {
    // Validation rule
    var re = /^\b(?:[A-Z]\w+\b(?:\s*)?)+$/;
    // Check input
    if (re.test(document.getElementById(x).value)) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
// Validate email
function validateEmail(x) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // Check input
    if (re.test(document.getElementById(x).value)) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
function validatePhone(x) {
    var re = /^\d{10}$/;

    // Check input
    if (re.test(document.getElementById(x).value)) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
function validatePassword(x) {
    //var passid = document.registration.passid;
   // var passid_len = password.value.length;
   // if (passid_len == 0 || passid_len >= my || passid_len < mx)
        var re = /^[A-Za-z]\w{7,14}$/;

        // Check input
        if (re.test(document.getElementById(x).value)) {
            // Style green
            document.getElementById(x).style.background = '';
            // Hide error prompt
            document.getElementById(x + 'Error').style.display = "none";
            return true;
        } else {
            // Style red
            document.getElementById(x).style.background = 'whitesmoke';
            // Show error prompt
            document.getElementById(x + 'Error').style.display = "block";
            return false;
        }
}
function validateactivitendDate(x) {
    //var passid = document.registration.passid;
   // var passid_len = password.value.length;
   // if (passid_len == 0 || passid_len >= my || passid_len < mx)
        var re = /(?:0[1-9]|[12][0-9]|3[01])\/(?:0[1-9]|1[0-2])\/(?:19|20\d{2})/;

        // Check input
        if (re.test(document.getElementById(x).value)) {
            // Style green
            document.getElementById(x).style.background = '';
            // Hide error prompt
            document.getElementById(x + 'Error').style.display = "none";
            return true;
        } else {
            // Style red
            document.getElementById(x).style.background = 'whitesmoke';
            // Show error prompt
            document.getElementById(x + 'Error').style.display = "block";
            return false;
        }
}
function validateactivitbigDate(x) {
    //var passid = document.registration.passid;
   // var passid_len = password.value.length;
   // if (passid_len == 0 || passid_len >= my || passid_len < mx)
        var re = /(?:0[1-9]|[12][0-9]|3[01])\/(?:0[1-9]|1[0-2])\/(?:19|20\d{2})/;

        // Check input
        if (re.test(document.getElementById(x).value)) {
            // Style green
            document.getElementById(x).style.background = '';
            // Hide error prompt
            document.getElementById(x + 'Error').style.display = "none";
            return true;
        } else {
            // Style red
            document.getElementById(x).style.background = 'whitesmoke';
            // Show error prompt
            document.getElementById(x + 'Error').style.display = "block";
            return false;
        }
}
function validatebigdate(x) {
    //var passid = document.registration.passid;
   // var passid_len = password.value.length;
   // if (passid_len == 0 || passid_len >= my || passid_len < mx)
        var re = /(?:0[1-9]|[12][0-9]|3[01])\/(?:0[1-9]|1[0-2])\/(?:19|20\d{2})/;

        // Check input
        if (re.test(document.getElementById(x).value)) {
            // Style green
            document.getElementById(x).style.background = '';
            // Hide error prompt
            document.getElementById(x + 'Error').style.display = "none";
            return true;
        } else {
            // Style red
            document.getElementById(x).style.background = 'whitesmoke';
            // Show error prompt
            document.getElementById(x + 'Error').style.display = "block";
            return false;
        }
}
function validateenddate(x) {
    //var passid = document.registration.passid;
   // var passid_len = password.value.length;
   // if (passid_len == 0 || passid_len >= my || passid_len < mx)
        var re = /(?:0[1-9]|[12][0-9]|3[01])\/(?:0[1-9]|1[0-2])\/(?:19|20\d{2})/;

        // Check input
        if (re.test(document.getElementById(x).value)) {
            // Style green
            document.getElementById(x).style.background = '';
            // Hide error prompt
            document.getElementById(x + 'Error').style.display = "none";
            return true;
        } else {
            // Style red
            document.getElementById(x).style.background = 'whitesmoke';
            // Show error prompt
            document.getElementById(x + 'Error').style.display = "block";
            return false;
        }
}
function validateSelectBranch(x) {
    //var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // Check input
    if (document.getElementById(x).selectedIndex !== 0) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
function validateSelectActivityName(x) {
    //var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // Check input
    if (document.getElementById(x).selectedIndex !== 0) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
function validateSelectDepart(x) {
    //var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // Check input
    if (document.getElementById(x).selectedIndex !== 0) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
function validateSelectCategory(x) {
    //var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // Check input
    if (document.getElementById(x).selectedIndex !== 0) {
        // Style green
        document.getElementById(x).style.background = '';
        // Hide error prompt
        document.getElementById(x + 'Error').style.display = "none";
        return true;
    } else {
        // Style red
        document.getElementById(x).style.background = 'whitesmoke';
        // Show error prompt
        document.getElementById(x + 'Error').style.display = "block";
        return false;
    }
}
// Validate Select boxes

function validateRadio(x) {
    if (document.getElementById(x).checked) {
        return true;
    } else {
        return false;
    }
}
function validateCheckbox(x) {
    if (document.getElementById(x).checked) {
        return true;
    }
    return false;
}
function validateForm() {
    // Set error catcher
    var error = 0;
    // Check name
    if (!validateName('names')) {
        document.getElementById('namesError').style.display = "block";
        error++;
    }
    if (!validatePlace('place')) {
        document.getElementById('placeError').style.display = "block";
        error++;
    }
    if (!validatePhone('memberphone')) {
        document.getElementById('memberphoneError').style.display = "block";
        error++;
    }
    if (!validatePassword('password')) {
        document.getElementById('passwordError').style.display = "block";
        error++;
    }
    if (!validateactivitbigDate('activitbigDate')) {
        document.getElementById('activitbigDateError').style.display = "block";
        error++;
    }
    if (!validateactivitendDate('activitendDate')) {
        document.getElementById('activitendDateError').style.display = "block";
        error++;
    }
    if (!validateenddate('enddate')) {
        document.getElementById('enddateError').style.display = "block";
        error++;
    }
    if (!validatebigdate('bigdate')) {
        document.getElementById('bigdateError').style.display = "block";
        error++;
    }
    // Validate email
    if (!validateEmail('emails')) {
        document.getElementById('emailsError').style.display = "block";
        error++;
    }
    // Validate animal dropdown box
    if (!validateSelectBranch('branchid')) {
        document.getElementById('branchidError').style.display = "block";
        error++;
    }
    if (!validateSelectActivityName('activitname')) {
        document.getElementById('activitnameError').style.display = "block";
        error++;
    }
    if (!validateSelectDepart('departmentid')) {
        document.getElementById('departmentidError').style.display = "block";
        error++;
    }
    if (!validateSelectCategory('categoryid')) {
        document.getElementById('categoryidError').style.display = "block";
        error++;
    }
    // Validate Radio
    if (validateRadio('left')) {

    } else if (validateRadio('right')) {

    } else {
        document.getElementById('handError').style.display = "block";
        error++;
    }
    if (!validateCheckbox('accept')) {
        document.getElementById('termsError').style.display = "block";
        error++;
    }
    // Don't submit form if there are errors
    if (error > 0) {
        return false;
    }
}