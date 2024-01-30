<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>New User Registration</title>
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }

        .container {
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2><u>New User Registration</u></h2>

        <form id="registrationForm" action="processNewUser.jsp" method="post" onsubmit="submitForm(); return false;">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="rollNumber">Roll Number:</label>
                    <input type="text" class="form-control" id="rollNumber" name="rollNumber" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="age">Age:</label>
                    <input type="number" class="form-control" id="age" name="age" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="department">Department:</label>
                    <input type="text" class="form-control" id="department" name="department" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="college">College:</label>
                    <input type="text" class="form-control" id="college" name="college" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="address">Address:</label>
                    <input type="text" class="form-control" id="address" name="address" required>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <body>

      
        <div class="container mt-4">
            <h3>Entered Data</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Roll Number</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Department</th>
                        <th>College</th>
                        <th>Address</th>
                        <th>Action</th> <!-- New columns for Modify and Delete buttons -->
                    </tr>
                </thead>
                <tbody id="userDataBody">
                    <!-- This is where the dynamically added rows will go -->
                </tbody>
            </table>
        </div>
    
        <script>
            // Function to handle form submission
            function submitForm() {
                // Get form data
                var rollNumber = document.getElementById('rollNumber').value;
                var name = document.getElementById('name').value;
                var age = document.getElementById('age').value;
                var department = document.getElementById('department').value;
                var college = document.getElementById('college').value;
                var address = document.getElementById('address').value;
    
                // Check if it's a modification or a new entry
                var isModification = false;
                var modifiedRow = null;
    
                // Iterate through existing rows to check for modification
                var tableBody = document.getElementById('userDataBody');
                for (var i = 0; i < tableBody.rows.length; i++) {
                    if (tableBody.rows[i].cells[1].innerHTML === rollNumber) {
                        isModification = true;
                        modifiedRow = tableBody.rows[i];
                        break;
                    }
                }
    
                if (isModification) {
                    // Update existing row without changing the S.No
                    modifiedRow.cells[2].innerHTML = name;
                    modifiedRow.cells[3].innerHTML = age;
                    modifiedRow.cells[4].innerHTML = department;
                    modifiedRow.cells[5].innerHTML = college;
                    modifiedRow.cells[6].innerHTML = address;
                } else {
                    // Add new row with auto-incrementing S.No
                    var serialNumber = tableBody.rows.length + 1;
                    var newRow = tableBody.insertRow(tableBody.rows.length);
                    newRow.insertCell(0).innerHTML = serialNumber;
                    newRow.insertCell(1).innerHTML = rollNumber;
                    newRow.insertCell(2).innerHTML = name;
                    newRow.insertCell(3).innerHTML = age;
                    newRow.insertCell(4).innerHTML = department;
                    newRow.insertCell(5).innerHTML = college;
                    newRow.insertCell(6).innerHTML = address;
                    newRow.insertCell(7).innerHTML = '<button onclick="modifyRow(this)" class="btn btn-warning">Modify</button>' +
                                                    '<button onclick="deleteRow(this)" class="btn btn-danger ml-2">Delete</button>';
                }
    
                // Clear form fields after submission
                document.getElementById('registrationForm').reset();
            }
    
            // Function to handle modifying a row
            function modifyRow(button) {
                var row = button.parentNode.parentNode;
                var cells = row.cells;
    
                // Populate form fields with existing data
                document.getElementById('rollNumber').value = cells[1].innerHTML;
                document.getElementById('name').value = cells[2].innerHTML;
                document.getElementById('age').value = cells[3].innerHTML;
                document.getElementById('department').value = cells[4].innerHTML;
                document.getElementById('college').value = cells[5].innerHTML;
                document.getElementById('address').value = cells[6].innerHTML;
    
                // Remove the row from the table
                row.parentNode.removeChild(row);
            }
    
            // Function to handle deleting a row
            function deleteRow(button) {
                var row = button.parentNode.parentNode;
                row.parentNode.removeChild(row);
            }
        </script>
    
        <!-- Bootstrap JS and dependencies (you may include these at the end of the body section) -->
        <!-- Include Bootstrap and other scripts here -->
    </body>
    

    <!-- Bootstrap JS and dependencies (you may include these at the end of the body section) -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>
