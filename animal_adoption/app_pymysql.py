# from crypt import methods
from socket import MsgFlag
from unicodedata import name
from flask import Flask, render_template, request, session, url_for, redirect, jsonify,send_from_directory,flash
import pymysql
import numpy as np
import pandas as pd
import time
import os
from werkzeug.utils import secure_filename
from flask import Flask, render_template, Response
from flask_mail import Mail
from flask_mail import Message

#import imutils
UPLOAD_FOLDER = 'static/user_upload/'

app = Flask(__name__)
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
app.secret_key = 'random string'
# config
app.config['MAIL_SERVER'] = 'smtp.gmail.com'
app.config['MAIL_PORT'] = 465
app.config['MAIL_USE_TLS'] = False
app.config['MAIL_USE_SSL'] = True
app.config['MAIL_USERNAME'] = 'abc@gmail.com'
app.config['MAIL_PASSWORD'] = 'abc123'
app.config['MAIL_DEFAULT_SENDER'] = 'email@email.com'

mail = Mail(app)

def sendmail():
    # email = "yashsalvi1999@gmail.com"
    msg = Message('Hello user someone need this breed to adopt please check attached document!',
            recipients=["abc@gmail.com"])
    msg.body = 'Share'

    with app.open_resource("adopt.csv") as fp:
        msg.attach("adopt.csv", "text/csv", fp.read())
    mail.send(msg)

global nam
global feat
global img
global nam1
global feat1
global img1

def dbConnection():
    try:
        connection = pymysql.connect(host="localhost", user="root", password="root", database="petadopt")
        return connection
    except:
        print("Something went wrong in database Connection")


def dbClose():
    try:
        dbConnection().close()
    except:
        print("Something went wrong in Close DB Connection")



@app.route('/index')
def index():
    return render_template('index.html')

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/adopt', methods=["GET","POST"])
def adopt():
    if request.method=="POST":
        bred_name = request.form.get("breed_name")
        uname = session.get("user")
        con = dbConnection()
        cursor = con.cursor()
        cursor.execute('SELECT * FROM dog Where breed_name=%s',(bred_name))
        result = cursor.fetchone()
        result = list(result)

        cursor.execute('SELECT * FROM petinfo Where fname=%s',(uname))
        res = cursor.fetchone()
        res = list(res)
        ffname = res[1]
        lname = res[2]
        adoptpet = res[3]
        email = res[4]
        phone = res[5]
        address = res[6]
        anypet = res[7]
        PetName_s = res[8]
        PetBreed_s = res[9]
        disposition = res[10]
        veterinarian_num = res[11]
        renthome = res[12]
        yard = res[13]
        ifyes = res[14]
        petpolicy = res[15]
        ifrent = res[16]
        lownokill = res[17]
        child = res[18]
        ifchildyes = res[19]
        hrsperday = res[20]
        crate = res[21]
        emergently = res[22]
        behaveissue = res[23]
        referencesnumber = res[24]
        crate2 = res[25]
        detaileddescription = res[26]
        Signature = res[27]

        data_dict = {"ffname":ffname, "lname":lname,"adoptpet":adoptpet,"email":email, "phone":phone,"address":address,"anypet":anypet,"PetName_s":PetName_s,"PetBreed_s":PetBreed_s,"disposition":disposition,"veterinarian_num":veterinarian_num,"renthome":renthome,"yard":yard,"ifyes":ifyes,"petpolicy":petpolicy,"ifrent":ifrent,"lownokill":lownokill,"child":child,"ifchildyes":ifchildyes,"hrsperday":hrsperday,"crate":crate,"emergently":emergently,"behaveissue":behaveissue,"referencesnumber":referencesnumber,"crate2":crate2,"detaileddescription":detaileddescription,"Signature":Signature}
        data_items = data_dict.items()
        data_list = list(data_items)

        df = pd.DataFrame(data_list)

        print(result)
        if len(result)>0:
            breed_name = result[1]
            temperment = result[2]
            img = result[3]
            description = result[4]
            height = result[5]
            weight = result[6]
            life_expectancy = result[7]
            grp = result[8]
            color_options = result[9]
            Msg = "Your request has been sent successfullt!"

            data_dict = {"breed_name":breed_name, "temperment":temperment,"img":img,"description":description, "height":height,"weight":weight,"life_expectancy":life_expectancy,"grp":grp,"color_options":color_options}
            data_items = data_dict.items()
            data_list = list(data_items)

            df1 = pd.DataFrame(data_list)

            dff = pd.concat([df,df1], axis=1)
            dff.to_csv("adopt.csv")
            sendmail()
            
            return render_template("output.html",msg=Msg)
        else:
            cursor.execute('SELECT * FROM cat Where breed_name=%s',(bred_name))
            result1 = cursor.fetchone()
            result1 = list(result1)
            print(result1)
            breed_name = result1[1]
            img = result1[2]
            description = result1[3]
            weight = result1[4]
            color_options = result1[5]
            life_expectancy = result1[6]
            characteristics = result1[7]
            personality = result1[8]
            Msg = "Your request has been sent successfullt!"

            data_dict = {"breed_name":breed_name, "image":img,"img":img,"description":description, "weight":weight,"color_options":color_options,"life_expectancy":life_expectancy,"characteristics":characteristics,"personality":personality}
            data_items = data_dict.items()
            data_list = list(data_items)

            df1 = pd.DataFrame(data_list)
            dff = pd.concat([df,df1], axis=1)
            dff.to_csv("adopt.csv")
            sendmail()
            return render_template("output.html",msg=Msg)

    return render_template('adopt.html')

