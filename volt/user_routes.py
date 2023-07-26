import re,random,os,json,requests,jsonify
from functools import wraps
from flask import render_template, request, redirect, flash,make_response,session,url_for
from sqlalchemy.sql import text
from volt import app, csrf
from volt.models import db,User,Category,Package,State,Lga,Price,Review,Contact,Order_tracking,Driver
from volt.forms import SignupForm,ProfileForm,Login,Delivery,Contactus
from werkzeug.security import generate_password_hash,check_password_hash
from werkzeug.exceptions import InternalServerError
import errno
# from bookapp.forms import ContactForm
def login_required(f):
    @wraps(f)
    def login_decorator(*args,**kwargs):
        if session.get("userid") and session.get('user_loggedin'):
            return f(*args,**kwargs)
        else:
            flash("access Denied,Please Login")
            return redirect("/login")
    return login_decorator 
@app.errorhandler(PermissionError)
def handle_permission_error(error):
    # Log the error or perform any necessary actions
    app.logger.error('PermissionError: %s', error)

    # Render a custom error page
    return render_template('500.html', error_message='Permission denied'), 500

@app.route("/paystack",methods=['POST'])
def paystack():
    useronline=session.get('userid')
    userdeets=db.session.query(User).get(useronline)
    if session.get('ref')!=None:
        ref=session['ref']
        trx=db.session.query(Package).filter(Package.ref_no==ref).first()
        category = trx.catdeets
        email=userdeets.email
        amount=category.cat_price
        url="https://api.paystack.co/transaction/initialize"
        headers={"Content-Tpye": "application/json","Authorization":"Bearer sk_test_36db5be0776225e42db725abbaa157f7dd3a61dc"}
        data={"email":email,"amount":amount*100,"reference":ref}
        response=requests.post(url,headers=headers,data=json.dumps(data))
        rspjson=response.json()
        if rspjson['status']==True:
          paygateway= rspjson['data']['authorization_url']
          return redirect(paygateway)
        else:
             return rspjson
        
    else:
       return redirect ("/")
    
@app.route("/landing")
def paystack_landing():
    ref=session.get('ref')
    if ref:
        return redirect('/')
    

@app.route("/delivery",methods=['POST','GET'])
@login_required
def package():
    delivery=Delivery()
    
    useronline=session.get('userid')
    userdeets=db.session.query(User).get(useronline)
    cats=db.session.query(Category).all()
    state=db.session.query(State).all()
    data=User.query.join(Package).all()
    lga=db.session.query(Lga).all()
    if request.method=='GET':
          
           return render_template("delivery.html",delivery=delivery,userdeets=userdeets,cats=cats,state=state,lga=lga,data=data)
    else:
        if delivery.validate_on_submit():
            fullname=request.form.get('fullname')
            phone=request.form.get('phone_number')
            dev=request.form.get('delivery')
            add=request.form.get('destination_address')
            deststa=request.form.get('state')
            destlga=request.form.get('lga')
            house=request.form.get('house_address')
            
            packw=request.form.get('package_weight')
            picka=request.form.get('pickup_address')
            pickv=request.form.get('package_value')
            refno=int(random.random()*10000000)
            don=Package(ref_no=refno,house_address=house,destination_address=add,package_cat_id=dev,phone_number=phone,package_local_govt_id=destlga,package_state_id=deststa,package_value=pickv,weight=packw,pickup_address=picka,fullname=fullname)
            db.session.add(don)
            db.session.commit()
            session['ref']=refno
            flash("Submitted Successfully")
            return redirect ('/transportpage')
        else:
             return render_template("delivery.html",delivery=delivery,userdeets=userdeets,cats=cats,state=state,lga=lga,data=data)
@app.route("/payment")
@login_required
def payment():
    userdeets=db.session.query(User).get(session.get('userid'))
    if session.get('ref')!=None:
        ref=session['ref']
        trxdeets=db.session.query(Package).filter(Package.ref_no==ref).first()
        category = trxdeets.catdeets
        return render_template("payment.html",trxdeets=trxdeets,userdeets=userdeets,category=category)
    else:
        return redirect('/payment')


@app.route("/profile",methods=['POST','GET'])
@login_required
def profile():
     profile=ProfileForm()
     useronline=session.get('userid')
     userdeets=db.session.query(User).get(useronline)
     if request.method=='GET':
           return render_template("profile.html",profile=profile,userdeets=userdeets)
     else:
        if profile.validate_on_submit():
            fullname=request.form.get('fullname')
            username=request.form.get('username')
            picture=request.files['pix']
            filename =picture.filename
            # filename=profile.pix.data.filename
            picture.save("volt/static/collection/"+filename)
            userdeets.fullname=fullname
            userdeets.user_pix=filename
            userdeets.username=username
            db.session.commit()
            flash("profile updated")
            return redirect ('/profile')
        else:
        
             return render_template('profile.html',profile=profile,userdeets=userdeets)
      

