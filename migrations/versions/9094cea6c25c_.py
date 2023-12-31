"""empty message

Revision ID: 9094cea6c25c
Revises: ab20c843d12e
Create Date: 2023-07-06 19:54:17.252489

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9094cea6c25c'
down_revision = 'ab20c843d12e'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('review',
    sa.Column('review_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('review_user_id', sa.Integer(), nullable=True),
    sa.Column('review_date', sa.DateTime(), nullable=True),
    sa.Column('review_message', sa.Text(), nullable=False),
    sa.Column('review_rating', sa.String(length=255), nullable=False),
    sa.ForeignKeyConstraint(['review_user_id'], ['user.user_id'], ),
    sa.PrimaryKeyConstraint('review_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('review')
    # ### end Alembic commands ###
