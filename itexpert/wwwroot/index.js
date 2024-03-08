main();

async function main() {
    await updateTable();
}

async function updateTable() {
    let jsonData = await fetchData();
    let tableContainer = document.getElementById('codevaluepairs-container');
    tableContainer.innerHTML = '';
    tableContainer.appendChild(generateTable(jsonData));
}

async function fetchData() {
    try {
        let response = await fetch('ItExpert/GetCodeValuePairs');
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        console.log("GET successful");
        let jsonData = await response.json();
        return jsonData;
    }
    catch (error) {
        alert('Couldn\'t fetch the data! Check console for further information.');
        console.error('Couldn\'t fetch the data: ', error);
    };
}

function onFileChange() {
    let fileInput = document.getElementById('file-input');
    if (fileInput.files.length > 0) {
        alert(`File ${fileInput.files[0].name} selected successfully!`);
    }
}

function generateTable(jsonData) {
    let table = document.createElement('table');
    let thead = document.createElement('thead');
    let tbody = document.createElement('tbody');

    let headers = ['order', 'code', 'value'];

    let headerRow = document.createElement('tr');
    for (let headerName of headers) {
        let th = document.createElement('th');
        th.textContent = headerName;
        headerRow.appendChild(th);
    }
    thead.appendChild(headerRow);

    jsonData.forEach(function (obj) {
        let row = document.createElement('tr');
        for (let key of headers) {
            let td = document.createElement('td');
            td.textContent = obj[key];
            row.appendChild(td);
        }
        tbody.appendChild(row);
    });

    table.appendChild(thead);
    table.appendChild(tbody);
    return table;
}

function sendFile() {
    let fileInput = document.getElementById('file-input');
    let file = fileInput.files[0];

    if (file) {
        let reader = new FileReader();

        reader.onload = event => {
            let jsonData = event.target.result;
            postData(jsonData);
        }

        reader.readAsText(file);
    } else {
        alert('Please select a file.');
    }
}

async function postData(jsonData) {
    try {
        let url = 'ItExpert/PostCodeValuePairs';

        let response = await fetch(
            url,
            {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: jsonData
            }
        );

        if (response.ok) {
            console.log("POST successful");
            updateTable();
        }
        else {
            throw new Error("POST failed");
        }
    }
    catch (error) {
        alert('Couldn\'t upload file! Check console for further information.');
        console.error('Couldn\'t upload file:', error);
    }
}
