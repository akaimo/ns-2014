# coding: utf-8

0.upto(2) do |idx|
  TourInfomation.create(
  {tourname: "２泊３日★北谷エリアでダイビング！#{idx}",
  tourcontent: "１日目：羽田空港⇒那覇空港 バスでホテルへ\n２日目：午前：ダイビング(約２時間)(10:30~)\n★午後：美ら海水族館\n３日目：終日フリー\n４日目：国際通りでお買い物　バスで那覇空港⇒羽田空港\n",
  category: "海",
  subcategory: "ダイビング"
  }, without_protection: true)

  tour = TourInfomation.find_by_tourname("２泊３日★北谷エリアでダイビング！#{idx}")
  1.upto(3) do |idxx|
    Detail.create(
    {tour_infomation: tour,
    start: "2015-08-#{idxx}",
    finish: "2015-08-#{idxx + 3}",
    price: 10000,
    limit: 30,
    lowst: 10
    }, without_protection: true)
  end

  TourInfomation.create(
  {tourname: "２泊３日★北谷エリアでパラグライダー！#{idx}",
  tourcontent: "１日目：羽田空港⇒那覇空港 バスでホテルへ\n２日目：午前：ダイビング(約２時間)(10:30~)\n★午後：美ら海水族館\n３日目：終日フリー\n４日目：国際通りでお買い物　バスで那覇空港⇒羽田空港\n",
  category: "空",
  subcategory: "パラグライダー"
  }, without_protection: true)

  tour = TourInfomation.find_by_tourname("２泊３日★北谷エリアでパラグライダー！#{idx}")
  1.upto(3) do |idxx|
    Detail.create(
    {tour_infomation: tour,
    start: "2015-08-#{idxx}",
    finish: "2015-08-#{idxx + 3}",
    price: 10000,
    limit: 30,
    lowst: 10
    }, without_protection: true)
  end

  TourInfomation.create(
  {tourname: "２泊３日★北谷エリアで登山！#{idx}",
  tourcontent: "１日目：羽田空港⇒那覇空港 バスでホテルへ\n２日目：午前：ダイビング(約２時間)(10:30~)\n★午後：美ら海水族館\n３日目：終日フリー\n４日目：国際通りでお買い物　バスで那覇空港⇒羽田空港\n",
  category: "山",
  subcategory: "登山"
  }, without_protection: true)

  tour = TourInfomation.find_by_tourname("２泊３日★北谷エリアで登山！#{idx}")
  1.upto(3) do |idxx|
    Detail.create(
    {tour_infomation: tour,
    start: "2015-08-#{idxx}",
    finish: "2015-08-#{idxx + 3}",
    price: 10000,
    limit: 30,
    lowst: 10
    }, without_protection: true)
  end

  TourInfomation.create(
  {tourname: "２泊３日★北谷エリアでバギー！#{idx}",
  tourcontent: "１日目：羽田空港⇒那覇空港 バスでホテルへ\n２日目：午前：ダイビング(約２時間)(10:30~)\n★午後：美ら海水族館\n３日目：終日フリー\n４日目：国際通りでお買い物　バスで那覇空港⇒羽田空港\n",
  category: "乗り物",
  subcategory: "バギー"
  }, without_protection: true)

  tour = TourInfomation.find_by_tourname("２泊３日★北谷エリアでバギー！#{idx}")
  1.upto(3) do |idxx|
    Detail.create(
    {tour_infomation: tour,
    start: "2015-08-#{idxx}",
    finish: "2015-08-#{idxx + 3}",
    price: 10000,
    limit: 30,
    lowst: 10
    }, without_protection: true)
  end

  TourInfomation.create(
  {tourname: "２泊３日★北谷エリアで観光！#{idx}",
  tourcontent: "１日目：羽田空港⇒那覇空港 バスでホテルへ\n２日目：午前：ダイビング(約２時間)(10:30~)\n★午後：美ら海水族館\n３日目：終日フリー\n４日目：国際通りでお買い物　バスで那覇空港⇒羽田空港\n",
  category: "観光",
  subcategory: "バスツアー"
  }, without_protection: true)

  tour = TourInfomation.find_by_tourname("２泊３日★北谷エリアで観光！#{idx}")
  1.upto(3) do |idxx|
    Detail.create(
    {tour_infomation: tour,
    start: "2015-08-#{idxx}",
    finish: "2015-08-#{idxx + 3}",
    price: 10000,
    limit: 30,
    lowst: 10
    }, without_protection: true)
  end
end
