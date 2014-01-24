# encoding: utf-8

print "Create User"
# ============ User ============
admin = User.create email: "admin@example.com", password: "password"
admin.add_role :admin
user1 = User.create email: "user1@example.com", password: "password"
user1.add_role :user
user2 = User.create email: "user2@example.com", password: "password"
user2.add_role :user
puts " done"


print "Create Project"
# ============ Project ============
auto = Project.create name: 'PKW', description: 'Wir bauen ein Auto', user: user1
user1.add_role :projectowner, auto
project1 = Project.create name: 'Project #1', description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et...', user: admin
admin.add_role :projectowner, project1
project2 = Project.create name: 'Project #2', description: 'Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit...', user: user1
user1.add_role :projectowner, project2
puts " done"


print "Create Product Breakdown Structure"
# ============ Product Breakdown Strucutre ============
ProductBreakdownStructure.create name: project1.name, level: 0, parent: 0, order: 0, user: user1, project: project1
ProductBreakdownStructure.create name: project2.name, level: 0, parent: 0, order: 0, user: user1, project: project2
pbs_pkw = ProductBreakdownStructure.create name: auto.name, level: 0, parent: 0, order: 0, user: user1, project: auto

pbs_karosserie = ProductBreakdownStructure.create name: 'Karosserie', level: pbs_pkw.level + 1, parent: pbs_pkw.id, order: 0, user: user1, project: auto
pbs_antriebskomplex = ProductBreakdownStructure.create name: 'Antriebskomplex', level: pbs_pkw.level + 1, parent: pbs_pkw.id, order: 0, user: user1, project: auto
pbs_fahrgestell = ProductBreakdownStructure.create name: 'Fahrgestell', level: pbs_pkw.level + 1, parent: pbs_pkw.id, order: 0, user: user1, project: auto

pbs_kotfluegel = ProductBreakdownStructure.create name: 'Kotflügel', level: pbs_karosserie.level + 1, parent: pbs_karosserie.id, order: 0, user: user1, project: auto
pbs_motorhaube = ProductBreakdownStructure.create name: 'Motorhaube', level: pbs_karosserie.level + 1, parent: pbs_karosserie.id, order: 0, user: user1, project: auto
pbs_tuer = ProductBreakdownStructure.create name: 'Tür', level: pbs_karosserie.level + 1, parent: pbs_karosserie.id, order: 0, user: user1, project: auto

pbs_motorblock = ProductBreakdownStructure.create name: 'Motorblock', level: pbs_antriebskomplex.level + 1, parent: pbs_antriebskomplex.id, order: 0, user: user1, project: auto
pbs_getriebe = ProductBreakdownStructure.create name: 'Getriebe', level: pbs_antriebskomplex.level + 1, parent: pbs_antriebskomplex.id, order: 0, user: user1, project: auto

pbs_vorderachse = ProductBreakdownStructure.create name: 'Vorderachse', level: pbs_fahrgestell.level + 1, parent: pbs_fahrgestell.id, order: 0, user: user1, project: auto
pbs_hinterachse = ProductBreakdownStructure.create name: 'Hinterachse', level: pbs_fahrgestell.level + 1, parent: pbs_fahrgestell.id, order: 0, user: user1, project: auto

pbs_rad1 = ProductBreakdownStructure.create name: 'Rad #1', level: pbs_vorderachse.level + 1, parent: pbs_vorderachse.id, order: 0, user: user1, project: auto
pbs_rad2 = ProductBreakdownStructure.create name: 'Rad #2', level: pbs_vorderachse.level + 1, parent: pbs_vorderachse.id, order: 0, user: user1, project: auto
pbs_rad3 = ProductBreakdownStructure.create name: 'Rad #3', level: pbs_hinterachse.level + 1, parent: pbs_hinterachse.id, order: 0, user: user1, project: auto
pbs_rad4 = ProductBreakdownStructure.create name: 'Rad #4', level: pbs_hinterachse.level + 1, parent: pbs_hinterachse.id, order: 0, user: user1, project: auto

