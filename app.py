from flask import Flask, redirect, render_template, request, url_for
import mysql.connector

app =Flask(__name__)

def connect_db():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",
        database="actbayan"
    )

@app.route('/')
def home():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    con = connect_db()
    cursor = con.cursor()

    query = "SELECT email_address, phone_number, password FROM registration"

    cursor.execute(query)
    users = cursor.fetchall()

    data = request.form

    u = data.get('e', '').strip()
    p = data.get('pass', '').strip()

    if request.method == 'POST':
        for email, phone, password in users:
            if (u == email or u == phone) and p == password:
                return render_template('dashboard.html', user=u)
        return render_template('login.html', error="Invalid credentials")
    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        con = connect_db()
        cursor = con.cursor()
        data = request.form

        email = data.get('e', '').strip()
        phone = data.get('pn', '').strip()
        password = data.get('pass')
        conpass = data.get('conpass')

        if password != conpass:
            return render_template('register.html', error="Passwords do not match")

        if email:
            query = """
                INSERT INTO registration (email_address, password)
                VALUES (%s, %s)
            """
            values = (email, password)

        elif phone:
            query = """
                INSERT INTO registration (phone_number, password)
                VALUES (%s, %s)
            """
            values = (phone, password)

        else:
            return render_template('register.html', error="Enter email or phone number")

        cursor.execute(query, values)
        con.commit()

        return redirect(url_for('login'))

    return render_template('register.html')

if __name__ == '__main__':
    app.run(debug=True)