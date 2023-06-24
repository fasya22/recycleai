class TrashDetail {
  String name;
  String image;
  String subtitle;
  String desc;
  String manfaat;

  TrashDetail({
    required this.name,
    required this.image,
    required this.subtitle,
    required this.desc,
    required this.manfaat,
  });
}

var trashList = [
  TrashDetail(
      name: 'Plastic',
      image:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1686718197/plastic_rxn4lz.png',
      subtitle: 'Plastic bottles, glass bottles,plastic bag, straw, and mica plastic.',
      desc: 'Plastic bottles, glass bottles,plastic bag, straw, and mica plastic.',
      manfaat: 'Plastic bottles, glass bottles,plastic bag, straw, and mica plastic.'),
  TrashDetail(
      name: 'Glass',
      image:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1686718197/glass_svrfpg.png',
      subtitle: 'Alcohol glass soy sauce glass bottle, and beaker. ',
      desc: 'Alcohol glass soy sauce glass bottle, and beaker. ',
      manfaat: 'Alcohol glass soy sauce glass bottle, and beaker. '),
  TrashDetail(
      name: 'Metal',
      image:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1686718197/metal_sdyrpw.png',
      subtitle: 'Aerosol, soda bottles, sardines food, and canned tuna.',
      desc: 'Aerosol, soda bottles, sardines food, and canned tuna.',
      manfaat: 'Aerosol, soda bottles, sardines food, and canned tuna.'),
  TrashDetail(
      name: 'Paper',
      image:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1686718199/paper_cpwiqm.png',
      subtitle: 'HVS paper, kraft paper, cardboard, and magazines.',
      desc: 'HVS paper, kraft paper, cardboard, and magazines.',
      manfaat: 'HVS paper, kraft paper, cardboard, and magazines.'),
  TrashDetail(
      name: 'E-Waste',
      image:
          'https://res.cloudinary.com/dvwsffyzc/image/upload/v1686718198/waste_jicc0a.png',
      subtitle: 'Handphone, laptops, computers, keyboards, and mouse.',
      desc: 'Handphone, laptops, computers, keyboards, and mouse.',
      manfaat: 'Handphone, laptops, computers, keyboards, and mouse.'),
];
