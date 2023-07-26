"""empty message

Revision ID: 07887e13e62c
Revises: 11991d1323fc
Create Date: 2023-07-12 15:15:43.405497

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '07887e13e62c'
down_revision = '11991d1323fc'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('driver',
    sa.Column('driver_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('fullname', sa.String(length=255), nullable=False),
    sa.Column('phone_number', sa.String(length=100), nullable=True),
    sa.Column('email', sa.String(length=255), nullable=False),
    sa.Column('address', sa.String(length=120), nullable=True),
    sa.PrimaryKeyConstraint('driver_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('driver')
    # ### end Alembic commands ###