pbs_reifen1 = ProductBreakdownStructure.create name: 'Reifen #1', level: pbs_rad1.level + 1, parent: pbs_rad1.id, order: 0, user: user1, project: auto
pbs_felge1 = ProductBreakdownStructure.create name: 'Felge #1', level: pbs_rad1.level + 1, parent: pbs_rad1.id, order: 0, user: user1, project: auto
pbs_reifen2 = ProductBreakdownStructure.create name: 'Reifen #2', level: pbs_rad2.level + 1, parent: pbs_rad2.id, order: 0, user: user1, project: auto
pbs_felge2 = ProductBreakdownStructure.create name: 'Felge #2', level: pbs_rad2.level + 1, parent: pbs_rad2.id, order: 0, user: user1, project: auto
pbs_reifen3 = ProductBreakdownStructure.create name: 'Reifen #3', level: pbs_rad3.level + 1, parent: pbs_rad3.id, order: 0, user: user1, project: auto
pbs_felge3 = ProductBreakdownStructure.create name: 'Felge #3', level: pbs_rad3.level + 1, parent: pbs_rad3.id, order: 0, user: user1, project: auto
pbs_reifen4 = ProductBreakdownStructure.create name: 'Reifen #4', level: pbs_rad4.level + 1, parent: pbs_rad4.id, order: 0, user: user1, project: auto
pbs_felge4 = ProductBreakdownStructure.create name: 'Felge #4', level: pbs_rad4.level + 1, parent: pbs_rad4.id, order: 0, user: user1, project: auto
puts " done"


print "Create Work Breakdown Structure"
# ============ Work Breakdown Structure ============
WorkBreakdownStructure.create name: project1.name, level: 0, parent: 0, order: 0, user: user1, project: project1
WorkBreakdownStructure.create name: project2.name, level: 0, parent: 0, order: 0, user: user1, project: project2
wbs_pkw = WorkBreakdownStructure.create name: auto.name, level: 0, parent: 0, order: 0, user: user1, project: auto

wbs_karosserie = WorkBreakdownStructure.create name: 'Karosserie', level: wbs_pkw.level + 1, parent: wbs_pkw.id, order: 0, user: user1, project: auto
wbs_antriebskomplex = WorkBreakdownStructure.create name: 'Antriebskomplex', level: wbs_pkw.level + 1, parent: wbs_pkw.id, order: 0, user: user1, project: auto
wbs_fahrgestell = WorkBreakdownStructure.create name: 'Fahrgestell', level: wbs_pkw.level + 1, parent: wbs_pkw.id, order: 0, user: user1, project: auto

wbs_kotfluegel = WorkBreakdownStructure.create name: 'Kotflügel', level: wbs_karosserie.level + 1, parent: wbs_karosserie.id, order: 0, user: user1, project: auto
wbs_motorhaube = WorkBreakdownStructure.create name: 'Motorhaube', level: wbs_karosserie.level + 1, parent: wbs_karosserie.id, order: 0, user: user1, project: auto
wbs_tuer = WorkBreakdownStructure.create name: 'Tür', level: wbs_karosserie.level + 1, parent: wbs_karosserie.id, order: 0, user: user1, project: auto

wbs_motorblock = WorkBreakdownStructure.create name: 'Motorblock', level: wbs_antriebskomplex.level + 1, parent: wbs_antriebskomplex.id, order: 0, user: user1, project: auto
wbs_getriebe = WorkBreakdownStructure.create name: 'Getriebe', level: wbs_antriebskomplex.level + 1, parent: wbs_antriebskomplex.id, order: 0, user: user1, project: auto

wbs_vorderachse = WorkBreakdownStructure.create name: 'Vorderachse', level: wbs_fahrgestell.level + 1, parent: wbs_fahrgestell.id, order: 0, user: user1, project: auto
wbs_hinterachse = WorkBreakdownStructure.create name: 'Hinterachse', level: wbs_fahrgestell.level + 1, parent: wbs_fahrgestell.id, order: 0, user: user1, project: auto

wbs_rad1 = WorkBreakdownStructure.create name: 'Rad #1', level: wbs_vorderachse.level + 1, parent: wbs_vorderachse.id, order: 0, user: user1, project: auto
wbs_rad2 = WorkBreakdownStructure.create name: 'Rad #2', level: wbs_vorderachse.level + 1, parent: wbs_vorderachse.id, order: 0, user: user1, project: auto
wbs_rad3 = WorkBreakdownStructure.create name: 'Rad #3', level: wbs_hinterachse.level + 1, parent: wbs_hinterachse.id, order: 0, user: user1, project: auto
wbs_rad4 = WorkBreakdownStructure.create name: 'Rad #4', level: wbs_hinterachse.level + 1, parent: wbs_hinterachse.id, order: 0, user: user1, project: auto

