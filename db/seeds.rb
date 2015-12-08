# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
    Admin.create(email: "admin@example.com", password: "password", password_confirmation: "password")
    courses = Course.create(:name=>'B.A')
    courses = Course.create(:name=>'B.Arch')
    courses = Course.create(:name=>'BCA')
    courses = Course.create(:name=>'B.Com')
    courses = Course.create(:name=>'B.Ed')
    courses = Course.create(:name=>'B.Tech')
    courses = Course.create(:name=>'C.A')

    specialixation=Specialization.create(:name=>'Computers')
    specialixation=Specialization.create(:name=>'Aviation')
    specialixation=Specialization.create(:name=>'Biomedical')
    specialixation=Specialization.create(:name=>'Civil')
    specialixation=Specialization.create(:name=>'Agriculture')
    specialixation=Specialization.create(:name=>'Environment')
    specialixation=Specialization.create(:name=>'Nuclear')
    specialixation=Specialization.create(:name=>'Petroleum')
    