@app.route('/single2')
def single2():
    product_name = request.args.get("productname")
    # print(product_name)

    con = dbConnection()
    cursor = con.cursor()
    cursor.execute('SELECT breed_name, image, description, weight, color_options, characteristics, personality FROM cat where breed_name=%s',(product_name))
    result = cursor.fetchall()
    print(result[0][3])

    breed_name = ""
    image = ""
    description = ""
    weight = ""
    color_options = result[0][4]
    characteristics = ""
    personality = ""
    
    for i in result:
        a = i[0]
        breed_name += a

        b = i[1]
        image += b

        c = i[2]
        description += c

        d = i[3]
        weight += d

        f = i[5]
        characteristics += f

        g = i[6]
        personality += g

    return render_template('single2.html', breed_name=breed_name, image=image, description=description, weight=weight, color_options=color_options, characteristics=characteristics, personality=personality)


@app.route('/single')
def single():
    product_name = request.args.get("productname")
    # print(product_name)

    con = dbConnection()
    cursor = con.cursor()
    cursor.execute('SELECT breed_name, temperment, img, description, height, weight, grp, color_options FROM dog where breed_name=%s',(product_name))
    result = cursor.fetchall()

    breed_name = ""
    temperment = ""
    img = ""
    description = ""
    height = ""
    weight = ""
    grp = ""
    color_opt = result[0][7]
    for i in result:
        a = i[0]
        breed_name += a

        b = i[1]
        temperment += b

        c = i[2]
        img += c

        d = i[3]
        description += d

        e = i[4]
        height += e

        f = i[5]
        weight += f

        g = i[6]
        grp += g

    print(breed_name, "\n",
    temperment, "\n",
    img, "\n",
    description, "\n",
    height, "\n",
    weight, "\n",
    grp, "\n")
    return render_template('single1.html', breed_name=breed_name, temperment=temperment, img=img, description=description, height=height, weight=weight, grp=grp, color_options=color_opt)


@app.route('/about')
def about():
    return render_template('about.html')

@app.route('/searchpet', methods=["GET","POST"])
def searchpet():
    if request.method=="POST":
        srchpet = request.form.get("searchpet")

        con = dbConnection()
        cursor = con.cursor()
        cursor.execute('SELECT breed_name, temperment, img FROM dog Where breed_name=%s',(srchpet))
        result = cursor.fetchone()
        result = list(result)
        print(result)
        if len(result)>0:
            nam3 = result[0]
            feat3 = result[1]
            img3 = result[2]
            Msg = "Your search result:"
            print(nam3)
            print()
            print(img3)
            return render_template("searchpet.html",msg=Msg,nam3=nam3,img3=img3)
        elif len(result)==0:
            cursor.execute('SELECT breed_name, personality, image FROM cat Where breed_name=%s',(srchpet))
            result1 = cursor.fetchone()
            print(result1)
            nam14 = result[0]
            feat14 = result[1]
            img14 = result[2]
            Msg = "Your search result:"
            return render_template("searchpet.html",msg=Msg, nam4=nam14,feat4=feat14,img4=img14)
        else:
            Msg = srchpet+" this breed is not available"
            return render_template("searchpet.html",msg=Msg)
    return render_template('searchpet.html')

