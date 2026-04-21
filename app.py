from flask import Flask, redirect, render_template, request, url_for
import mysql.connector
import time

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

@app.route('/dashboard')
def dashboard():
    return render_template('dashboard.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    con = connect_db()
    cursor = con.cursor()

    if request.method == 'POST':
        data = request.form
        u = data.get('e', '').strip()
        p = data.get('pass', '').strip()
        
        if not u or not p:
            return render_template('login.html', error="Please enter email/phone and password")
        
        # Fetch registration record
        query_reg = "SELECT registration_id, email_address, phone_number, password FROM registration WHERE email_address = %s OR phone_number = %s"
        cursor.execute(query_reg, (u, u))
        reg_record = cursor.fetchone()
        
        if reg_record and reg_record[3] == p: 
            reg_id = reg_record[0]
            if reg_id:
                return redirect(url_for('cd', reg_id=reg_id))
        
        credquery = """SELECT u.emorph, p.password FROM credentials AS c
                    JOIN usercreds AS u ON u.user_id = c.user_id
                    JOIN password AS p ON p.pass_id = c.pass_id
                    WHERE u.emorph = %s AND p.password = %s
                    """
        cursor.execute(credquery, (u, p))
        creds = cursor.fetchone()
        if creds:
                return redirect(url_for('dashboard'))
                
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

@app.route('/complete_details', methods=['GET', 'POST'])
def cd():
    con = connect_db()
    cursor = con.cursor()
    reg_id = request.args.get('reg_id') or request.form.get('reg_id')
    
    if not reg_id:
        return redirect(url_for('login'))
    
    # Fetch reg_user data for display
    cred = "SELECT email_address, phone_number FROM registration WHERE registration_id = %s"
    cursor.execute(cred, (reg_id,))
    reg_user = cursor.fetchone()
    
    if request.method == 'GET':
        if reg_user:
            u = reg_user[0] or reg_user[1]
            return render_template('complete_details.html', u=u, reg_id=reg_id, email=reg_user[0] or '', phone=reg_user[1] or '')
        return redirect(url_for('login'))
    
    else:  # POST
        data = request.form
        # Handle profile photo
        profile_photo = request.files.get('profile_photo')
        pp_path = None
        if profile_photo and profile_photo.filename:
            import os
            os.makedirs('static/uploads', exist_ok=True)
            pp_path = f"static/uploads/{profile_photo.filename}"
            profile_photo.save(pp_path)
              
        # Simple account insert (user preference)
        cursor.execute("""
            INSERT INTO accounts (account_id, first_name, last_name, middle_name, dob) 
            VALUES (%s, %s, %s, %s, %s)
        """, (reg_id, data.get('fname'), data.get('lname'), data.get('mname'), data.get('dob')))
        
        cursor.execute("SELECT account_id FROM accounts WHERE account_id = %s", (reg_id,))
        newid = cursor.fetchone()[0]
        
        # Add contacts for email if not exists
        if reg_user[0]:  # email exists in registration
                cursor.execute(
                    "INSERT INTO contacts (account_id, email) VALUES (%s, %s)", 
                    (newid, reg_user[0])
                )
        
        # Add contacts for phone if not exists
        if reg_user[1]:
                cursor.execute(
                    "INSERT INTO contacts (account_id, phone_number) VALUES (%s, %s)", 
                    (newid, reg_user[1])
                )
        
        # Copy password to passwords table (password table has only password column, pass_id PK auto)
        cursor.execute("""
            INSERT INTO password (password) 
            SELECT password FROM registration WHERE registration_id = %s
        """, (reg_id,))
        
        # Finally delete registration record
        cursor.execute("DELETE FROM registration WHERE registration_id = %s", (reg_id,))
        con.commit()
        con.close()
        return redirect(url_for('dashboard'))

if __name__ == '__main__':
    app.run(debug=True)