import re,random,os
from flask import render_template, request, redirect, flash,make_response,session,url_for
from sqlalchemy.sql import text
from volt import app, csrf
from volt.forms import Login,Cat,Drive
from volt.models import db,Admin,Category,User,Package,Driver

@app.route("/admin/login",methods=['GET','POST'])
def adminlogin():
   login=Login()
   if session.get('admin_loggedin')==None:
    flash("access denied")
   if request.method=="GET":
         return render_template("admin/admin_login.html",login=login)
   else:
              username=request.form.get('email')
              pwd=request.form.get('password')
              chk=db.session.query(Admin).filter(Admin.admin_username==username,Admin.admin_pwd==pwd).count()
              if chk:
               session['admin_loggedin']=True
               flash('sucessful')
               return redirect("/admin/")
              else:
                flash('incorrect credentials')
                return redirect("/admin/login")
  
@app.route("/admin/logout") 
def admin_logout():
   if session.get('admin_loggedin'):
      session.pop("admin_loggedin",None)
      flash('you have logged out successfully...')
   return redirect('/admin/login')
@app.route("/admin/400")
def error():
    return render_template("admin/404.html")

@app.route("/admin/delivery")
def admin_dashboard():
        useronline=session.get('userid')
        package = db.session.query(Package).all()
        userdeets=db.session.query(User).all()
        return render_template("admin/delivery.html",package=package,userdeets=userdeets)

@app.route("/admin/")
def adminindex():
        useronline=session.get('userid')
        userdeets=db.session.query(User).get(useronline)
        return render_template("admin/index.html",userdeets=userdeets)

@app.route("/admin/customer")
def admincustomer():
       useronline=session.get('userid')
       userdeets=db.session.query(User).all()
       return render_template("admin/customer.html",userdeets=userdeets)

@app.route("/admin/profile")
def admin():
       return render_template("admin/profile.html")
@app.route("/admin/cat",methods=["POST","GET"])
def adminadd():
       cat=Cat()
       if request.method=="GET":
        return render_template("admin/Category.html",cat=cat)
       else: 
        catname=request.form.get('name')
        price=request.form.get('price')
        b=Category(cat_name=catname,cat_price=price)
        db.session.add(b)
        db.session.commit()
        flash("category successfully added")
        return redirect("/admin/cat")
@app.route("/admin/driver",methods=["POST","GET"])
def admindriver():
       cat=Drive()
       if request.method=="GET":
        return render_template("admin/driver.html",cat=cat)
       else: 
        name=request.form.get('fullname')
        email=request.form.get('email')
        add=request.form.get('house_address')
        phone=request.form.get('phone_number')
        b=Driver(fullname=name,phone_number=phone,address=add,email=email)
        db.session.add(b)
        db.session.commit()
        flash("driver successfully added")
        return redirect("/admin/driver")      