@app.route("/")
def home():
     useronline=session.get('userid')
     userdeets=db.session.query(User).get(useronline)
   
     return render_template("index.html",userdeets=userdeets)
@app.route("/about")

def about():
    return render_template('about.html')

@app.route("/transportpage",methods=["POST","GET"])
@login_required
def transport_page():
    
    useronline=session.get('userid') 
    userdeets=db.session.query(User).get(useronline)
    package = db.session.query(Package).get(useronline)
    
    
    cats=db.session.query(Category).all()

    if request.method=="GET" :
     return render_template("transport_page1.html",package=package,cats=cats,userdeets=userdeets,useronline=useronline)
    

    else:
            useronline=session.get('userid')
            catname=request.form.get('delivery')
            catprice=request.form.get('delivery')
            package.cost=catprice
            # sign=Price(price_name=catname,price=catprice)
            # db.session.add(sign)
            db.session.commit()
            return redirect('/payment')
            
            return render_template("transport_page1.html",package=package,cats=cats)
            


@app.route("/signup",methods=["POST","GET"])
def signup():
      signup=SignupForm()
      if request.method=="GET":
        return render_template("signup.html",signup=signup)
      else:
          if signup.validate_on_submit():
            password=request.form.get('password')
            pwd = generate_password_hash(password)
            username=request.form.get('username') 
            fullname=request.form.get('fullname')
            email=request.form.get('email')
            phone=request.form.get('phone_number')
            houseadd=request.form.get('house_address')
            sign=User(username=username,fullname=fullname,email=email,phone_number=phone,address=houseadd,user_pwd=pwd)
            db.session.add(sign)
            db.session.commit()
            flash('successfully registered')
            session['userid']=sign.user_id
            session['user_loggedin']=True
            return redirect('/login')
          else:
           return render_template("signup.html",signup=signup)

@app.route('/trackingpage')
@login_required
def page():
    useronline=session.get('userid') 
    userdeets=db.session.query(User).get(useronline)
    package = db.session.query(Driver).all()
    return render_template("driver.html",package=package,userdeets=userdeets)


@app.route('/trackings', methods=['POST'])
@login_required
def create_tracking():
  
    base_url = 'https://api.aftership.com/v4'
    
    tracking_number = request.json.get('tracking_number')
    carrier_code = request.json.get('carrier_code')
    
    endpoint = '/trackings'
    url = base_url + endpoint
    
    headers = {
        'Content-Type': 'application/json',
        'as-api-key':'asat_2b011914a75c4e26bd01e9a49beeddf7'
    }
    
    payload = {
        'tracking': {
            'tracking_number': tracking_number,
            'carrier_code': carrier_code
        }
    }
    
    response = requests.post(url, headers=headers, json=payload)
    
    if response.status_code == 201:
        data = response.json()
        return jsonify(data), 201
    else:
        return 'Request failed with status code: ' + str(response.status_code), response.status_code


@app.route('/signout')
def signout():
    if session.get('userid') or session.get('user_loggedin'):
        session.pop('userid',None)
        session.pop('user_loggedin',None)
    return redirect('/')




@app.route("/login",methods=["POST","GET"])
def login():
      login=Login()
      if request.method=="GET":
        return render_template("login.html",login=login)
      else:
             
              username=request.form.get('email')
              password=request.form.get('password')
              deets=db.session.query(User).filter(User.email==username).first()
              if deets:
                  hashedpwd=deets.user_pwd
                  chk=check_password_hash(hashedpwd,password)
                  if chk:
                      session['user_loggedin']=True
                      session['userid']=deets.user_id
                      return redirect('/profile')
                  else:
                      flash('invalid credentials sss')
                      return redirect('/login')
              else:
                  flash("invalid credentials  s")
                  return redirect('/login')
    

@app.route("/contact",methods=["POST","GET"])
def contact():
  contact=Contactus()

  if request.method=="GET":
     return  render_template("contact.html",contact=contact)
  else:
       if contact.validate_on_submit():
        name=request.form.get("fullname")
        message=request.form.get("message")
        phone=request.form.get("phone_number")
        email=request.form.get("email")
        sign=Contact(fullname=name,message=message,email=email,phone_number=phone)
        db.session.add(sign)
        db.session.commit()
        flash('sent')
        return redirect('/contact')
       else:
           return render_template("contact.html",contact=contact)
@app.route("/trackpackage")
@login_required
def track_package():
  track=db.session.query(Order_tracking).all()
  return render_template("track_package.html",track=track)

@app.route("/review",methods=["POST","GET"])
@login_required
def review():
  useronline=session.get('userid')
  userdeets=db.session.query(User).get(useronline)
  if request.method=="GET":
   return render_template("review.html",userdeets=userdeets)
  else:
   review=request.form.get('text')
   ratings=request.form.get('select')
   u=Review(review_message=review,review_rating=ratings)
   db.session.add(u)
   db.session.commit()
   flash('Thank you')
   return redirect('/review')