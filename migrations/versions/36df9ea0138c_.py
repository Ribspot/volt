"""empty message

Revision ID: 36df9ea0138c
Revises: 011e339e1e0e
Create Date: 2023-07-01 22:19:08.902487

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '36df9ea0138c'
down_revision = '011e339e1e0e'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('lga', schema=None) as batch_op:
        batch_op.add_column(sa.Column('lga_state_id', sa.Integer(), nullable=True))
        batch_op.drop_constraint('lga_ibfk_1', type_='foreignkey')
        batch_op.create_foreign_key(None, 'state', ['lga_state_id'], ['state_id'])
        batch_op.drop_column('state_id')

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('lga', schema=None) as batch_op:
        batch_op.add_column(sa.Column('state_id', mysql.INTEGER(display_width=11), autoincrement=False, nullable=True))
        batch_op.drop_constraint(None, type_='foreignkey')
        batch_op.create_foreign_key('lga_ibfk_1', 'state', ['state_id'], ['state_id'])
        batch_op.drop_column('lga_state_id')

    # ### end Alembic commands ###