wbs_reifen1 = WorkBreakdownStructure.create name: 'Reifen #1', level: wbs_rad1.level + 1, parent: wbs_rad1.id, order: 0, user: user1, project: auto
wbs_felge1 = WorkBreakdownStructure.create name: 'Felge #1', level: wbs_rad1.level + 1, parent: wbs_rad1.id, order: 0, user: user1, project: auto
wbs_reifen2 = WorkBreakdownStructure.create name: 'Reifen #2', level: wbs_rad2.level + 1, parent: wbs_rad2.id, order: 0, user: user1, project: auto
wbs_felge2 = WorkBreakdownStructure.create name: 'Felge #2', level: wbs_rad2.level + 1, parent: wbs_rad2.id, order: 0, user: user1, project: auto
wbs_reifen3 = WorkBreakdownStructure.create name: 'Reifen #3', level: wbs_rad3.level + 1, parent: wbs_rad3.id, order: 0, user: user1, project: auto
wbs_felge3 = WorkBreakdownStructure.create name: 'Felge #3', level: wbs_rad3.level + 1, parent: wbs_rad3.id, order: 0, user: user1, project: auto
wbs_reifen4 = WorkBreakdownStructure.create name: 'Reifen #4', level: wbs_rad4.level + 1, parent: wbs_rad4.id, order: 0, user: user1, project: auto
wbs_felge4 = WorkBreakdownStructure.create name: 'Felge #4', level: wbs_rad4.level + 1, parent: wbs_rad4.id, order: 0, user: user1, project: auto
puts " done"


print "Create Work Packages"
# ============ Work Packages ============
wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_kotfluegel.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_kotfluegel.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_kotfluegel.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_kotfluegel.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_kotfluegel.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_kotfluegel.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorhaube.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorhaube.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorhaube.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorhaube.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorhaube.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorhaube.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_tuer.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_tuer.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_tuer.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_tuer.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_tuer.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_tuer.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorblock.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorblock.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorblock.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorblock.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorblock.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_motorblock.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_getriebe.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_getriebe.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_getriebe.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_getriebe.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_getriebe.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_getriebe.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_reifen4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge1.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge2.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge3.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'

wp_01 = WorkPackage.create name: 'Entwurf', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_02 = WorkPackage.create name: 'Konstruktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_03 = WorkPackage.create name: 'Produktion', parent: 0, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_04 = WorkPackage.create name: 'Komponentenentwurf', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_05 = WorkPackage.create name: 'Komponententest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
wp_06 = WorkPackage.create name: 'Implementierungstest', parent: wp_02.id, start: Date.today, end: Date.today + 3, cost: 100, work_breakdown_structure_id: wbs_felge4.id, project: auto, user: user1, risk: :medium, description: 'Lorem ipsum dolor sit amet,...', resources: 'Lorem ipsum dolor sit amet,...', target: 'Lorem ipsum dolor sit amet,...'
puts " done"


print "Create Qualification"
# ============ Qualification ============
pmp = Qualification.create name: 'PMP', experience: '> 3 Jahre Projektleiter', user: user1, project: auto
pmc = Qualification.create name: 'Project Management Certificate', experience: 'Junior', user: user1, project: auto
bac = Qualification.create name: 'Business Analyst Certificate', experience: '> 3 Jahre Product Manager', user: user1, project: auto
sac = Qualification.create name: 'System Analyst Certificate', experience: '> 3 Jahre Software Engineering', user: user1, project: auto
sec200 = Qualification.create name: 'Level 200 Software Engineer Certificate', experience: '', user: user1, project: auto
sec300 = Qualification.create name: 'Level 300 Software Engineer Certificate', experience: '> 3 Jahre', user: user1, project: auto
sec400 = Qualification.create name: 'Level 400 Software Engineer Certificate', experience: '> 6 Jahre', user: user1, project: auto
dec200 = Qualification.create name: 'Level 200 Database Engineer Certificate', experience: '', user: user1, project: auto
dec300 = Qualification.create name: 'Level 300 Database Engineer Certificate', experience: '> 3 Jahre', user: user1, project: auto
nac200 = Qualification.create name: 'Level 200 Network Admin Certificate', experience: '', user: user1, project: auto
nac300 = Qualification.create name: 'Level 300 Network Admin Certificate', experience: '> 3 Jahre', user: user1, project: auto
dcoc300 = Qualification.create name: 'Level 300 Data Center Ops Certificate', experience: '> 3 Jahre', user: user1, project: auto
dcoc400 = Qualification.create name: 'Level 400 Data Center Ops Certificate', experience: '> 6 Jahre', user: user1, project: auto
puts " done"


# print "Create Resource Breakdown Structure"
# # ============ Resource Breakdown Structure ============
# rbs = ResourceBreakdownStructure.create resource_type: :personal_intern, role: "Projektleiter", qualification: pmp, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_intern, role: "Projektcontroller", qualification: pmc, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_intern, role: "Geschäftsanalytiker", qualification: bac, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_intern, role: "Systemanalytiker", qualification: sac, count: 1, amount: 100, project: auto

# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Entwicklungsleiter", qualification: sec400, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Technischer Architekt", qualification: sec400, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Datenbankentwickler", qualification: dec200, count: 2, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Datenbankentwickler", qualification: dec300, count: 2, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Sofwareentwickler", qualification: sec200, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Sofwareentwickler", qualification: sec300, count: 3, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Sofwareentwickler", qualification: sec300, count: 3, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Netzwerkentwickler", qualification: nac200, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Netzwerkentwickler", qualification: nac300, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Operator", qualification: dcoc300, count: 1, amount: 100, project: auto
# rbs = ResourceBreakdownStructure.create resource_type: :personal_extern, role: "Operator", qualification: dcoc400, count: 1, amount: 100, project: auto
# puts " done"

print "Create Resource Breakdown Structure"
# ============ Resource Breakdown Structure ============
ResourceBreakdownStructure.create name: project1.name, level: 0, parent: 0, order: 0, user: user1, resource: :personal, resource_type: :intern, project: project1
ResourceBreakdownStructure.create name: project2.name, level: 0, parent: 0, order: 0, user: user1, resource: :personal, resource_type: :intern, project: project2
rbs_pkw = ResourceBreakdownStructure.create name: auto.name, level: 0, parent: 0, order: 0, user: user1, resource: :personal, resource_type: :intern, project: auto

rbs1 = ResourceBreakdownStructure.create name: "Projektleiter", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :intern, project: auto
rbs2 = ResourceBreakdownStructure.create name: "Projektcontroller", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :intern, project: auto
rbs3 = ResourceBreakdownStructure.create name: "Geschäftsanalytiker", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :intern, project: auto
rbs4 = ResourceBreakdownStructure.create name: "Systemanalytiker", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :intern, project: auto

rbs5 = ResourceBreakdownStructure.create name: "Entwicklungsleiter", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :extern, project: auto
rbs6 = ResourceBreakdownStructure.create name: "Technischer Architekt", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :extern, project: auto
rbs7 = ResourceBreakdownStructure.create name: "Datenbankentwickler", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :extern, project: auto
rbs8 = ResourceBreakdownStructure.create name: "Sofwareentwickler", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :extern, project: auto
rbs9 = ResourceBreakdownStructure.create name: "Netzwerkentwickler", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :extern, project: auto
rbs10 = ResourceBreakdownStructure.create name: "Operator", level: rbs_pkw.level + 1, parent: rbs_pkw.id, order: 0, user: user1, resource: :personal, resource_type: :extern, project: auto
puts " done"

print "Create Resource"
# ============ Resource ============
Resource.create qualification: pmp, resource_breakdown_structure: rbs1, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: pmc, resource_breakdown_structure: rbs2, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: bac, resource_breakdown_structure: rbs3, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: sac, resource_breakdown_structure: rbs4, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: sec400, resource_breakdown_structure: rbs5, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: sec400, resource_breakdown_structure: rbs6, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: dec200, resource_breakdown_structure: rbs7, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: dec300, resource_breakdown_structure: rbs7, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: sec200, resource_breakdown_structure: rbs8, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: sec300, resource_breakdown_structure: rbs8, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: sec400, resource_breakdown_structure: rbs8, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: nac200, resource_breakdown_structure: rbs9, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: nac300, resource_breakdown_structure: rbs9, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: dcoc300, resource_breakdown_structure: rbs10, count: 1, amount: 100, user: user1, project: auto
Resource.create qualification: dcoc400, resource_breakdown_structure: rbs10, count: 1, amount: 100, user: user1, project: auto
puts " done"

print "Create Milestone"
# ============ Milestone ============
m = Milestone.create name: 'Fahrgestell', user: user1, project: auto, end_date: Date.today + 3.days, description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et...'
m.product_breakdown_structures << [ pbs_reifen1, pbs_reifen2, pbs_reifen3, pbs_reifen4, pbs_felge1, pbs_felge2, pbs_felge3, pbs_felge4 ]
m = Milestone.create name: 'Antriebskomplex', user: user1, project: auto, end_date: Date.today, description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et...'
m.product_breakdown_structures << [ pbs_motorblock, pbs_getriebe ]
m = Milestone.create name: 'Karosserie', user: user1, project: auto, end_date: Date.today + 5.days, description: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et...'
m.product_breakdown_structures << [ pbs_kotfluegel, pbs_motorhaube, pbs_tuer ]
puts " done"