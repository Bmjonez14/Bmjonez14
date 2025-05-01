const express = require('express');
const app = express();
const router = express.Router();
const path = require('path');
const { Pool } = require('pg');

// === PostgreSQL Database Configuration ===
const connectionString = 'postgres://postgres:CTI_110_WakeTech@localhost/Gradebook';
const pool = new Pool({ connectionString });

// Test database connection on startup
pool.connect((err, client, release) => {
    if (err) {
        return console.error('❌ Error acquiring client', err.stack);
    }
    client.query('SELECT NOW()', (err, result) => {
        release();
        if (err) {
            return console.error('❌ Error executing test query', err.stack);
        }
        console.log('✅ PostgreSQL connected at', result.rows[0].now);
    });
});

// === Serve Static Files ===
app.use(express.static(path.join(__dirname, 'public')));

// === Serve HTML Frontend ===
router.get('/', function(req, res) {
    res.sendFile(path.join(__dirname, 'gradebook.html'));
});

// === API Route: Get Gradebook Data ===
router.get('/api/grades', function(req, res) {
    console.log('📥 Request to /api/grades received');
    
    const query = `
        SELECT Students.student_id, first_name, last_name, AVG(assignments.grade) AS total_grade
        FROM Students
        LEFT JOIN Assignments ON Assignments.student_id = Students.student_id
        GROUP BY Students.student_id
        ORDER BY total_grade DESC
    `;

    pool.query(query, [], (err, result) => {
        if (err) {
            console.error('❌ Query error:', err.stack);
            return res.status(500).json({ error: 'Database query failed' });
        }

        console.log(`✅ Retrieved ${result.rows.length} student records`);
        res.status(200).json(result.rows);
    });
});

// === Use Routes ===
app.use("/", router);

// === Start Server ===
const PORT = 3000;
app.listen(PORT, function() {
    console.log(`🚀 Express server running on http://localhost:${PORT}`);
    console.log("To quit, press CTRL + C");
});
