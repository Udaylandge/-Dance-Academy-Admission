function validateForm() {
    let name = document.getElementById("name").value.trim();
    let style = document.getElementById("style").value;
    let fee = document.getElementById("monthly_fee").value;
    let level = document.querySelector('input[name="level"]:checked');
    if (name === "") {
        alert("Enter your name");
        return false;
    }
    if (name.length > 40) {
        alert("Name must be in 40 charcters");
        return false;
    }
    if (style === "") {
        alert("Select Dance Style");
        return false;
    }
    if (fee === "" || Number(fee) <= 0) {
        alert("Please enter a valid monthly fee");
        return false;
    }
    return true;
}