@app.route('/petform', methods=["GET","POST"])
def pet_form():
    if request.method=="POST":
        fname = request.form.get("fname")
        lname = request.form.get("lname")
        adoptpet = request.form.get("adoptpet")
        email = request.form.get("email")
        phone = request.form.get("phone")
        address = request.form.get("address")
        anypet = request.form.get("anypet")
        PetName_s = request.form.get("PetName_s")
        PetBreed_s = request.form.get("PetBreed_s")
        disposition = request.form.get("disposition")
        veterinarian_num = request.form.get("veterinarian_num")
        renthome = request.form.get("renthome")
        yard = request.form.get("yard")
        ifyes = request.form.get("ifyes")
        petpolicy = request.form.get("petpolicy")
        ifrent = request.form.get("ifrent")
        lownokill = request.form.get("lownokill")
        child = request.form.get("child")
        ifchildyes = request.form.get("ifchildyes")
        hrsperday = request.form.get("hrsperday")
        crate = request.form.get("crate")
        emergently = request.form.get("emergently")
        behaveissue = request.form.get("behaveissue")
        referencesnumber = request.form.get("referencesnumber")
        crate2 = request.form.get("crate2")
        detaileddescription = request.form.get("detaileddescription")
        Signature = request.form.get("Signature")

        print(fname, lname,adoptpet,email, phone,address,anypet,PetName_s,PetBreed_s,disposition,veterinarian_num,renthome,yard,ifyes,petpolicy,ifrent,lownokill,child,ifchildyes,hrsperday,crate,emergently,behaveissue,referencesnumber,crate2,detaileddescription,Signature)

        con = dbConnection()
        cursor = con.cursor()
        sql = "INSERT INTO petinfo (fname, lname,adoptpet, email,phone,address,anypet,PetName_s,PetBreed_s,disposition,veterinarian_num,renthome,yard,ifyes,petpolicy,ifrent,lownokill,child,ifchildyes,hrsperday,crate,emergently,behaveissue,referencesnumber,crate2,detaileddescription,Signature) VALUES (%s, %s, %s, %s,%s, %s, %s, %s,%s, %s, %s, %s,%s, %s, %s, %s,%s,%s, %s,%s, %s, %s, %s,%s, %s, %s,%s)"
        val = (fname, lname,adoptpet,email, phone,address,anypet,PetName_s,PetBreed_s,disposition,veterinarian_num,renthome,yard,ifyes,petpolicy,ifrent,lownokill,child,ifchildyes,hrsperday,crate,emergently,behaveissue,referencesnumber,crate2,detaileddescription,Signature)
        cursor.execute(sql, val)
        con.commit()
        msg = "Form submitted successfully! please Login yourself!"
        return render_template('login.html', msg=msg)
    return render_template('pet_form.html')

@app.route('/contact')
def contact():
    return render_template('contact.html')

@app.route('/services')
def services():
    global nam
    global feat
    global img
    global nam1
    global feat1
    global img1


    con = dbConnection()
    cursor = con.cursor()
    cursor.execute('SELECT breed_name, temperment, img FROM dog LIMIT 0,8')
    result = cursor.fetchall()
    print(result)
    nam = []
    feat = []
    img = []
    for i in result:
        a = i[0]
        nam.append(a)
        b = i[1]
        feat.append(b)
        c = i[2]
        img.append(c)

    cursor.execute('SELECT breed_name, personality, image FROM cat LIMIT 0,9')
    result1 = cursor.fetchall()
    print(result1)
    nam1 = []
    feat1 = []
    img1 = []
    for i in result1:
        a = i[0]
        nam1.append(a)
        b = i[1]
        feat1.append(b)
        c = i[2]
        img1.append(c)
    return render_template('services.html', nam=nam,feat=feat,img=img,nam1=nam1,feat1=feat1,img1=img1)


