// TODO: Fetch data from the PostgreSQL database (to be implemented later)
function fetchGradeData() {
    // This function will query the PostgreSQL database and return grade data
    console.log("Fetching grade data...");
    // Create a new request for HTTP data
    let xhr = new XMLHttpRequest();
    // This is the address on the machine we're asking for data
    let apiRoute = "/api/grades";
    // When the request changes status, we run this anonymous function
    xhr.onreadystatechange = function () {
        let results;
        // check if we're done
        if (xhr.readyState === xhr.DONE) {
            // check if we're successful
            if (xhr.status !== 200) {
                console.error(`Could not get grades.
                     Status: ${xhr.status}`);
            }
            // And the call the function to update the HTML with our data
            populateGradebook(JSON.parse(xhr.responseText));
        }
    }.bind(this);
    xhr.open("GET", apiRoute, true);
    xhr.send();
}


// TODO: Populate the table with grade data
function populateGradebook(data) {
    // This function will take the fetched grade data and populate the table
    console.log("Populating gradebook with data:", data);
    let tableElm = document.getElementById("Gradebook");// Get the gradebook table element
       data.forEach(function(assignment){ // For each roll of data we're passed in
        let row = document.createElement("tr"); // Create a new table row element
        let columns =[]; // Handy place to stick the columns of information
        columns.name = document.createElement("td"); // The first column's table data will be the name
        // concatenate the full name: "last_name, first_name"
        columns.name.appendChild(
            document.createTextNode(assignment.last_name + ", " + assignment.first_name)
        );
        columns.grade = document.createElement("td"); // second column will be the grade
        columns.grade.appendChild(
            // Just put the name in text, you could be fancy and figure out the letter grade here
            // with either a bunch of conditions, or a JavaScript  "switch" statement
            document.createTextNode(assignment.total_grade)
        );
        // Add the table data columns to the table row
        row.appendChild(columns.name); // Append the name column to the row
        row.appendChild(columns.grade); // Append the grade column to the row
        // Add the table data columns to the table row
            tableElm.appendChild(row); // Append the row to the table
        });
    }
    fetchGradeData()
