from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField,TextAreaField,PasswordField,SelectField
from wtforms.validators import DataRequired, Email, Length, EqualTo
from flask_wtf.file import FileField,FileAllowed,file_required

class SignupForm(FlaskForm):
    fullname = StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
    username = StringField("Username",validators=[DataRequired(message="your username is required")])
    email = StringField("Your Email",validators=[Email()])
    password = PasswordField("password", validators=[DataRequired()])
    phone_number= StringField("Phone Number",validators=[DataRequired()])
    house_address= StringField("House Address",validators=[DataRequired()])
    confirm_password = PasswordField("confirm password", validators=[EqualTo('password',message='confirm password must be equal to password')])
    btn = SubmitField("sign up!")
class Contactus(FlaskForm):
      fullname = StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
      email = StringField("Your Email",validators=[Email()])
      phone_number= StringField("Phone Number",validators=[DataRequired()])
      message=StringField("Message",validators=[DataRequired()])
      btn = SubmitField("submit")
class ProfileForm(FlaskForm): 
    fullname=StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
    username = StringField("Username",validators=[DataRequired(message="your username is required")])
    pix=FileField("Display picture",validators=[FileAllowed(['jpg','png'],'images only!')])
    btn = SubmitField("update profile")

class Login(FlaskForm):
    email = StringField("Your Email",validators=[Email()])
    password = PasswordField("password", validators=[DataRequired()])
    btn = SubmitField("login")  
    
class Delivery(FlaskForm):
    fullname = StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
    phone_number= StringField("Phone Number",validators=[DataRequired()])
    house_address= StringField("House Address",validators=[DataRequired()])
   
    package_value= StringField("Package value",validators=[DataRequired()])
    package_weight= StringField("Package weight",validators=[DataRequired()])
    # destination_state=StringField("Destination state",validators=[DataRequired()])
    # destination_lga= StringField("Destination lga",validators=[DataRequired()])
    destination_address= StringField("Destination address",validators=[DataRequired()])
    pickup_address= StringField("Pickup address",validators=[DataRequired()])
    
    btn = SubmitField("submit")
class Drive(FlaskForm):
    fullname = StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
    phone_number= StringField("Phone Number",validators=[DataRequired()])
    house_address= StringField("House Address",validators=[DataRequired()])
    email=  StringField("Your Email",validators=[Email()])
    btn = SubmitField("submit")

class Profile(FlaskForm):
    fullname = StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
    username = StringField("Username",validators=[DataRequired(message="your username is required")])
    email = StringField("Your Email",validators=[Email()])
    phone_number= StringField("Phone Number",validators=[DataRequired()])
    house_address= StringField("House Address",validators=[DataRequired()])
    package_price= StringField("Package price",validators=[DataRequired()])
   
    btn = SubmitField("submit")

class Cat(FlaskForm):
      name = StringField("Fullname",validators=[DataRequired(message="your fullname is required")])
      price= StringField("Phone Number",validators=[DataRequired()])

      btn = SubmitField("submit")

     
    

