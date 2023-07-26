from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db=SQLAlchemy()

#id,name,email,phone,message,datasent
class User(db.Model):
    user_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    fullname = db.Column(db.String(255), nullable=False)
    username= db.Column(db.String(100), nullable=False)
    phone_number= db.Column(db.String(100), nullable=True)
    email= db.Column(db.String(255), nullable=False)
    user_pwd=db.Column(db.String(120),nullable=True)
    address=db.Column(db.String(120),nullable=True)
    user_pix=db.Column(db.String(120),nullable=True) 
    user_package_id=db.Column(db.Integer(),db.ForeignKey('package.package_id'),nullable=True)
    datesent= db.Column(db.DateTime(), default=datetime.utcnow)
    userdee=db.relationship('Package',backref='mypackage') 
class Contact(db.Model):
    contact_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    fullname = db.Column(db.String(255), nullable=False)
    phone_number= db.Column(db.String(100), nullable=True)
    email= db.Column(db.String(255), nullable=False)
    message=db.Column(db.String(120),nullable=True)

class Driver(db.Model):
    driver_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    fullname = db.Column(db.String(255), nullable=False)
    phone_number= db.Column(db.String(100), nullable=True)
    email= db.Column(db.String(255), nullable=False)
    address=db.Column(db.String(120),nullable=True)

class Location(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    latitude = db.Column(db.Float)
    longitude = db.Column(db.Float)

class Package(db.Model):
     #__table__="users"
    package_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    creation_date= db.Column(db.DateTime(), default=datetime.utcnow)
    weight = db.Column(db.String(255), nullable=False)
    
    package_cat_id=db.Column(db.Integer(),db.ForeignKey('category.cat_id'),nullable=True)
    pickup_address=db.Column(db.String(255), nullable=False)
    destination_address=db.Column(db.String(255), nullable=False)
    fullname=db.Column(db.String(255), nullable=False)
    phone_number= db.Column(db.String(100), nullable=True)
    cost=db.Column(db.String(100), nullable=True)
    package_value=db.Column(db.String(255), nullable=False)
    package_status=db.Column(db.Enum('pending','failed','paid'),nullable=False, server_default=("pending"))
    house_address=db.Column(db.String(255), nullable=False)
    ref_no=db.Column(db.String(100), nullable=True)
    datesent= db.Column(db.DateTime(), default=datetime.utcnow)
   
    package_state_id=db.Column(db.Integer(),db.ForeignKey('state.state_id'),nullable=True)
    package_local_govt_id=db.Column(db.Integer(),db.ForeignKey('lga.lga_id'),nullable=True)
    catdeets=db.relationship('Category',backref='myposts') 
    
    statedeets=db.relationship('State',backref='mystate') 
    lgadeets=db.relationship('Lga',backref='mylga') 
class Price(db.Model):
       price_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
       price_name=db.Column(db.String(255), nullable=False)
       price=db.Column(db.String(255), nullable=False)
       cat_id=db.Column(db.Integer(),db.ForeignKey('category.cat_id'))
       pack =db.relationship('Category',backref='mypr') 
class Category(db.Model):
       cat_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
       cat_name= db.Column(db.String(255), nullable=False)
       cat_price=db.Column(db.Float, nullable=False)
       updated_date= db.Column(db.DateTime(), default=datetime.utcnow)
      
class Order_tracking(db.Model):
    order_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    tracking_number=db.Column(db.String(255), nullable=False)
    carrier_code=db.Column(db.String(255), nullable=False)
    order_date= db.Column(db.DateTime(), default=datetime.utcnow)
    order_track_user_id=db.Column(db.Integer(),db.ForeignKey('user.user_id'))
    order_track_package_id=db.Column(db.Integer(),db.ForeignKey('package.package_id'))
    order_status= db.Column(db.Text(), nullable=False)
    
    orderdeets=db.relationship('User',backref='myorder') 
    packdeets=db.relationship('Package',backref='mypack') 
class Review(db.Model):
       review_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
       review_user_id=db.Column(db.Integer(),db.ForeignKey('user.user_id'))
       review_date=db.Column(db.DateTime(), default=datetime.utcnow)
       review_message= db.Column(db.Text(), nullable=False)
       review_rating=db.Column(db.String(255), nullable=False)

       reviewdeets=db.relationship('User',backref='myreview') 
class Journey(db.Model):
       journey_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
       journey_user_id=db.Column(db.Integer(),db.ForeignKey('user.user_id'))
       start_date=db.Column(db.DateTime(), default=datetime.utcnow)
       end_date=db.Column(db.DateTime(), default=datetime.utcnow)
       destination=db.Column(db.String(255), nullable=False)
       description=db.Column(db.String(255), nullable=False)
       journey_package_id=db.Column(db.Integer(),db.ForeignKey('package.package_id'))

       packeddeets=db.relationship('Package',backref='mypacked') 
       jourdeets=db.relationship('User',backref='myjour') 

       
      
class Payment(db.Model):
       payment_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
       payment_user_id=db.Column(db.Integer(),db.ForeignKey('user.user_id'))
       cost=db.Column(db.String(255), nullable=False)
       payment_date=db.Column(db.DateTime(), default=datetime.utcnow)
       payment_package_id=db.Column(db.Integer(),db.ForeignKey('package.package_id'))
       price_id=db.Column(db.Integer(),db.ForeignKey('price.price_id'))

       paymentdeets=db.relationship('User',backref='mypay') 
       paymedeets=db.relationship('Package',backref='mypackpa') 
       pricedeets=db.relationship('Price',backref='myprice') 

class Lga(db.Model):
    lga_id = db.Column(db.Integer(), primary_key=True, autoincrement=True)
    lga_state_id = db.Column(db.Integer(), db.ForeignKey('state.state_id'))
    lga_name = db.Column(db.String(255), nullable=False)

    state = db.relationship('State', backref='lgas')

class State(db.Model):
    state_id = db.Column(db.Integer(), primary_key=True, autoincrement=True)
    state_name = db.Column(db.String(255), nullable=False)

class Admin(db.Model):
    admin_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    admin_pwd=db.Column(db.String(120),nullable=True)
    admin_username=db.Column(db.String(255), nullable=False)

 