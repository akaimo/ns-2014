# coding: utf-8
name = %w(Taro Jiro Hana, Ichi)
fnames = ["佐藤", "田中", "山田", "高橋", "鈴木"]
gnames = ["太郎", "次郎", "一郎", "花子"]

addres = ["○県○○市○○町○ー○", "□県□□市□□町□ー□", "△県△△市△△町△ー△"]
phone = ["090-0000-0000", "080-1111-1111", "070-2222-2222", "000-9999-9999"]

0.upto(11) do |idx|
  Member.create({name: "#{fnames[idx%5]} #{gnames[idx%4]}",
  address: "#{addres[idx%3]}",
  phone: "#{phone[idx%3]}",
  email: "#{name[idx%4]}@example.com",
  login_id: "#{name[idx%4]}",
  password: "password",
  password_confirmation: "password",
  administrator: (idx == 0)}, without_protection: true)
end
