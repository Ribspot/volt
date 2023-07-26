from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db=SQLAlchemy()

#id,name,email,phone,message,datasent
class Contact(db.Model):
    id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    name = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(100), nullable=False)
    phone= db.Column(db.String(100), nullable=True)
    message= db.Column(db.Text(), nullable=False)
    datesent= db.Column(db.DateTime(), default=datetime.utcnow)
     

class User(db.Model):
     #__table__="users"
    userid = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    user_fullname = db.Column(db.String(255), nullable=False)
      
class Newsletter(db.Model):
       id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
       email= db.Column(db.String(255), nullable=False)
      
class Post(db.Model):
    #the table is always small letter when created
   #orl interacting with the database as an object __tablename__='mypost'
    id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
    post_title = db.Column(db.String(255), nullable=False)
    post_cat_id=db.Column(db.Integer(),db.ForeignKey('category.cat_id'))
    post_content = db.Column(db.Text(), nullable=False)
    post_created_on = db.Column(db.DateTime(), default=datetime.utcnow)
    post_updated_on = db.Column(db.DateTime(), default=datetime.utcnow, onupdate=datetime.utcnow) 
    catdeets=db.relationship('Category',backref='myposts') 
    #userdeets=db.relationship('User',backref='myposts') 
     #catdeets=db.relationship('Category',back_populates='myposts') 
class Category(db.Model):
       cat_id = db.Column(db.Integer(), primary_key=True)
       cat_name = db.Column(db.String(255), nullable=False)
class Lga(db.Model):
    lga_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
   
    state_id=db.Column(db.Integer(),db.ForeignKey('state.state_id'))
    lga_name= db.Column(db.String(255), nullable=False)
 
    statedeets=db.relationship('State',backref='all_lgas') 
    #userdeets=db.relationship('User',backref='myposts') 
class State(db.Model):
    state_id = db.Column(db.Integer(), primary_key=True,autoincrement=True)
   
    state_name=db.Column(db.String(255), nullable=False)

 