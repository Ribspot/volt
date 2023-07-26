"""empty message

Revision ID: 91af8a4d3a96
Revises: 1d0d23380a1b
Create Date: 2023-07-03 13:33:05.342712

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '91af8a4d3a96'
down_revision = '1d0d23380a1b'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('category', schema=None) as batch_op:
        batch_op.alter_column('cat_price',
               existing_type=mysql.VARCHAR(length=255),
               type_=sa.Float(),
               existing_nullable=False)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('category', schema=None) as batch_op:
        batch_op.alter_column('cat_price',
               existing_type=sa.Float(),
               type_=mysql.VARCHAR(length=255),
               existing_nullable=False)

    # ### end Alembic commands ###