@app.route('/logout')
def logout():
    session.pop('user')
    session.pop('userid')
    return redirect(url_for('index'))


@app.route('/login', methods=["GET","POST"])
def login():
    msg = ''
    if request.method == "POST":
        try:
            session.pop('user',None)
            username = request.form.get("email")
            password = request.form.get("pass")
            con = dbConnection()
            cursor = con.cursor()
            cursor.execute('SELECT * FROM userdetails WHERE email = %s AND pass = %s', (username, password))
            result = cursor.fetchone()
            if result:
                session['user'] = result[1]
                session['userid'] = result[0]
                print("all queries submitted")
                return redirect(url_for('index'))
            else:
                print("somthing went wrong in if loop")
                return redirect(url_for('home'))
        except:
            print("Exception occured at login")
            return redirect(url_for('home'))
        finally:
            dbClose()
    #return redirect(url_for('index'))
    return render_template('login.html')

@app.route('/adlogin', methods=["GET","POST"])
def adlogin():
    msg = ''
    if request.method == "POST":
        try:
            session.pop('user',None)
            username = request.form.get("email")
            password = request.form.get("pass")
            con = dbConnection()
            cursor = con.cursor()
            cursor.execute('SELECT * FROM adlogin WHERE email = %s AND pass = %s', (username, password))
            result = cursor.fetchone()
            if result:
                session['user'] = result[1]
                session['userid'] = result[0]
                print("all queries submitted")
                return redirect(url_for('adinfo'))
            else:
                print("somthing went wrong in if loop")
                return render_template('admin_login.html')
        except:
            print("Exception occured at login")
            return render_template('admin_login.html')
        finally:
            dbClose()
    #return redirect(url_for('index'))
    return render_template('admin_login.html')
        

@app.route('/register', methods=["GET","POST"])
def register():
    if request.method == "POST":
        try:
            fname = request.form.get("fname")
            lname = request.form.get("lname")
            email = request.form.get("email")
            password = request.form.get("pass")

            print(fname,lname)

            con = dbConnection()
            cursor = con.cursor()
            sql = "INSERT INTO userdetails (fname, lname,email, pass) VALUES (%s, %s, %s, %s)"
            val = (fname, lname,email, password)
            cursor.execute(sql, val)
            con.commit()
            return render_template("pet_form.html")
        except:
            print("Exception occured at login")
            return render_template('register.html')
        finally:
            dbClose()
    return render_template('register.html')

@app.route('/info', methods=["GET","POST"])
def adinfo():
    if request.method=="POST":
        imgs = request.files['img']
        breed_name = request.form.get("bname")
        animal = request.form.get("animal")
        temp = request.form.get("temp")
        lfexp = request.form.get("lfexp")
        dis = request.form.get("dis")
        height = request.form.get("height")
        grp = request.form.get("grp")
        Color = request.form.get("Color")
        print(imgs,breed_name,animal,temp)
        filename_secure = secure_filename(imgs.filename)
        imgs.save(os.path.join(app.config['UPLOAD_FOLDER'], filename_secure))
        print("print saved")

        con = dbConnection()
        cursor = con.cursor()
        # for cat
        # sql = "INSERT INTO dog (breed_name, image, description, weight, color_options, life_expectancy, characteristics, personality) VALUES (%s, %s, %s, %s,%s, %s, %s, %s)"
        # val = (breed_name,imgs,dis)
        # cursor.execute(sql, val)


        weight=0
        # for dog
        sql = "INSERT INTO dog (breed_name, temperment, img, description, height , weight, life_expectancy, grp, color_options) VALUES (%s, %s, %s, %s,%s, %s, %s, %s,%s)"
        val = (breed_name, temp, filename_secure, dis, height, str(weight), lfexp, grp, Color)
        cursor.execute(sql, val)
        con.commit()

    return render_template('admin_info.html')


if __name__ == '__main__':
    #app.run(debug=True)
    app.run('0.0.0.0')