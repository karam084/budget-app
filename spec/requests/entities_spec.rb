require_relative '../rails_helper'

RSpec.describe 'Entity page', type: :feature do
  before(:each) do
    visit new_user_registration_path
    @user = User.create(
      name: 'karam',
      email: 'karam@example.com',
      password: '123123'
    )
    visit user_session_path
    fill_in 'Email', with: @user.email.to_s
    fill_in 'Password', with: @user.password.to_s
    find("input[type='submit']").click

    @group1 = Group.new(name: 'first Group', icon: 'first icon', user_id: @user.id)
    @group1.save
    @entity1 = Entity.new(name: 'first Entity', amount: 100, group_id: @group1.id)
    @entity1.save
  end

  it 'shows the view button' do
    visit group_path(@group1)
    expect(page).to have_content('Add New Transaction')
  end

  it 'shows the the title text' do
    visit group_path(@group1)
    expect(page).to have_content('Transactions')
  end

  it 'shows the user name' do
    expect(page).to have_content(@user.name.to_s)
  end
end
