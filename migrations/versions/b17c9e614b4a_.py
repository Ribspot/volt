"""empty message

Revision ID: b17c9e614b4a
Revises: 9094cea6c25c
Create Date: 2023-07-08 10:51:38.542966

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = 'b17c9e614b4a'
down_revision = '9094cea6c25c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('package', schema=None) as batch_op:
        batch_op.drop_constraint('package_ibfk_4', type_='foreignkey')
        batch_op.drop_column('package_user_id')

    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.add_column(sa.Column('user_package', sa.Integer(), nullable=True))
        batch_op.create_foreign_key(None, 'package', ['user_package'], ['package_id'])

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('user', schema=None) as batch_op:
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.drop_column('user_package')

    with op.batch_alter_table('package', schema=None) as batch_op:
        batch_op.add_column(sa.Column('package_user_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
        batch_op.create_foreign_key('package_ibfk_4', 'user', ['package_user_id'], ['user_id'])

    # ### end Alembic commands ###
