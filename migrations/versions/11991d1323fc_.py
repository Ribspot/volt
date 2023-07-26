"""empty message

Revision ID: 11991d1323fc
Revises: ec19d52b4751
Create Date: 2023-07-10 16:34:22.000267

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '11991d1323fc'
down_revision = 'ec19d52b4751'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('order_tracking', schema=None) as batch_op:
        batch_op.add_column(sa.Column('tracking_number', sa.String(length=255), nullable=False))
        batch_op.add_column(sa.Column('carrier_code', sa.String(length=255), nullable=False))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('order_tracking', schema=None) as batch_op:
        batch_op.drop_column('carrier_code')
        batch_op.drop_column('tracking_number')

    # ### end Alembic commands ###