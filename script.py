from app import db, wtf
from app.models import User, Post
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash
from flask_mail import Message
from app import mail

msg = Message('test subject', sender=wtf.config['ADMINS'][0],
recipients=['ciapivan@gmail.com'])
msg.body = 'skuska'
msg.html = '<h1>HTML body</h1>'
mail.send(msg)
print('Mail poslany.')
