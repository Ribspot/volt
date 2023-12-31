"""empty message

Revision ID: 011e339e1e0e
Revises: 
Create Date: 2023-07-01 22:09:00.071190

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '011e339e1e0e'
down_revision = None
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.create_table('admin',
    sa.Column('admin_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('admin_pwd', sa.String(length=120), nullable=True),
    sa.Column('admin_username', sa.String(length=255), nullable=False),
    sa.PrimaryKeyConstraint('admin_id')
    )
    op.create_table('category',
    sa.Column('cat_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('cat_name', sa.String(length=255), nullable=False),
    sa.Column('cat_price', sa.String(length=255), nullable=False),
    sa.Column('updated_date', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('cat_id')
    )
    op.create_table('state',
    sa.Column('state_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('state_name', sa.String(length=255), nullable=False),
    sa.PrimaryKeyConstraint('state_id')
    )
    op.create_table('user',
    sa.Column('user_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('fullname', sa.String(length=255), nullable=False),
    sa.Column('username', sa.String(length=100), nullable=False),
    sa.Column('phone_number', sa.String(length=100), nullable=True),
    sa.Column('email', sa.String(length=255), nullable=False),
    sa.Column('user_pwd', sa.String(length=120), nullable=True),
    sa.Column('address', sa.String(length=120), nullable=True),
    sa.Column('user_pix', sa.String(length=120), nullable=True),
    sa.Column('datesent', sa.DateTime(), nullable=True),
    sa.PrimaryKeyConstraint('user_id')
    )
    op.create_table('lga',
    sa.Column('lga_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('state_id', sa.Integer(), nullable=True),
    sa.Column('lga_name', sa.String(length=255), nullable=False),
    sa.ForeignKeyConstraint(['state_id'], ['state.state_id'], ),
    sa.PrimaryKeyConstraint('lga_id')
    )
    op.create_table('price',
    sa.Column('price_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('price_name', sa.String(length=255), nullable=False),
    sa.Column('price', sa.String(length=255), nullable=False),
    sa.Column('cat_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['cat_id'], ['category.cat_id'], ),
    sa.PrimaryKeyConstraint('price_id')
    )
    op.create_table('package',
    sa.Column('package_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('creation_date', sa.DateTime(), nullable=True),
    sa.Column('weight', sa.String(length=255), nullable=False),
    sa.Column('package_cat_id', sa.Integer(), nullable=True),
    sa.Column('pickup_address', sa.String(length=255), nullable=False),
    sa.Column('destination_address', sa.String(length=255), nullable=False),
    sa.Column('fullname', sa.String(length=255), nullable=False),
    sa.Column('phone_number', sa.String(length=100), nullable=True),
    sa.Column('cost', sa.String(length=255), nullable=True),
    sa.Column('package_value', sa.String(length=255), nullable=False),
    sa.Column('package_status', sa.Enum('pending', 'failed', 'paid'), server_default='pending', nullable=False),
    sa.Column('house_address', sa.String(length=255), nullable=False),
    sa.Column('ref_no', sa.String(length=100), nullable=True),
    sa.Column('datesent', sa.DateTime(), nullable=True),
    sa.Column('package_user_id', sa.Integer(), nullable=True),
    sa.Column('package_state_id', sa.Integer(), nullable=True),
    sa.Column('package_local_govt_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['package_cat_id'], ['category.cat_id'], ),
    sa.ForeignKeyConstraint(['package_local_govt_id'], ['lga.lga_id'], ),
    sa.ForeignKeyConstraint(['package_state_id'], ['state.state_id'], ),
    sa.ForeignKeyConstraint(['package_user_id'], ['user.user_id'], ),
    sa.PrimaryKeyConstraint('package_id')
    )
    op.create_table('journey',
    sa.Column('journey_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('journey_user_id', sa.Integer(), nullable=True),
    sa.Column('start_date', sa.DateTime(), nullable=True),
    sa.Column('end_date', sa.DateTime(), nullable=True),
    sa.Column('destination', sa.String(length=255), nullable=False),
    sa.Column('description', sa.String(length=255), nullable=False),
    sa.Column('journey_package_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['journey_package_id'], ['package.package_id'], ),
    sa.ForeignKeyConstraint(['journey_user_id'], ['user.user_id'], ),
    sa.PrimaryKeyConstraint('journey_id')
    )
    op.create_table('order_tracking',
    sa.Column('order_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('order_date', sa.DateTime(), nullable=True),
    sa.Column('order_track_user_id', sa.Integer(), nullable=True),
    sa.Column('order_track_package_id', sa.Integer(), nullable=True),
    sa.Column('order_status', sa.Text(), nullable=False),
    sa.ForeignKeyConstraint(['order_track_package_id'], ['package.package_id'], ),
    sa.ForeignKeyConstraint(['order_track_user_id'], ['user.user_id'], ),
    sa.PrimaryKeyConstraint('order_id')
    )
    op.create_table('payment',
    sa.Column('payment_id', sa.Integer(), autoincrement=True, nullable=False),
    sa.Column('payment_user_id', sa.Integer(), nullable=True),
    sa.Column('cost', sa.String(length=255), nullable=False),
    sa.Column('payment_date', sa.DateTime(), nullable=True),
    sa.Column('payment_package_id', sa.Integer(), nullable=True),
    sa.Column('price_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['payment_package_id'], ['package.package_id'], ),
    sa.ForeignKeyConstraint(['payment_user_id'], ['user.user_id'], ),
    sa.ForeignKeyConstraint(['price_id'], ['price.price_id'], ),
    sa.PrimaryKeyConstraint('payment_id')
    )
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_table('payment')
    op.drop_table('order_tracking')
    op.drop_table('journey')
    op.drop_table('package')
    op.drop_table('price')
    op.drop_table('lga')
    op.drop_table('user')
    op.drop_table('state')
    op.drop_table('category')
    op.drop_table('admin')
    # ### end Alembic commands ###
