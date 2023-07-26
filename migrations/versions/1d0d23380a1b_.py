"""empty message

Revision ID: 1d0d23380a1b
Revises: 25f2540fe843
Create Date: 2023-07-03 13:12:40.523998

"""
from alembic import op
import sqlalchemy as sa
from sqlalchemy.dialects import mysql

# revision identifiers, used by Alembic.
revision = '1d0d23380a1b'
down_revision = '25f2540fe843'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('package', schema=None) as batch_op:
        batch_op.alter_column('cost',
               existing_type=mysql.VARCHAR(length=255),
               type_=sa.Float(),
               existing_nullable=True)

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('package', schema=None) as batch_op:
        batch_op.alter_column('cost',
               existing_type=sa.Float(),
               type_=mysql.VARCHAR(length=255),
               existing_nullable=True)

    # ### end Alembic commands ###