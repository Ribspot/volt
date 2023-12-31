"""empty message

Revision ID: 434420c3ab73
Revises: 36df9ea0138c
Create Date: 2023-07-03 12:30:44.090801

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '434420c3ab73'
down_revision = '36df9ea0138c'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('package', schema=None) as batch_op:
        batch_op.add_column(sa.Column('email', sa.String(length=255), nullable=False))

    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    with op.batch_alter_table('package', schema=None) as batch_op:
        batch_op.drop_column('email')

    # ### end Alembic commands ###
