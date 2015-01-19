# coding: utf-8

tour = TourInfomation.find_by_tourname("２泊３日★北谷エリアでダイビング！9")
member = Member.find_by_id(2)
0.upto(9) do |idx|
  Review.create(
  { member: member,
    tour_infomation: tour,
    title: "test",
    content: "testtesttest"
  }, without_protection: true)
end